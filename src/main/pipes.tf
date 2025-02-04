module "pipes" {
  source    = "../sns_to_bus"
  for_each  = toset(local.sns_list)

  username        = var.username
  region          = var.region
  accountid       = var.accountid
  source_sns_topic  = each.value
  target_event_bus  = local.bus
}
