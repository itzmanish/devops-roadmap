
resource "aws_security_group" "allow_docker_registry_lb" {
  name        = "allow_docker_registry_lb"
  description = "Allow docker registry port for load balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow http port"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.namespace}-docker-registry-sg"
  }
  depends_on = [aws_vpc.main]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow only ssh incoming"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.namespace}-ssh-sg"
  }
  depends_on = [aws_vpc.main]
}

resource "aws_security_group" "allow_ssh_internal" {
  name        = "allow_ssh_internal"
  description = "Allow only ssh incoming from internal network"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "SSH from vpc internal network"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ssh.id]
  }

  ingress {
    description     = "allow docker registry request from lb"
    from_port       = 5000
    to_port         = 5000
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_docker_registry_lb.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.namespace}-ssh-internal-sg"
  }
  depends_on = [aws_security_group.allow_docker_registry_lb, aws_security_group.allow_ssh]
}

resource "aws_security_group" "rds_sg_internal" {
  name        = "allow_rds_access_internal"
  description = "Allow only rds incoming from internal network"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "rds from vpc internal network"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ssh_internal.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.namespace}-rds-internal-sg"
  }
  depends_on = [aws_security_group.allow_ssh_internal]
}

