output "dns" {
  description = "DNS endpoint for application load balancer."
  value       = aws_lb.main.dns_name
}
