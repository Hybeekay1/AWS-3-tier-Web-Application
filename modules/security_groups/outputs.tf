
output "lb_sg_id" {
  value = aws_security_group.lb_sg.id
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}


