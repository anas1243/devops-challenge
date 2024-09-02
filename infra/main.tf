provider "aws" {
  region = "eu-central-1"
}

module "network" {
  source              = "github.com/anas1243/public-network-terraform-module.git"
  use_case            = "${var.use_case}"
  region              = "${var.region}"
  public_subnet1_zone = "${var.region}a"
  public_subnet2_zone = "${var.region}b"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet1_cidr = "10.0.1.0/24"
  public_subnet2_cidr = "10.0.2.0/24"
  env                 = "test"
}