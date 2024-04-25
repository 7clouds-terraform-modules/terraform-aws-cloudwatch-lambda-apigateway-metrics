resource "aws_cloudwatch_log_group" "requestTracker" {
  name              = "/aws/lambda/${var.LAMBDA_FUNCTION_NAME}"
  retention_in_days = var.CLOUDWATCH_LOGS_RETENTION_IN_DAYS
}

resource "aws_cloudwatch_dashboard" "api_dashboard" {
  dashboard_name = var.DASHBOARD_NAME
  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/Lambda",
            "Duration",
            "FunctionName",
            "${var.LAMBDA_FUNCTION_NAME}",
            {
              "stat": "p50",
              "label": "ResponseTime p50",
              "period": 300,
              "color": "#d62728"
            }
          ],
          [
            "AWS/Lambda",
            "Duration",
            "FunctionName",
            "${var.LAMBDA_FUNCTION_NAME}",
            {
              "stat": "p90",
              "label": "ResponseTime p90",
              "period": 300,
              "color": "#9467bd"
            }
          ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "title": "Lambda Latency",
        "region": "us-east-1",
        "stat": "Average",
        "period": 300,
        "yAxis": {
          "left": {
            "min": 0,
            "max": 50,
            "showUnits": false,
            "label": "Seconds"
          }
        }
      }
    }, 
    {
      "type": "metric",
      "x": 6,
      "y": 0,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/ApiGateway", "Count", "ApiName", "${var.API_NAME}", { "stat": "Sum" }]
        ],
        "view": "timeSeries",
        "stacked": false,
        "title": "Ok (2xx)",
        "region": "us-east-1",
        "period": 300
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 0,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/ApiGateway", "4XXError", "ApiName", "${var.API_NAME}", { "stat": "Sum" }]
        ],
        "view": "timeSeries",
        "stacked": false,
        "title": "Error (4xx)",
        "region": "us-east-1",
        "period": 300
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          ["AWS/ApiGateway", "5XXError", "ApiName", "${var.API_NAME}", { "stat": "Sum" }]
        ],
        "view": "timeSeries",
        "stacked": false,
        "title": "Faults (5xx)",
        "region": "us-east-1",
        "period": 300
      }
    },
    {
      "type": "metric",
      "x": 6,
      "y": 6,
      "width": 6,
      "height": 6,
      "properties": {
          "metrics": [
          ["AWS/ApiGateway", "Throttle", "ApiName", "${var.API_NAME}", { "stat": "Sum" }]
          ],
          "view": "timeSeries",
          "stacked": false,
          "title": "Throttle",
          "region": "us-east-1",
          "period": 300
        }
    }
  ]
}
EOF
}
