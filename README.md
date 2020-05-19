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
| **_adjustment\_type_** | _Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are_ **_ChangeInCapacity_**, **_ExactCapacity_**_, and_ **_PercentChangeInCapacity_** | _string_ | **_Optional_** |
| **_policy\_type_** | _The policy type, either_ **_"SimpleScaling"_**, **_"StepScaling"_** _or_ **_"TargetTrackingScaling"_**_. If this value isn't provided, AWS will default to **_"SimpleScaling"_**_ | _string_ | **_Optional_** | **_SimpleScaling_** |
| **_estimated\_instance\_warmup_** | _The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period._ | _number_ | **_Optional_** | **_30_** |




> **_NOTE_**_: If you specify at least one metric_query, you may not specify a metric_name, namespace, period or statistic. If you do not specify a metric_query, you must specify each of these (although you may use extended_statistic instead of statistic)._


---

## _Outputs_

### _General_

_This module has the following outputs:_

_The ARN of the cloudwatch metric alarm_
* **_arn_**

_The ID of the health check_
* **_id_**


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
