variable "region" {
  description = "The Amazon Web Service region."
  type        = string
}

variable "environment" {
  description = "The name of our environment, i.e. development."
  type        = string
}

variable "key_name" {
  description = "The AWS key pair to use for resources."
  type        = string
}

variable "private_key_path" {
  description = "The path to the private SSH key."
  type        = string
}

variable "ami" {
  description = "The Amazon Machine Image to use for Consul instance."
  type        = map(string)
  default     = {
    "us-east-1" = "ami-f652979b"
    "us-west-1" = "ami-7c4b331c"
  }
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "The VPC network ID."
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnetwork ID."
  type        = string
}

variable "servers" {
  description = "Number of servers in the Consul cluster."
  type        = number
  default     = 3
}

variable "token" {
  description = "Consul ACL master token."
  type        = string
}

variable "encryption_key" {
  description = "Consul cluster encryption key."
  type        = string
}

output "consul_dns_addresses" {
  value = aws_instance.server[*].public_dns
}

output "consul_host_addresses" {
  value = aws_instance.server[*].private_ip
}

output "consul_datacenter" {
  value = data.template_file.master.vars.environment
}