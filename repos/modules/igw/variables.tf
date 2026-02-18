variable "vpc_id" {
  description = "ID of the VPC to attach the Internet Gateway to"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Internet Gateway"
  type        = map(string)
  default     = {}
}
