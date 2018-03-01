resource "aws_instance" "wordpress" {
  ami = "${lookup(var.wordpress-images, var.region)}"

  instance_type = "t2.micro"

  security_groups = [
    "${aws_security_group.wordpres_security_group.name}",
  ]

  availability_zone = "${lookup(var.zones, var.region)}"

  key_name = "wordpress"

  associate_public_ip_address = true

  root_block_device = {
    "volume_type"           = "standard"
    "volume_size"           = 40
    "delete_on_termination" = false
  }

  tags = {
    Name = "Wordpress Server"
  }
}

resource "aws_eip" "wordpress_eip" {
  instance = "${aws_instance.wordpress.id}"
  vpc      = false
}
