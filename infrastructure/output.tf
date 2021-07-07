output "ubuntu_2004_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "available_azs" {
  value = data.aws_availability_zones.available
}
