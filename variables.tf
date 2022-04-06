variable "region" {
  default = "us-east-1"
  #  us-east-1 = "us-east-1"
  #   us-east-2 = "us-east-2"
}

variable "ami" {
  type = map(any)
  default = {
    us-east-1 = "ami-04505e74c0741db8d"
    us-east-2 = "ami-0fb653ca2d3203ac1"
  }
}

variable "zone" {
  type = map(any)
  default = {
    us-east-1 = "us-east-1a"
    us-east-2 = "us-east-2a"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_group" {
  default = "sg-06fcd874d123337b1"
}

variable "public_key" {
  default = "id_rsa.pub"
}

variable "access_key" {
  default = "AKIAXBNB6KNCI2S6IJUJ"
}

variable "secret_key" {
  default = "gKkVs04Z5+vAns3vJVB+17lNmzQl9ufeB32ZIzcA"
}
