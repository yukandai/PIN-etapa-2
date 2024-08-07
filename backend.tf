terraform {
  backend "s3"{
#    bucket                 = "mi-bucket-de-ejemplo"
    region                 = "us-east-1"
    key                    = "backend.tfstate"
    dynamodb_table         = "terraformstatelock"
  }
}

