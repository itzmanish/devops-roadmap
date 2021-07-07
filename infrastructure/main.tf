
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

module "instance" {
  source                  = "./modules/instance"
  bastion_instance_name   = "${var.namespace}-bastion"
  service_instance_name   = "${var.namespace}-service"
  ami_id                  = var.instance_ami_id != "" ? var.instance_ami_id : data.aws_ami.ubuntu.id
  public_security_groups  = [module.network.bastion_sg_id]
  private_security_groups = [module.network.service_sg_id]
  public_subnet_ids       = module.network.public_sn_ids
  private_subnet_ids      = module.network.private_sn_ids
  bastion_host_count      = var.bastion_instance_count
  service_host_count      = var.service_instance_count
  extra_storage_azs       = length(var.extra_storage_azs) != 0 ? var.extra_storage_azs : data.aws_availability_zones.available.names
  key_name                = aws_key_pair.master.key_name

  depends_on = [
    module.network
  ]
}


resource "tls_private_key" "master" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "master" {
  key_name   = "${var.namespace}-master-key"
  public_key = var.instance_public_key != "" ? var.instance_public_key : tls_private_key.master.public_key_openssh
}


resource "local_file" "private_key" {
  sensitive_content = tls_private_key.master.private_key_pem
  filename          = format("%s/%s/%s", "/home/manish", ".ssh", "tf-master.pem")
  file_permission   = "0600"
}
