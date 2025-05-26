# terraform.tf
terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = ">= 5.0.0"
    }
  }
}


terraform {
  backend "http" {
    address = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/k_L3jd6KUYBMW148qePnmu4mrbjD-A5OeZV9txmaCLhjFuxvPmwZIURqhiRd9Fqm/n/grnzf4spsvcw/b/tfbucket/o/terraform.tfstate"
    update_method = "PUT"
  }
}