
resource "aws_instance" "dev-inst" {
  ami                    = var.ami[var.region]
  availability_zone      = var.zone[var.region]
  instance_type          = var.instance_type
  vpc_security_group_ids = ["sg-06fcd874d123337b1"]
  tags = {
    Name        = "Dev"
    description = "Dev Instacne"
  }
  user_data = <<EOF
  #! /bin/bash
        sudo apt-get update
        sudo apt-get install wget -y
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Deployed via Terraform</h1>"
    EOF

}

resource "aws_key_pair" "terraform-key" {
  key_name   = "terraform-key"
  public_key = file(var.public_key)
}

output "PublicIP" {
  value = aws_instance.dev-inst.public_ip
}
output "PrivateIP" {
  value = aws_instance.dev-inst.private_ip
}