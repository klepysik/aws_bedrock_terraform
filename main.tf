terraform {
  backend "s3" {
    bucket = "terraform_state_savings3_example_name"
    key = "terraform.tfstate"
    region = "region_example_name"
  }
}
