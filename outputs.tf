output "public_zones" {
  value = [for i in aws_route53_zone.public : i.zone_id]
}

output "private_zones" {
  value = [for j in aws_route53_zone.private : j.zone_id]
}