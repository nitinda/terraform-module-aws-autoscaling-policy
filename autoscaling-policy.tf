resource "aws_autoscaling_policy" "autoscaling_policy" {
  name                      = var.name
  autoscaling_group_name    = var.autoscaling_group_name
  adjustment_type           = var.adjustment_type
  scaling_adjustment        = var.scaling_adjustment
  estimated_instance_warmup = var.estimated_instance_warmup

  ## SimpleScaling ##
  cooldown           = var.cooldown
  scaling_adjustment = var.scaling_adjustment

  ## StepScaling ##
  metric_aggregation_type = var.metric_aggregation_type
  dynamic "step_adjustment" {
    for_each = var.step_adjustment
    content {
      metric_interval_lower_bound = lookup(step_adjustment.value, "metric_interval_lower_bound", null)
      metric_interval_upper_bound = lookup(step_adjustment.value, "metric_interval_upper_bound", null)
      scaling_adjustment          = step_adjustment.value.scaling_adjustment
    }
  }

  ## TargetTrackingScaling ##
  dynamic "target_tracking_configuration" {
    for_each = var.target_tracking_configuration == {} ? [] : [var.target_tracking_configuration]
    content {
      disable_scale_in = lookup(target_tracking_configuration.value, "disable_scale_in", null)
      target_value     = target_tracking_configuration.value.target_value

      dynamic "customized_metric_specification" {
        for_each = lookup(target_tracking_configuration.value, "customized_metric_specification", [])
        content {
          metric_name = customized_metric_specification.value.metric_name
          namespace   = customized_metric_specification.value.namespace
          statistic   = customized_metric_specification.value.statistic
          unit        = lookup(customized_metric_specification.value, "unit", null)

          dynamic "metric_dimension" {
            for_each = lookup(customized_metric_specification.value, "metric_dimension", [])
            content {
              name  = metric_dimension.value.name
              value = metric_dimension.value.value
            }
          }
        }
      }

      dynamic "predefined_metric_specification" {
        for_each = lookup(target_tracking_configuration.value, "predefined_metric_specification", [])
        content {
          predefined_metric_type = predefined_metric_specification.value.predefined_metric_type
          resource_label         = lookup(predefined_metric_specification.value, "resource_label", null)
        }
      }
    }
  }
}

