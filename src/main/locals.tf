locals {
  bus = {
    name    = var.bus
    arn     = "arn:aws:events:${var.region}:${var.accountid}:event-bus/${var.username}-${var.bus}"
    service = "events.amazonaws.com"
  }
  sns_list = [
    for sns in var.sns_list : {
      name    = sns
      arn     = "arn:aws:sns:${var.region}:${var.accountid}:${var.username}-${sns}"
      service = "pipes.amazonaws.com"
    }
  ]
}
