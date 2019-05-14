
# Define public server inside the public subnet
resource "aws_instance" "pub-instance" {
   ami  = "${var.amingnix}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgpublic.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("install.sh")}"

  tags {
    Name = "Public-instance"
  }
}


# Define private server inside the private subnet
resource "aws_instance" "priv-instance" {
   ami  = "${var.amikops}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgprivate.id}"]
   source_dest_check = false

  tags {
    Name = "private-instance"
  }
}



# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name = "vpctestkeypair"
  public_key = "${file("${var.key_path}")}"
}
