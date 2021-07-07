resource "aws_eip" "bastion" {
  vpc      = true
  count    = length(aws_instance.bastion)
  instance = aws_instance.bastion[count.index].id
  depends_on = [
    aws_instance.bastion
  ]
}

resource "aws_instance" "bastion" {
  count           = var.bastion_host_count
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_ids[count.index]
  security_groups = var.public_security_groups
  key_name        = var.key_name

  tags = {
    Name = "${var.bastion_instance_name}_${count.index}"
  }
}

resource "aws_instance" "service" {
  count           = var.service_host_count
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.private_subnet_ids[count.index]
  security_groups = var.private_security_groups
  key_name        = var.key_name

  tags = {
    Name = "${var.service_instance_name}_${count.index}"
  }

}

resource "aws_ebs_volume" "additional" {
  count             = var.service_host_count
  availability_zone = var.extra_storage_azs[count.index % length(var.extra_storage_azs)]
  size              = 8

  tags = {
    Name = "${var.service_instance_name}_extra_storage_${count.index}"
  }
}

resource "aws_volume_attachment" "service_additional_storage" {
  count       = var.service_host_count
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.additional[count.index].id
  instance_id = aws_instance.service[count.index].id
}
