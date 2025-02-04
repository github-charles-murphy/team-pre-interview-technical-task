terraform {
  backend "s3" {
    bucket = "noths-lab-recruitment-terraform"
    key    = "states/${var.username}/terraform.state"
    region = "eu-west-1"
  }
}
