# Define our VPC
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "test-vpc"
  }
}

# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "VPC IGW"
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public-subnet.id}"
  depends_on = ["aws_internet_gateway.gw"]

  tags = {
    Name = "gw NAT"
  }
}

# Elastic IP for Public instance
resource "aws_eip" "PubEip" {
instance = "${aws_instance.pub-instance.id}"
  vpc      = true
}
# Elastic IP
resource "aws_eip" "nat" {
  vpc = true
  depends_on = ["aws_internet_gateway.gw"]
}
