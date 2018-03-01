variable "local_ip" {
  type = "string"
}

variable "region" {
  default = "string"
}

variable "wordpress-images" {
  type = "map"

  default = {
    "us-west-2" = "ami-df77f7a7"
  }
}

variable "zones" {
  type = "map"

  default = {
    "us-west-2" = "us-west-2a"
  }
}
