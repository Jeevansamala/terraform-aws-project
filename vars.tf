variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1  = "ami-033b95fb8079dc481"
    us-east-2  = "ami-033b95fb8079dc481"
    ap-south-1 = "ami-0c6615d1e95c98aca"
  }
}

variable "PRIV_KEY_PATH" {
  default = "awsprojectkey"
}

variable "PUB_KEY_PATH" {
  default = "awsprojectkey.pub"
}

variable "USERNAME" {
  default = "ubuntu"
}

variable "MYIP" {
  default = "0.0.0.0/0"
}

variable "rmquser" {
  default = "admin"
}

variable "rmqpass" {
  default = "admin123"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "admin123"
}

variable "dbname" {
  default = "accounts"
}

variable "instance_count" {
  default = "1"
}

variable "VPC_NAME" {
  default = "awsproject-VPC"
}

variable "Zone1" {
  default = "us-east-1a"
}

variable "Zone2" {
  default = "us-east-1b"
}
variable "Zone3" {
  default = "us-east-1c"
}

variable "VpcCIDR" {
  default = "172.21.0.0/16"
}

variable "PubSub1CIDR" {
  default = "172.21.1.0/24"
}

variable "PubSub2CIDR" {
  default = "172.21.2.0/24"
}

variable "PubSub3CIDR" {
  default = "172.21.3.0/24"
}

variable "PriSub1CIDR" {
  default = "172.21.4.0/24"
}

variable "PriSub2CIDR" {
  default = "172.21.5.0/24"
}

variable "PriSub3CIDR" {
  default = "172.21.6.0/24"
}