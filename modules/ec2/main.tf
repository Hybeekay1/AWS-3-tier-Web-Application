# Retrieve the latest Amazon Linux 2 AMI in the current region
data "aws_ami" "amazon-linux2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}

resource "aws_launch_template" "webapp" {
  name_prefix   = "webapp-"
  image_id      = data.aws_ami.amazon-linux2.id
  instance_type = "t2.micro"
  
  # Removed vpc_security_group_ids as it's not needed with network_interfaces
  # vpc_security_group_ids = [var.ec2_sg_id]

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.ec2_sg_id]   # Specify security group here
    # subnet_id                   = element(var.private_subnets, 0)
  }
  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  user_data = base64encode(file("../modules/ec2/user_data.sh"))

  tags = {
    Name = "webapp-instance"
  }
}

resource "aws_autoscaling_group" "webapp" {
  desired_capacity     = 2
  max_size             = 5
  min_size             = 1
  health_check_type = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier  = var.private_subnets
  target_group_arns    = [var.lb_target_group_arn]

  launch_template {
    id      = aws_launch_template.webapp.id
    version = "$Latest"
  }
}

# Create Auto scaling attachment
resource "aws_autoscaling_attachment" "LabVCPALBAutoScalingAttach" {
  autoscaling_group_name = aws_autoscaling_group.webapp.id
  lb_target_group_arn    = var.lb_target_group_arn
}
