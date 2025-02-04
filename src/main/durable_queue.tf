module "durable_queue" {
  source           = "../durable_queue"
  username        = var.username
  region          = var.region
  accountid       = var.accountid
  sender          = local.bus
}
