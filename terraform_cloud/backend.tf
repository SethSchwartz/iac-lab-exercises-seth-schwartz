terraform {
  backend "remote" {
    organization = "ss-IaC-Lab"

    workspaces {
      name = "ss-iac-lab-workspace"
    }
  }
}