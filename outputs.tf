output "route53-public" {
  value = aws_route53_zone.r53-public.zone_id
}

output "route53-private" {
  value = aws_route53_zone.r53-private.zone_id
}
