# PROVIDER
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# MODULES
module "vpc" {
  source = "./modules/vpc"
}

module "rds" {
  source              = "./modules/rds"
  sn_vpc10_priv_1a_id = module.vpc.sn_vpc10_priv_1a_id 
  sn_vpc10_priv_1c_id = module.vpc.sn_vpc10_priv_1c_id 
  sg_vpc10_priv_id    = module.ec2.sg_vpc10_priv_id 
}

module "ec2" {
  source             = "./modules/ec2"
  vpc_id             = module.vpc.vpc_id
  sn_vpc10_pub_1a_id = module.vpc.sn_vpc10_pub_1a_id
  sn_vpc10_pub_1c_id = module.vpc.sn_vpc10_pub_1c_id 
  rds_endpoint       = module.rds.rds_endpoint
}
