resource "aws_launch_template" "this" {
  description             = "adding cw monitoring"
  disable_api_stop        = false
  disable_api_termination = false

  iam_instance_profile {
    arn = var.iam_instance_profile_arn
  }

  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  name          = var.launch_template_name

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }

  tags = var.tags

  user_data              = var.user_data
  vpc_security_group_ids = var.vpc_security_group_ids
}

resource "aws_autoscaling_group" "this" {
  availability_zones = var.availability_zones

  availability_zone_distribution {
    capacity_distribution_strategy = "balanced-best-effort"
  }

  capacity_rebalance = false

  capacity_reservation_specification {
    capacity_reservation_preference = "default"
  }

  default_cooldown          = 300
  default_instance_warmup   = 0
  desired_capacity          = 0
  enabled_metrics           = [
    "GroupPendingInstances",
    "WarmPoolPendingCapacity",
    "WarmPoolTotalCapacity",
    "GroupPendingCapacity",
    "GroupInServiceInstances",
    "GroupMinSize",
    "GroupTotalInstances",
    "WarmPoolDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
    "GroupTerminatingInstances",
    "GroupStandbyCapacity",
    "GroupDesiredCapacity",
    "GroupInServiceCapacity",
    "GroupTotalCapacity",
    "GroupAndWarmPoolDesiredCapacity",
    "GroupTerminatingCapacity",
    "GroupMaxSize",
    "GroupStandbyInstances",
    "WarmPoolMinSize",
    "WarmPoolTerminatingCapacity",
    "WarmPoolWarmedCapacity",
  ]
  force_delete              = false
  health_check_grace_period = 300
  health_check_type         = "ELB"

  instance_maintenance_policy {
    max_healthy_percentage = 100
    min_healthy_percentage = 90
  }

  launch_template {
    id      = aws_launch_template.this.id
    name    = aws_launch_template.this.name
    version = "$Latest"
  }

  max_instance_lifetime   = 0
  max_size                = 0
  metrics_granularity     = "1Minute"
  min_size                = 0
  name                    = var.autoscaling_group_name
  protect_from_scale_in   = false
  service_linked_role_arn = var.service_linked_role_arn

  tag {
    key                 = "scenario"
    propagate_at_launch = true
    value               = var.scenario_tag
  }

  target_group_arns = var.target_group_arns

  traffic_source {
    identifier = var.target_group_arns[0]
    type       = "elbv2"
  }

  vpc_zone_identifier       = var.subnet_ids
  wait_for_capacity_timeout = "10m"
}
