
output "alb_dns_name" {
  value = aws_lb.webapp.dns_name
}

output "alb_zone_id" {
  value = aws_lb.webapp.zone_id
}

output "lb_target_group_arn" {
  value = aws_lb_target_group.webapp.arn
}