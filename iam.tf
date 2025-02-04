resource "aws_iam_role" "eventbridge_pipes_role" {
  name = "${var.username}-eventbridge-pipes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "eventbridge_pipes_policy" {
  name = "${var.username}-eventbridge-pipes-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sns:Subscribe",
          "sns:Unsubscribe"
        ]
        Resource = [
          "arn:aws:sns:${var.region}:${var.accountid}:${var.username}-basket-events",
          "arn:aws:sns:${var.region}:${var.accountid}:${var.username}-checkout-events"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "events:PutEvents"
        ]
        Resource = "arn:aws:events:${var.region}:${var.accountid}:event-bus/${var.username}-domain-events"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eventbridge_pipes_attach" {
  role       = aws_iam_role.eventbridge_pipes_role.name
  policy_arn = aws_iam_policy.eventbridge_pipes_policy.arn
}
