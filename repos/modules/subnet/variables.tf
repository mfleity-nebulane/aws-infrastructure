variable "vpc_id" {
  description = "ID of the VPC to create the subnet in"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IPs on instance launch"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the subnet"
  type        = map(string)
  default     = {}
}
