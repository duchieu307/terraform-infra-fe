resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "${var.project}-${var.env}-codepipeline-bucket-hix"
}

resource "aws_codebuild_project" "codebuild" {
  name         = "${var.project}-${var.env}-${var.gitRepo}"
  service_role = var.codebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = var.codebuild_image
    image           = var.codebuild_compute_type
    privileged_mode = true
    type            = "LINUX_CONTAINER"
  }
  source {
    type = "CODEPIPELINE"
    # buildspec = var.codebuild_buildspec
  }
}


resource "aws_codepipeline" "codepipeline" {
  name     = "${var.project}-${var.env}-${var.gitRepo}"
  role_arn = var.codepipeline_role_arn

  artifact_store {
    location = aws_s3_bucket.artifact_bucket.bucket
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

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["Source_Artifacts"]
      output_artifacts = ["Build_Artifacts"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.codebuild.name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["Build_Artifacts"]
      # output_artifacts = ["build_output_cached"]
      version = "1"


      configuration = {
        BucketName = "${var.s3_frontend_bucket_name}"
        Extract    = "true"
      }
    }
  }
}


# A shared secret between GitHub and AWS that allows AWS
# CodePipeline to authenticate the request came from GitHub.
# Would probably be better to pull this from the environment
# or something like SSM Parameter Store.
# resource "random_string" "secret_token" {
#   length  = 99
#   special = false
# }

# resource "aws_codepipeline_webhook" "bar" {
#   name            = "${var.project}-${var.env}-webhook"
#   authentication  = "GITHUB_HMAC"
#   target_action   = "Source"
#   target_pipeline = aws_codepipeline.codepipeline.name

#   authentication_configuration {
#     secret_token = random_string.secret_token.result
#   }

#   filter {
#     json_path    = "$.ref"
#     match_equals = "refs/heads/{Branch}"
#   }
# }


# ## Wire the CodePipeline webhook into a GitHub repository.
# resource "github_repository_webhook" "bar" {
#   repository = var.gitRepo

#   configuration {
#     url          = aws_codepipeline_webhook.bar.url
#     content_type = "form"
#     insecure_ssl = true
#     secret = "${random_string.secret_token.result
#     }}"
#   }

#   events = ["push"]
# }

