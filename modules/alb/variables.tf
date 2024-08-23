
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "lb_sg_id" {
  description = "Security Group ID for ALB"
  type        = string
}