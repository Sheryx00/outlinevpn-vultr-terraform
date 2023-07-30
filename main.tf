# Configure the Vultr Provider
# Fork of jadolg's outlinevpn-vultr-terraform
# https://github.com/jadolg/outlinevpn-vultr-terraform.git

terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.3.3"
    }
  }
}

# Create outline server
resource "vultr_instance" "outline" {
  # cheapest plan $5/month
  plan = var.vc_id
  region = var.region_code

  # ubuntu 23.04
  os_id = "2104"
  label = var.server_name
  tag = var.server_name
  hostname = var.server_name
  enable_ipv6 = true
  backups = "disabled"
  activation_email = true
  ddos_protection = false
  user_data = data.template_file.install_outline_server.rendered

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for client config ...'",      
      "while [ ! -f /tmp/outline-install-details.txt ]; do sleep 5; done",
      "echo 'DONE!'",
      "cat /tmp/outline-install-details.txt",
    ]

    connection {
      host = vultr_instance.outline.main_ip
      type = "ssh"
      user = "root"
      password = vultr_instance.outline.default_password
      timeout = "10m"
      agent = "false"
    }
  }
}

data "template_file" "install_outline_server" {
  template = file("install_outline_server.sh")
  vars = {
    api_port = var.api_port
    keys_port = var.keys_port
    }
}
