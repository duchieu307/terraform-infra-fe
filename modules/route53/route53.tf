resource "aws_route53_record" "fe_domain" {
  zone_id = var.hosted_zone_public_id
  name    = var.fe_domain
  type    = "A"

  alias {
    name                   = var.cf_distribution_domain_name
    zone_id                = var.cf_distribution_hosted_zone_id
    evaluate_target_health = false
  }
}
