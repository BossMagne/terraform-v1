provider "aws" {
    region = var.aws_default_region
}

resource "aws_key_pair" "id_ed25519" {
    key_name = "id_ed25519"
    public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "alexandre_webserver" {
subnet_id = var.default_public_subnet_id
ami = var.default_ubuntu_ami
instance_type = var.default_instance_type
vpc_security_group_ids = [var.default_SG]
associate_public_ip_address = true
key_name = aws_key_pair.id_ed25519.key_name
}