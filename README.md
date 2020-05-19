# _Terraform Module: terraform-module-aws-autoscaling-policy_

_Terraform Module for_ **_AWS AutoScaling Scaling Policy_**


<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>
> _This examples does is built on Construct Libraries marked "Stable" and does not have any infrastructure prerequisites to build._

---
<!--END STABILITY BANNER-->



## _General_

_This module may be used to create_ **_AWS AutoScaling Scaling Policy_** _resources in AWS cloud provider......_



---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.19_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._



---


## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

* **_AWS AutoScaling Scaling Policy_**


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

> **_NOTE_**_: You may want to omit desired_capacity attribute from attached aws_autoscaling_group when using autoscaling policies. It's good practice to pick either [manual](https://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-manual-scaling.html) or [dynamic](https://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/as-scale-based-on-demand.html) (policy-based) scaling._

* **_Example Usage_**

```tf
module "autoscaling_policy" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-policy.git?ref=master"

  providers = {
    aws = aws.services
  }

  
}
```


---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_

> **_NOTE_**_: You cannot create a metric alarm consisting of both statistic and extended_statistic parameters. You must choose one or the other_




|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|:---:|:---:|
| **_name_** | _The name of the policy_ | _string_ | **_Required_** |
| **_autoscaling\_group\_name_** | _The name of the autoscaling group_ | _string_ | **_Required_** |
| **_adjustment\_type_** | _Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are_ **_ChangeInCapacity_**, **_ExactCapacity_**_, and_ **_PercentChangeInCapacity_** | _string_ | **_Optional_** | **_null_** |
| **_policy\_type_** | _The policy type, either_ **_"SimpleScaling"_**, **_"StepScaling"_** _or_ **_"TargetTrackingScaling"_**_. If this value isn't provided, AWS will default to **_"SimpleScaling"_**_ | _string_ | **_Optional_** | **_SimpleScaling_** |
| **_estimated\_instance\_warmup_** | _The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period._ | _number_ | **_Optional_** | **_30_** |




> _The following arguments are only available to_ **_"SimpleScaling"_** _type policies:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|:---:|:---:|
| **_cooldown_** | _The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start_ | _number_ | **_Optional_** | **_0_** |
| **_scaling\_adjustment_** | _The number of instances by which to scale. adjustment\_type determines the interpretation of this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity._ | _string_ | **_Optional_** | **_null_** |


> _The following arguments are only available to_ **_"StepScaling"_** _type policies:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|:---:|:---:|
| **_scaling\_adjustment_** | _The aggregation type for the policy's metrics. Valid values are_ **_"Minimum"_**, **_"Maximum"_**_, and_ **_"Average"_**_. Without a value, AWS will treat the aggregation type as "Average"._ | _string_ | **_Optional_** | **_Average_** |
| **_step\_adjustment_** | _A set of adjustments that manage group scaling._ | _any_ | **_Optional_** | **_[]_** |

```tf
step_adjustment {
    metric_interval_lower_bound = 0
    metric_interval_upper_bound = 50
    scaling_adjustment = 1
}

step_adjustment {
    metric_interval_lower_bound = 50
    scaling_adjustment = 2
}
```

> _The following fields are available in step adjustments:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|:---:|:---:|
| **_scaling\_adjustment_** | _The number of members by which to scale, when the adjustment bounds are breached. A positive value scales up. A negative value scales down._ | _string_ | **_Required_** |
| **_metric\_interval\_lower\_bound_** | _The lower bound for the difference between the alarm threshold and the CloudWatch metric. Without a value, AWS will treat this bound as infinity._ | _string_ | **_Optional_** | **_null_** |
| **_metric\_interval\_upper\_bound_** | _The upper bound for the difference between the alarm threshold and the CloudWatch metric. Without a value, AWS will treat this bound as infinity. The upper bound must be greater than the lower bound._ | _string_ | **_Optional_** | **_null_** |


> _The following arguments are only available to_ **_"TargetTrackingScaling"_** _type policies:_

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|:---:|:---:|
| **_target\_tracking\_configuration_** | _A target tracking policy. These have the following structure._ | _any_ | **_Optional_** |

```tf
target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
  }

  target_value = 40.0
}

target_tracking_configuration {
  customized_metric_specification {
    metric_dimension {
      name  = "fuga"
      value = "fuga"
    }

    metric_name = "hoge"
    namespace   = "hoge"
    statistic   = "Average"
  }

  target_value = 40.0
}
```


---

## _Outputs_

### _General_

_This module has the following outputs:_

_The ARN assigned by AWS to the scaling policy_ : * **_arn_**

_The scaling policy's name_ : **_name_**

_The scaling policy's adjustment type_ : **_adjustment\_type_**

_The scaling policy's type_ : **_policy\_type_**
---


### _Usage_

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>

```

---

## Authors
_Module maintained by Module maintained by the -_ **_Nitin Das_**
