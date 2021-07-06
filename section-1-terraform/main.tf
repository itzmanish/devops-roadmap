
module "network" {
  source = "./modules/network"

  namespace            = "devops-roadmap-tf"
  vpc_cidr             = "172.36.0.0/16"
  public_subnet_count  = 2
  private_subnet_count = 3
  azs                  = data.aws_availability_zones.available.names
}
