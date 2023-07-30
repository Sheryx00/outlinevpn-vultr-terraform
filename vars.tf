# NAME            REGION CODE
# Frankfurt       FRA
# Atlanta         ATL
# Chicago         ORD
# Miami           MIA
# New Jersey      EWR
# Seoul           ICN
# Silicon Valley  SJC
# Singapore       SGP
# London          LHR
# Sydney          SYD
# Dallas          DFW
# Seattle         SEA
# Tokyo           NRT
# Los Angeles     LAX
# Amsterdam       AMS
# Paris           CDG
# Toronto         YTO


variable "region_code" {
  description = "Vultr Region"
  default = "FRA"
}

variable "server_name" {
  description = "Product Name"
  default = "outline"
}

variable "vc_id" {
  description = "Vultr plan id"
  default = "vc2-1c-1gb"
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
