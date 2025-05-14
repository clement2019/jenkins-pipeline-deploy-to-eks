terraform {
  backend "s3" {
    bucket = "bucket-eks-cluster-100"
    key    = "dev-dev.tfstae"
    region = "eu-west-2"
  }
}