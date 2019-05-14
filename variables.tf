variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}


variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

variable "amingnix" {
  description = "Amazon Linux AMI"
  default = "ami-0a313d6098716f372"
}
variable "amikops" {
  description = "Amazon Linux AMI"
  default = "ami-05c374cc4cfd41d47"
}


variable "aws_access_key" {
  description = "Amazon access key"
  default = "AKIAZHR6STS76JJQWLM4"
}
variable "aws_secret_key" {
  description = "Amazon secret key"
  default = "CIS2pMnw3jAftkIXIf7u0KEAAsKH/IpwwjHNIX7N"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "~/.ssh/id_rsa.pub"
}
