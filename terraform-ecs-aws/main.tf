terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  aws_region = var.aws_region
  name       = var.name_prefix
  cidr_block = var.vpc_cidr
}

module "ecr" {
  source = "./modules/ecr"
  name   = var.name_prefix
}

module "iam" {
  source = "./modules/iam"
  name_prefix = var.name_prefix
}

module "alb" {
  source = "./modules/alb"

  name_prefix   = var.name_prefix
  vpc_id        = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  alb_sg_ingress_cidr = var.alb_ingress_cidr
}

module "ecs" {
  source = "./modules/ecs"

  name_prefix = var.name_prefix
  cluster_name = "${var.name_prefix}-cluster"

  subnet_ids        = module.network.private_subnet_ids
  security_group_id = module.iam.ecs_task_sg_id
  alb_target_group_arn = module.alb.target_group_arn

  ecr_repository_url = module.ecr.repository_url
  container_image_tag = var.container_image_tag

  task_execution_role_arn = module.iam.task_execution_role_arn
  task_role_arn = module.iam.task_role_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}