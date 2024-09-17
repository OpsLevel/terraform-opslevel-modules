resource "opslevel_infrastructure" "aws_vpc" {
  schema = "Network"
  owner  = module.order-management-team.this.id
  provider_data = {
    account = "Dev"
    name    = "AWS"
    type    = "VPC"
    url     = "https://us-east-1.console.aws.amazon.com/rds/home"
  }
  data = jsonencode({
    name             = "order-management-production"
    external_id      = "arn:aws:rds:us-east-1:746108190720:vpc"
    zone             = "us-east-1"
    ipv4_cidr        = "172.24.0.0/16"
    nat_gateway      = null
    internet_gateway = null
    is_default       = false
  })
}

resource "opslevel_infrastructure" "aws_rds_order_management" {
  schema = "Database"
  owner  = module.order-management-team.this.id
  provider_data = {
    account = "Dev"
    name    = "AWS"
    type    = "RDS"
    url     = "https://us-east-1.console.aws.amazon.com/rds/home"
  }
  data = jsonencode({
    name                = "order-management-production"
    external_id         = "arn:aws:rds:us-east-1:746108190720:db:order-management-production"
    port                = 3306
    zone                = "us-east-1"
    engine              = "mysql"
    engine_version      = "8.0.35"
    replica             = false
    publicly_accessible = false
    multi_zone_availability_enabled : true
    storage_encrypted = true
    storage_size = {
      unit  = "GB"
      value = 700
    }
    storage_type = "gp3"
    storage_iops = {
      unit  = "per second"
      value = 12000
    }
  })
}

resource "opslevel_infrastructure" "aws_rds_warehouse" {
  schema = "Database"
  owner  = module.warehouse-team.this.id
  provider_data = {
    account = "Dev"
    name    = "AWS"
    type    = "RDS"
    url     = "https://us-east-1.console.aws.amazon.com/rds/home"
  }
  data = jsonencode({
    name                = "packing-production"
    external_id         = "arn:aws:rds:us-east-1:746108190720:db:packing-production"
    port                = 3306
    zone                = "us-west-1"
    engine              = "mysql"
    engine_version      = "8.0.32"
    replica             = false
    publicly_accessible = false
    multi_zone_availability_enabled : true
    storage_encrypted = true
    storage_size = {
      unit  = "GB"
      value = 200
    }
    storage_type = "gp3"
    storage_iops = {
      unit  = "per second"
      value = 10000
    }
  })
}

resource "opslevel_infrastructure" "aws_rds_inventory" {
  schema = "Database"
  owner  = module.inventory-team.this.id
  provider_data = {
    account = "Dev"
    name    = "AWS"
    type    = "RDS"
    url     = "https://us-east-1.console.aws.amazon.com/rds/home"
  }
  data = jsonencode({
    name                = "inventory-production"
    external_id         = "arn:aws:rds:us-east-1:746108190720:db:inventory-production"
    port                = 3306
    zone                = "us-east-1"
    engine              = "mysql"
    engine_version      = "5.7"
    replica             = false
    publicly_accessible = true
    multi_zone_availability_enabled : true
    storage_encrypted = false
    storage_size = {
      unit  = "GB"
      value = 1000
    }
    storage_type = "gp2"
  })
}