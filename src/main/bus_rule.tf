resource "aws_cloudwatch_event_rule" "event_rule" {
  name        = "${var.username}-event-rule"
  description = "Capture events from the event bus and send them to SQS"

  event_bus_name = local.bus.arn

  event_pattern = jsonencode({
    "source": ["aws.sns"]
  })
}

resource "aws_cloudwatch_event_target" "sqs_target" {
  rule      = aws_cloudwatch_event_rule.event_rule.name
  arn       = module.durable_queue.sqs.arn
}
