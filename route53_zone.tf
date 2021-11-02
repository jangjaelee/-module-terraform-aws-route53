resource "aws_route53_zone" "public" {
  for_each      = var.create_public_zone ? toset(var.public_domains) : []
  
  name          = format("%s", each.key)
  comment       = format("Public DNS - %s", each.key)
  force_destroy = false

  tags = merge(
    {
      "Name" = format("%s-r53_zone", each.key)
    },
    local.common_tags,
  ) 
}

#resource "aws_route53_recored" "awx-www" {
#  zone_id = aws_route53_zone.r53-public.id
#  name    = "" 
#  type    = "A"
#  ttl     = "60"
#  #records = aws_eip.
#}

resource "aws_route53_zone" "private" {
  for_each      = var.create_private_zone ? toset(var.private_domains) : []
  
  name          = format("%s", each.key)
  comment       = format("Private DNS - %s", each.key)
  force_destroy = true

  vpc {
    vpc_id = data.aws_vpc.this.id
  }

  tags = merge(
    {
      "Name" = format("%s-r53_zone", each.key)
    },
    local.common_tags,
  ) 
}

# 참조
#resource "aws_route53_zone_association" "r53-private" {
#  zone_id = aws_route53_zone.r53-private-awx.id
#  vpc_id  = aws_vpc.vpc-awx.id
#}