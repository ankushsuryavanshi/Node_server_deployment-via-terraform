variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource naming"
  type        = string
}

variable "cpu" {
  description = "CPU units for the ECS task"
  type        = string
}

variable "memory" {
  description = "Memory for the ECS task"
  type        = string
}

variable "task_execution_role_arn" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}

variable "task_role_arn" {
  description = "IAM role ARN for ECS task"
  type        = string
}

variable "ecr_repository_url" {
  description = "ECR repository URL"
  type        = string
}

variable "container_image_tag" {
  description = "Container image tag"
  type        = string
}

variable "container_port" {
  description = "Container port to expose"
  type        = number
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "desired_count" {
  description = "Number of ECS service tasks"
  type        = number
}
