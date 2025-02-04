resource "aws_cloudwatch_event_rule" "sns_events_rule" {
  name        = "${var.username}-event-rule"
  description = "Capture events from the event bus and send them to SQS"

  event_bus_name = "arn:aws:events:${var.region}:${var.accountid}:event-bus/${var.username}-domain-events"

  event_pattern = jsonencode({})
}

resource "aws_cloudwatch_event_target" "sqs_target" {
  rule      = aws_cloudwatch_event_rule.sns_events_rule.name
  arn       = aws_sqs_queue.event_queue.arn
}
