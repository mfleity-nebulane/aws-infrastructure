variable "region" {
  description = "AWS region for this environment"
  type        = string
  default     = "us-west-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC in this environment"
  type        = string
  default     = "172.31.0.0/16"
}

variable "vpc_tags" {
  description = "Tags applied to the VPC"
  type        = map(string)
  default = {
    Name = "prod-vpc"
    Env  = "prod"
  }
}
