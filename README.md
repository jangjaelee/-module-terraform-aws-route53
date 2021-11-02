# Amazon Route 53 Terraform module

Terraform module which creates Route53 resources on AWS.

These types of resources are supported:

* [zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone)
* [records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record)


## Usage
### Create Route 53 zones

main.tf
```hcl
module "route53" {
  source = "git@github.com:jangjaelee/terraform-aws-route53.git"

  vpc_name = local.vpc_name
  
  create_public_zone  = true
  create_private_zone = true
  
  public_domains = ["awx.kr, "kubesphere.kr"]
  private_domains = ["awx.internal", "kubesphere.internal"]
  
  env = "dev"
}
```

locals.tf
```hcl
locals {
  vpc_name = "KubeSphere-dev"
  cluster_name = "KubeSphere-v121-dev"
  cluster_version = "1.21"
}
```

providers.tf
```hcl
provider "aws" {
  version = ">= 3.2.0"
  region = var.region
  allowed_account_ids = var.account_id
  profile = "eks_service"
}
```

terraform.tf
```hcl
terraform {
  required_version = ">= 0.13.0"

  backend "s3" {
    bucket = "kubesphere-terraform-state-backend"
    key = "kubesphere/route53/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "kubesphere-terraform-state-locks"
    encrypt = true
    profile = "eks_service"
  }
}
```

variables.tf
```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "account_id" {
  description = "List of Allowed AWS account IDs"
  type        = list(string)
  default     = ["123456789012"]
}
```
