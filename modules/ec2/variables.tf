
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "ec2_sg_id" {
  description = "Security Group ID for EC2 instances"
  type        = string
}

# variable "key_name" {
#   description = "Name of the SSH key pair"
#   type        = string
# }


variable "lb_target_group_arn" {
  
}

variable "iam_instance_profile_name" {
  
}

