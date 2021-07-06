
module "network" {
  source = "./modules/network"

  namespace            = var.namespace
  vpc_cidr             = var.vpc_cidr_block
  public_subnet_count  = var.bastion_instance_count
  private_subnet_count = var.service_instance_count
  azs                  = data.aws_availability_zones.available.names
}

module "rds" {
  source = "./modules/rds"

  namespace         = var.namespace
  subnet_ids        = module.network.private_sn_ids
  db_name           = var.db_name
  db_user           = var.db_username
  db_password       = var.db_password
  db_engine         = "mysql"
  db_engine_version = "5.7"
  rds_sg_ids        = [module.network.rds_sg_id]

  depends_on = [
    module.network
  ]
}
