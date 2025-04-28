output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = aws_elb.web_elb.dns_name
}

output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web_asg.name
}

output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.web_template.id
}