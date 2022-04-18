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
    organization = "example-teraform"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}
