resource "aws_sqs_queue" "sqs" {
  name = "${var.username}-sqs"
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.sqs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = var.sender.service }
      Action   = "sqs:SendMessage"
      Resource = aws_sqs_queue.sqs.arn
      Condition = {
        ArnEquals = {
          "aws:SourceArn" = var.sender.arn
        }
      }
    }]
  })
}
