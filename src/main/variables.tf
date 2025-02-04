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

variable "sns_list" {
  description = "The list of sns topics to consume from"
  type        = list(string)
}

variable "bus" {
  description = "The eventbridge bus to yield to"
  type        = string
}
