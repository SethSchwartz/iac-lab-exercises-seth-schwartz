module "rds" {
  source = "./modules/rds/"

  prefix                   = var.prefix
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  db_name                  = var.db_name
  db_username              = var.db_username
  allow_security_group_ids = [module.ecs.ecs_security_group_id]
}