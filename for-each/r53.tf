resource "aws_route53_record" "expense" { #aws r53 terraform
  for_each = aws_instance.web
  zone_id         = var.zone_id
  name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         =  each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}
