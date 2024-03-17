terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_lightsail_provider_zone
}

resource "aws_lightsail_instance" "custom" {
  name              = var.server_name
  availability_zone = var.aws_lightsailt_instance_zone
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  user_data = data.template_file.install_outline_server.rendered
  
  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for client config ...'",      
      "while [ ! -f /tmp/outline-install-details.txt ]; do sleep 5; done",
      "echo 'DONE!'",
      "cat /tmp/outline-install-details.txt",
    ]
    }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.keypair)
    host        = self.public_ip_address
  }


}
data "template_file" "install_outline_server" {
template = file("${path.module}/install_outline_server.sh")
vars = {
  api_port = var.api_port
  keys_port = var.keys_port
  }
}



resource "aws_lightsail_instance_public_ports" "custom" {
  instance_name = aws_lightsail_instance.custom.name

  port_info {
    protocol  = "tcp"
    from_port = var.api_port
    to_port   = var.keys_port
  }
}