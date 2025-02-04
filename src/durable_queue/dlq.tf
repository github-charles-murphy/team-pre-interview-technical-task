resource "aws_sqs_queue" "dlq" {
  name = "${var.username}-dlq"
}

resource "aws_sqs_queue_redrive_policy" "dlq_policy" {
  queue_url = aws_sqs_queue.sqs.id
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = var.max_receive_count
  })
}
