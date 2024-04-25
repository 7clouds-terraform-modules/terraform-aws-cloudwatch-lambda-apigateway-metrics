module "cloudwatch" {
  source                 = "../../"
  LAMBDA_FUNCTION_NAME   = var.LAMBDA_FUNCTION_NAME
  API_NAME               = var.API_NAME
  DASHBOARD_NAME         = var.DASHBOARD_NAME
}