output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.requestTracker.name
}

output "cloudwatch_dashboard_name" {
  description = "The name of the CloudWatch Dashboard"
  value       = aws_cloudwatch_dashboard.api_dashboard.dashboard_name
}
