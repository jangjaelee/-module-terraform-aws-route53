variable "vpc_name" {
  description = "Name to be used on all the resources as identifier for VPC"
  type        = string
}

variable "create_public_zone" {
  description = "Controls if Public Zone should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "create_private_zone" {
  description = "Controls if Private Zone should be created (it affects almost all resources)"
  type        = bool
  default     = false
}

variable "public_domains" {
  description = "name of Public domains"
  type        = list(string)
  #default     = ""
}

variable "private_domains" {
  description = "name of Private domains"
  type        = list(string)
  #default     = [""]
}

variable "env" {
  description = "Environment"
  type = string
}