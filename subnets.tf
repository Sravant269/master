
# Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    Name = "Public Subnet"
  }
}
# Define the private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1b"

  tags {
    Name = "Private Subnet"
}
}

# Define the route table
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public-rt" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}

# Define the route table
resource "aws_route_table" "private-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.natgw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the private Subnet
resource "aws_route_table_association" "private-rt" {
  subnet_id = "${aws_subnet.private-subnet.id}"
  route_table_id = "${aws_route_table.private-rt.id}"
}

