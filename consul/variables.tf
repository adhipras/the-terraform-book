variable "access_key" {
  description = "The AWS access key."
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "The AWS secret key."
  type        = string
  sensitive   = true
}

variable "private_key" {
  description = "SSH key to use for the connection."
  type        = string
  sensitive   = true
  default     = "terraform.pem"
}

variable "key_name" {
  description = "The Amazon Web Service key pair to use for resources."
  type        = string
  default     = "terraform"
}

variable "region" {
  description = "The Amazon Web Service region."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet" {
  description = "The public subnetwork IP addresses range."
  type        = string
  default     = "10.0.5.0/24"
}

variable "token" {
  description = "Consul server token."
  type        = string
}

variable "encryption_key" {
  description = "Consul encryption key."
  type        = string
}

variable "environment" {
  description = "The name of environment."
  type        = string
  default     = "development"
}