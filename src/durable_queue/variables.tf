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

variable "sender" {
  description = "The sender of messages"
  type        = string
}

variable "max_receive_count" {
  type    = number
  default = 5
}
