terraform {
  backend "gcs" {
    bucket  = "tf-state-dev1"
    prefix  = "fourth/terraforam.tfstate"
  }
}
