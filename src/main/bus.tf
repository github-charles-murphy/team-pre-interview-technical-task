resource "aws_cloudwatch_event_rule" "event_rule" {
  name        = "${var.username}-event-rule"
  description = "Capture SNS events from the event bus"

  event_bus_name = local.bus.arn

  event_pattern = jsonencode({
    "source": ["aws.sns"]
  })
}

resource "aws_cloudwatch_event_target" "sqs_target" {
  rule      = aws_cloudwatch_event_rule.event_rule.name
  arn       = module.durable_queue.sqs.arn
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/${var.username}/${local.bus.name}"
}

resource "aws_cloudwatch_event_target" "log_target" {
  rule      = aws_cloudwatch_event_rule.event_rule.name
  arn       = aws_cloudwatch_log_group.log_group.arn
}
