output "vpc_id" {
  value = module.vpc.vpc_id
  description = "Id of VPC"
}

output "ecr_url" {
  description = "The Elastic Container Registry (ECR) URL."
  value       = module.ecs.ecr_url
}
