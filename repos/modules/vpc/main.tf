resource "aws_vpc" "this" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = var.cidr_block
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = 0

  tags = var.tags
}
