resource "aws_pipes_pipe" "pipe" {
  name     = "${var.username}-${var.source_sns_topic.name}-to-${var.target_event_bus.name}-pipe"
  role_arn = aws_iam_role.pipe_role.arn

  source = var.source_sns_topic.arn
  target = var.target_event_bus.arn

  source_parameters {
    filter_criteria {
      filter { pattern = jsonencode({}) }
    }
  }
}
