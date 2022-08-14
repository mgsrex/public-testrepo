terraform {

    required_providers {
      aws =  {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
    
    }

}

provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
      encrypt   = true
      bucket    = "eam-tf-backend2022"
      region    = "us-east-1"
      key       = "terraform/base.tfstate"  
    }
    
}

module "flask"{
    source  = "./modules/flask"
}