module "ecs" {
  source = "./modules/ecs/"

  prefix                = var.prefix
  region                = var.region
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnets
  alb_target_group_arn  = module.alb.target_group_arn
  alb_security_group_id = module.alb.security_group_id
  db_address            = module.rds.db_address
  db_name               = module.rds.db_name
  db_username           = module.rds.db_username
  db_secret_arn         = module.rds.db_secret_arn
  db_secret_key_id      = module.rds.db_secret_key_id
}