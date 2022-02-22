resource "aws_security_group" "awsproject-elb-sg" {
  name = "awsproject-elb-sg"
  description = "Security group for awsproject VPC"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "awsproject-bastion-sg" {
  name = "awsproject-bastion-sg"
  description = "Security group for bastion ec2 instance"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = [var.MYIP]

  }
}

resource "aws_security_group" "awsproject-prod-sg" {
  name        = "awsproject-prod-sg"
  description = "Security group for beanstalk instance"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    security_groups = [aws_security_group.awsproject-bastion-sg.id]
  }
}

resource "aws_security_group" "awsproject-backend-sg" {
  name = "awsproject-backend-sg"
  description = "Security group for RDS, active MQ, elastic cache"
  vpc_id = module.vpc.vpc_id
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    security_groups = [aws_security_group.awsproject-prod-sg.id]
  }
}

resource "aws_security_group_rule" "awsproject-sg-rule" {
  from_port         = 0
  protocol          = "tcp"
  to_port           = 65535
  type              = "ingress"
  security_group_id = aws_security_group.awsproject-backend-sg.id
  source_security_group_id = aws_security_group.awsproject-backend-sg.id
}

