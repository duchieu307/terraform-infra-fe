resource "aws_s3_bucket" "bucket_artifact" {
  bucket = "${var.project}-${var.env}-codepipeline-bucket"
}

resource "aws_iam_role" "pipeline_role" {
  name = "${var.project}-${var.env}-codepipeline-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_codepipeline" "codepipeline" {
  name     = "${var.project}-${var.env}-${var.gitRepo}"
  role_arn = aws_iam_role.pipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.bucket_artifact.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["Source_Artifacts"]

      configuration = {
        Owner      = var.owner
        Repo       = var.gitRepo
        Branch     = var.gitBranch
        OAuthToken = var.OAuthToken
      }
    }
  }

  #   stage {
  #     name = "Build"

  #     action {
  #       name             = "Build"
  #       category         = "Build"
  #       owner            = "AWS"
  #       provider         = "CodeBuild"
  #       input_artifacts  = ["Source_Artifacts"]
  #       output_artifacts = ["Build_Artifacts"]
  #       version          = "1"

  #     }
  #   }
}
