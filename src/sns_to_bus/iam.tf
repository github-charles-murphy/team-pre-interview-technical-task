resource "aws_iam_role" "pipe_role" {
  name = "${var.username}-${var.source_sns_topic.name}-to-${var.target_event_bus.name}-pipe-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "pipes.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "pipe_policy" {
  name = "${var.username}-${var.source_sns_topic.name}-to-${var.target_event_bus.name}-pipe-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["sns:Subscribe", "sns:Unsubscribe"]
        Resource = var.source_sns_topic.arn
      },
      {
        Effect = "Allow"
        Action = ["events:PutEvents"]
        Resource = var.target_event_bus.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "pipe_attach" {
  role       = aws_iam_role.pipe_role.name
  policy_arn = aws_iam_policy.pipe_policy.arn
}
