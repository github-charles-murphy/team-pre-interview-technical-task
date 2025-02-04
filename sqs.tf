resource "aws_sqs_queue" "event_queue" {
  name = "${var.username}-event-queue"
}
