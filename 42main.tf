terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  cloud {
    organization = "example-teraform2"

    workspaces {
      name = "gh-actions-demo2"
    }
  }
}

provider "aws" {
  region = "us-east-2"

  # 2.x 버전의 AWS 공급자 허용
  version = "~> 2.0"
}

terraform {
  backend "remote" {
    organization = "example-teraform2"

    workspaces {
      name = "gh-actions-demo2"
    }
  }
}

resource "aws_instance" "example2" {
  ami           ="ami-0c55b159cbfafe1f0"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"

}
