

module "vpc" {
  source = "../modules/vpc"

  vpc_name           = var.vpc_name
  cidr_block         = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "security_groups" {
  source = "../modules/security_groups"

  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "../modules/alb"

  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  lb_sg_id       = module.security_groups.lb_sg_id
}

module "ec2" {
  source = "../modules/ec2"

  vpc_id                    = module.vpc.vpc_id
  private_subnets           = module.vpc.private_subnets
  ec2_sg_id                 = module.security_groups.ec2_sg_id
  lb_target_group_arn       = module.alb.lb_target_group_arn
  iam_instance_profile_name = module.iam.iam_instance_profile_name


}

module "rds" {
  source = "../modules/rds"

  vpc_id            = module.vpc.vpc_id
  db_subnets        = module.vpc.private_subnets
  db_sg_id          = module.security_groups.db_sg_id
  db_identifier     = var.db_identifier
  db_username       = var.db_username

}

module "s3" {
  source = "../modules/s3"

  bucket_name = var.s3_bucket_name
}


module "iam" {
  source = "../modules/iam"

  s3_bucket_name = var.s3_bucket_name
}










