output "sqs" {
  value = aws_sqs_queue.sqs.arn
}

output "dlq" {
  value = aws_sqs_queue.dlq.arn
}
