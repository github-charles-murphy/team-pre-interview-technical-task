resource "aws_pipes_pipe" "basket_events_pipe" {
  name     = "${var.username}-basket-events-pipe"
  role_arn = aws_iam_role.eventbridge_pipes_role.arn

  source     = "arn:aws:sns:${var.region}:${var.accountid}:${var.username}-basket-events"
  target     = "arn:aws:events:${var.region}:${var.accountid}:event-bus/${var.username}-domain-events"

  source_parameters {
    filter_criteria {
      filter {
        pattern = jsonencode({})
      }
    }
  }
}

resource "aws_pipes_pipe" "checkout_events_pipe" {
  name     = "${var.username}-checkout-events-pipe"
  role_arn = aws_iam_role.eventbridge_pipes_role.arn

  source     = "arn:aws:sns:${var.region}:${var.accountid}:${var.username}-checkout-events"
  target     = "arn:aws:events:${var.region}:${var.accountid}:event-bus/${var.username}-domain-events"

  source_parameters {
    filter_criteria {
      filter {
        pattern = jsonencode({})
      }
    }
  }
}
