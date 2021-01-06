provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "vpc" {
  source        = "./vpc"
  name          = var.environment
  cidr          = var.vpc_cidr
  public_subnet = var.public_subnet
}

module "consul" {
  source           = "./consul"
  region           = var.region
  environment      = var.environment
  token            = var.token
  encryption_key   = var.encryption_key
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  key_name         = var.key_name
  private_key_path = var.private_key
}