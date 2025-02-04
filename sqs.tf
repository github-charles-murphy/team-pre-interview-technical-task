# Create the main event queue
resource "aws_sqs_queue" "event_queue" {
  name = "${var.username}-event-queue"
}

resource "aws_sqs_queue_policy" "event_queue_policy" {
  queue_url = aws_sqs_queue.event_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action   = "sqs:SendMessage"
        Resource = aws_sqs_queue.event_queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = "arn:aws:events:${var.region}:${var.accountid}:event-bus/${var.username}-domain-events"
          }
        }
      }
    ]
  })
}

# Create the Dead Letter Queue (DLQ)
resource "aws_sqs_queue" "dlq" {
  name = "${var.username}-event-dlq"
}

# Attach the DLQ to the main queue
resource "aws_sqs_queue_redrive_policy" "event_queue_dlq" {
  queue_url = aws_sqs_queue.event_queue.id
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 5  # Move messages to DLQ after 5 failed attempts
  })
}
