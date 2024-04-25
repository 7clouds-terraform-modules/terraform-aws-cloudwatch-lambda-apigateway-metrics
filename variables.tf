variable "LAMBDA_FUNCTION_NAME" {
    description = "The name of the Lambda function"
    type        = string
}

variable "API_NAME" {
    description = "The name of the API in API Gateway"
    type        = string 
}

variable "DASHBOARD_NAME" {
    description = "Dashboard name"
    type        = string
}

variable "CLOUDWATCH_LOGS_RETENTION_IN_DAYS" {
    description = "Specify the retention period for logs (in days)"
    type        = number
    default     = 30
}