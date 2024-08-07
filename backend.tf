terraform {
  backend "s3"{
    bucket                 = "mundose-tf-2024"
    region                 = "us-east-1"
    key                    = "backend.tfstate"
#    dynamodb_table         = "terraformstatelock"
  }
}

