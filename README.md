# Cloudwatch Lambda API Gateway Metrics Module

Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%! Check it out at <https://seventechnologies.cloud>

Please star rank this repo if you like our job!

## Usage

* This module creates cloudwatch metrics and dashboard to analyse lambda function and API gateway


## Example

```hcl
module "cloudwatch" {
  source                 = "../../"
  LAMBDA_FUNCTION_NAME   = var.LAMBDA_FUNCTION_NAME
  API_NAME               = var.API_NAME
  DASHBOARD_NAME         = var.DASHBOARD_NAME
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_dashboard.api_dashboard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_cloudwatch_log_group.requestTracker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_API_NAME"></a> [API\_NAME](#input\_API\_NAME) | The name of the API in API Gateway | `string` | n/a | yes |
| <a name="input_CLOUDWATCH_LOGS_RETENTION_IN_DAYS"></a> [CLOUDWATCH\_LOGS\_RETENTION\_IN\_DAYS](#input\_CLOUDWATCH\_LOGS\_RETENTION\_IN\_DAYS) | Specify the retention period for logs (in days) | `number` | `30` | no |
| <a name="input_DASHBOARD_NAME"></a> [DASHBOARD\_NAME](#input\_DASHBOARD\_NAME) | Dashboard name | `string` | n/a | yes |
| <a name="input_LAMBDA_FUNCTION_NAME"></a> [LAMBDA\_FUNCTION\_NAME](#input\_LAMBDA\_FUNCTION\_NAME) | The name of the Lambda function | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_dashboard_name"></a> [cloudwatch\_dashboard\_name](#output\_cloudwatch\_dashboard\_name) | The name of the CloudWatch Dashboard |
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | The name of the CloudWatch Log Group |
<!-- END_TF_DOCS -->