resource "aws_subnet" "public_sn" {
  count  = var.public_subnet_count
  vpc_id = aws_vpc.main.id

  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)

  availability_zone = var.azs[count.index % length(var.azs)]

  tags = {
    Name = "${var.namespace}-public-sn-${count.index}-${var.azs[count.index % length(var.azs)]}"
  }
}

resource "aws_subnet" "private_sn" {
  count  = var.private_subnet_count
  vpc_id = aws_vpc.main.id

  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + 16) // padding of 16

  availability_zone = var.azs[count.index % length(var.azs)]
  tags = {
    Name = "${var.namespace}-private-sn-${count.index}-${var.azs[count.index % length(var.azs)]}"
  }
}
