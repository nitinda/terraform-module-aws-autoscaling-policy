output "arn" {
  value = aws_autoscaling_policy.autoscaling_policy.arn
}

output "name" {
  value = aws_autoscaling_policy.autoscaling_policy.name
}

output "adjustment_type" {
  value = aws_autoscaling_policy.autoscaling_policy.adjustment_type
}

output "policy_type" {
  value = aws_autoscaling_policy.autoscaling_policy.policy_type
}