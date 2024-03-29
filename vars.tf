
variable "server_name" {
  description = "Product Name"
  default = "outline"
}

variable "api_port" {
  description = "Outline API port"
  type = number
  default = "23232"

}

variable "keys_port" {
  description = "Outline KEYS port"
  type = number
  default = "23233"
}

# AWS ZONE
#  us-east-1a
#  us-east-1b
#  us-east-1c
#  us-east-1d
#  us-east-1e
#  us-east-1f

variable aws_lightsail_provider_zone {
  default="us-east-1"
}

variable aws_lightsailt_instance_zone {
    default="us-east-1c"
}

variable "keypair" {
  type = string
  default = "~/.ssh/.aws-keypair.pem"
}