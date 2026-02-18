variable "vpc_id" {
  description = "ID of the VPC to create the subnet in"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the subnet"
  type        = map(string)
  default     = {}
}
