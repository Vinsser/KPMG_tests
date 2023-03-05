// Configure the Google Cloud provider
provider "google" {
  credentials = file("~/.google/kpmg-tests-388082c363e3.json")
  project     = var.project_name
  region      = var.region
}

provider "google-beta" {
  credentials = file("~/.google/kpmg-tests-388082c363e3.json")
  project     = var.project_name
  region      = var.region
}