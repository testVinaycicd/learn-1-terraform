terraform {
  backend "s3" {
    bucket       = "my-terraform-state"
    key          = "dev/app.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}


