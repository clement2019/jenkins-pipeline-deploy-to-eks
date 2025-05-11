terraform {
  backend "s3" {
    bucket = "jenkins-terraform-aws"
    key    = "eks1/terraform.tfstate"
    region = "eu-west-2"
  }
}