variable "ami" {
  description = "AMI ID for the EC2 instances in the launch template"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with instances"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the autoscaling group"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data script for the instances"
  type        = string
  default     = ""
}

variable "iam_instance_profile_arn" {
  description = "ARN of the IAM instance profile for the launch template"
  type        = string
}

variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
}

variable "autoscaling_group_name" {
  description = "Name of the autoscaling group"
  type        = string
}

variable "service_linked_role_arn" {
  description = "Service-linked role ARN for autoscaling"
  type        = string
}

variable "scenario_tag" {
  description = "Value for the 'scenario' tag applied to instances"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for the autoscaling group"
  type        = list(string)
}

variable "target_group_arns" {
  description = "Target group ARNs for the autoscaling group"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to instances and related resources"
  type        = map(string)
  default     = {}
}
