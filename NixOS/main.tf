
# test only

# Ref: https://nix.dev/tutorials/nixos/deploying-nixos-using-terraform
terraform {
  required_providers {
    nixos = {
      source = "corpix/nixos"
      version = "0.0.14"
    }
  }
}

# provider "nixos" {
#   source= ${path}/configuration.nix
# }

module "nixos_image" {
  source  = "git::https://github.com/tweag/terraform-nixos.git/aws_image_nixos?ref=5f5a0408b299874d6a29d1271e9bffeee4c9ca71"
  release = "20.09"
}

module "deploy_nixos" {
  source               = "git::https://github.com/tweag/terraform-nixos.git//deploy_nixos?ref=5f5a0408b299874d6a29d1271e9bffeee4c9ca71"
  nixos_config         = "${path.module}/configuration.nix"
  target_host          = localhost
  ssh_agent            = false
}