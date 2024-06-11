terraform {
  backend "s3" {
    bucket = "terraform-eks-cicd-70012"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
