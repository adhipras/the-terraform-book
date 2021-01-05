provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "vpc" {
  source        = "./vpc"
  name          = "web"
  cidr          = "10.0.0.0/16"
  public_subnet = "10.0.1.0/24"
}

resource "aws_security_group" "allow_http" {
  name        = "allow-http"
  description = "Allow HTTP from anywhere"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web_host" {
  name        = "web-host"
  description = "Allow SSH & HTTP to web hosts"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [module.vpc.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami                         = var.ami[var.region]
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = module.vpc.public_subnet_id
  private_ip                  = var.instance_ips[count.index]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_host.id]
  user_data                   = file("nginx.sh")
  count                       = length(var.instance_ips)

  tags = {
    Name = "web-${format("%03d", count.index + 1)}"
  }
}

resource "aws_elb" "web" {
  name            = "elb-web"
  subnets         = [module.vpc.public_subnet_id]
  security_groups = [aws_security_group.allow_http.id]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }

  instances = aws_instance.web[*].id
}
