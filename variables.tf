variable "name" {
  description = "The name of the policy."
}

variable "autoscaling_group_name" {
  description = "The name of the autoscaling group."
}

variable "adjustment_type" {
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity."
  default     = "null"
}

variable "policy_type" {
  description = "The policy type, either SimpleScaling, StepScaling or TargetTrackingScaling."
  default     = "SimpleScaling"
}

variable "estimated_instance_warmup" {
  description = "The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value,"
  default     = null
  type        = number
}



## SimpleScaling

variable "cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
  default     = 0
  type        = number
}

variable "scaling_adjustment" {
  description = "The number of instances by which to scale"
  default     = null
  type        = number
}

## StepScaling
variable "metric_aggregation_type" {
  description = "The aggregation type for the policy's metrics"
  default     = "Average"
}

variable "step_adjustment" {
  description = "A set of adjustments that manage group scaling"
  default     = []
  type        = any
}

## TargetTrackingScaling
variable "target_tracking_configuration" {
  description = " A target tracking policy"
  default     = {}
  type        = any
}
