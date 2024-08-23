
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "db_subnets" {
  description = "List of DB subnets"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security Group ID for RDS"
  type        = string
}

variable "db_identifier" {
  description = "DB instance identifier"
  type        = string
}

variable "db_username" {
  description = "Master username for the DB instance"
  type        = string
}

# variable "db_password" {
#   description = "Master password for the DB instance"
#   type        = string
#   sensitive   = true
# }