module "vpc" {
  source = "../../modules/vpc"

  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}

module "subnets" {
  source = "../../modules/subnet"

  vpc_id = module.vpc.vpc_id
  tags   = var.subnet_tags
}

module "security_group" {
  source = "../../modules/sg"

  vpc_id = module.vpc.vpc_id
  tags   = var.sg_tags
}

module "igw" {
  source = "../../modules/igw"

  vpc_id = module.vpc.vpc_id
  tags   = var.igw_tags
}

module "ec2_asg" {
  source = "../../modules/ec2"

  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_ids             = [
    module.subnets.public_a_subnet_id,
    module.subnets.public_b_subnet_id,
  ]

  key_name                   = var.ec2_key_name
  user_data                  = var.ec2_user_data
  iam_instance_profile_arn   = var.ec2_iam_instance_profile_arn
  launch_template_name       = var.ec2_launch_template_name
  autoscaling_group_name     = var.ec2_autoscaling_group_name
  service_linked_role_arn    = var.ec2_service_linked_role_arn
  scenario_tag               = var.ec2_scenario_tag
  availability_zones         = var.ec2_availability_zones
  target_group_arns          = var.ec2_target_group_arns
  tags                       = var.ec2_tags
}
