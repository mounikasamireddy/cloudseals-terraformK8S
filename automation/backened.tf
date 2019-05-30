terraform {
  backend "gcs" {
    bucket  = "tf-state-dev1"
    prefix  = "ram/terraforam.tfstate"
  }
}
