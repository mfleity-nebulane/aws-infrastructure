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

variable "subnet_tags" {
  description = "Tags applied to public subnets"
  type        = map(string)
  default = {
    Name = "prod-public-subnet"
    Env  = "prod"
  }
}

variable "sg_tags" {
  description = "Tags applied to the default security group"
  type        = map(string)
  default = {
    Name = "prod-default-sg"
    Env  = "prod"
  }
}

variable "igw_tags" {
  description = "Tags applied to the Internet Gateway"
  type        = map(string)
  default = {
    Name = "prod-igw"
    Env  = "prod"
  }
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 launch template"
  type        = string
  default     = "ami-063d8bb8bb51a5441"
}

variable "ec2_instance_type" {
  description = "EC2 instance type for the launch template"
  type        = string
  default     = "t3.medium"
}

variable "ec2_key_name" {
  description = "SSH key pair name for EC2 instances"
  type        = string
  default     = "mfleity-pem"
}

variable "ec2_user_data" {
  description = "User data script for EC2 instances (base64-encoded if required)"
  type        = string
  default     = ""
}

variable "ec2_iam_instance_profile_arn" {
  description = "IAM instance profile ARN used by the launch template"
  type        = string
  default     = "arn:aws:iam::600878681787:instance-profile/sc1-wp-ec2-ssm-cw-access"
}

variable "ec2_launch_template_name" {
  description = "Name of the EC2 launch template"
  type        = string
  default     = "sc1-template-ec2-1"
}

variable "ec2_autoscaling_group_name" {
  description = "Name of the EC2 autoscaling group"
  type        = string
  default     = "ac1-wp-asg-1"
}

variable "ec2_service_linked_role_arn" {
  description = "Service-linked role ARN for autoscaling"
  type        = string
  default     = "arn:aws:iam::600878681787:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
}

variable "ec2_scenario_tag" {
  description = "Value for the 'scenario' tag applied to EC2 resources"
  type        = string
  default     = "sc1"
}

variable "ec2_availability_zones" {
  description = "Availability zones used by the autoscaling group"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1c"]
}

variable "ec2_target_group_arns" {
  description = "Target group ARNs the autoscaling group will register instances with"
  type        = list(string)
  default     = [
    "arn:aws:elasticloadbalancing:us-west-1:600878681787:targetgroup/sc1-tg-ec2/34c53f2e3402890d",
  ]
}

variable "ec2_tags" {
  description = "Tags applied to EC2-related resources"
  type        = map(string)
  default = {
    scenario = "sc1"
    Env      = "prod"
  }
}
