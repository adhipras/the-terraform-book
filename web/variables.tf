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

variable "region" {
  description = "The Amazon Web Service region."
  type        = string
  default     = "us-east-1"
}

variable "zones" {
  description = "The Amazon Web Service availability zones."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ami" {
  description = "The Amazon Machine Image to use for the instance."
  type        = map(string)
  default     = {
    us-east-1 = "ami-f652979b"
    us-west-1 = "ami-7c4b331c"
  }
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro"
}

variable "instance_ips" {
  description = "The IP address(es) to use for our instance(s)."
  type        = list(string)
  default     = ["10.0.1.20", "10.0.1.21"]
}

variable "key_name" {
  description = "The Amazon Web Service key pair to use for resources."
  type        = string
  default     = "terraform"
}