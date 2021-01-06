variable "name" {
  description = "The name of the VPC."
  type        = string
}

variable "cidr" {
  description = "The CIDR of the VPC."
  type        = string
}

variable "public_subnet" {
  description = "The public subnet to create."
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Should be true if you want to use private DNS within the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true if you want to use private DNS within the VPC."
  type        = bool
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch."
  type        = bool
  default     = true
}
