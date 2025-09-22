module "network" {
  source = "./modules/vpc"
  name   = "dev-network"
  public_subnet_cidrs   = "10.0.0.0/16"
#   select version for this
}

