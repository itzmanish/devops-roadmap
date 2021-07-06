resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.namespace}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.namespace}-igw"
  }
}

resource "aws_eip" "nat" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "${var.namespace}-eip-nat"
  }
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_sn[0].id

  tags = {
    Name = "${var.namespace}-nat"
  }

  depends_on = [aws_eip.nat]
}
