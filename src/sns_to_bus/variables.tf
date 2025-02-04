variable "username" {
  description = "The username for the cloud resources"
  type        = string
}

variable "accountid" {
  description = "The account ID for the cloud resources"
  type        = number
}

variable "region" {
  description = "The region for the cloud resources"
  type        = string
}

variable "source_sns_topic" {
  description = "The SOURCE sns topic"
  type        = string
}

variable "target_event_bus" {
  description = "The TARGET event bus"
  type        = number
}
