resource "aws_db_subnet_group" "awsproject-RDS-subgrp" {
  name = "awsproject-RDS-subgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    name = "Subnet group for RDS"
  }
}

resource "aws_elasticache_subnet_group" "awsproject-cache-subgrp" {
  name       = "awsproject-cache-subgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    name = "Subnet group for elastic cache"
  }
}

resource "aws_db_instance" "awsproject-RDS" {
  instance_class = "db.t2.micro"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.6.34"
  name = var.dbname
  username = var.dbuser
  password = var.dbpass
  parameter_group_name = "default.myaql5.6"
  multi_az = "false"
  publicly_accessible = "false"
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.awsproject-RDS-subgrp.name
  vpc_security_group_ids = [aws_security_group.awsproject-backend-sg.id]
}

resource "aws_elasticache_cluster" "awsproject-cache" {
  cluster_id = "awsproject-cache"
  engine = "memcached"
  node_type = "cache.t2.micro"
  num_cache_nodes = 1
  parameter_group_name = "default.memcached1.5"
  port = 11211
  security_group_ids = [aws_security_group.awsproject-backend-sg.id]
  subnet_group_name = aws_elasticache_subnet_group.awsproject-cache-subgrp.name
  }

resource "aws_mq_broker" "awsproject-rmq" {
  broker_name        = "awsproject-rmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.0"
  host_instance_type = "mq.t2.micro"
  security_groups = [aws_security_group.awsproject-backend-sg.id]
  subnet_ids = [module.vpc.private_subnets[0]]
  user {
    password = var.rmqpass
    username = var.rmquser
  }
}