resource "aws_subnet" "public_a" {
  vpc_id                                         = var.vpc_id
  cidr_block                                     = "172.31.16.0/20"
  map_public_ip_on_launch                        = true
  assign_ipv6_address_on_creation                = false
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = var.tags
}

resource "aws_subnet" "public_b" {
  vpc_id                                         = var.vpc_id
  cidr_block                                     = "172.31.0.0/20"
  map_public_ip_on_launch                        = true
  assign_ipv6_address_on_creation                = false
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = var.tags
}
