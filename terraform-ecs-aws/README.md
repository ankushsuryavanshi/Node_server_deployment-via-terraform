# ECS Terraform Module

This Terraform module helps you set up an **Amazon ECS (Elastic Container Service)** environment quickly and consistently.  
It covers everything from creating an ECS cluster to deploying a service linked to your container image in ECR.

---

## What this module does
- Creates an ECS Cluster
- Registers a Task Definition (with configurable CPU, Memory, and container image)
- Deploys an ECS Service with the desired number of tasks
- Integrates IAM roles for execution and task permissions

---

# Initialize providers and modules
terraform init

# Check syntax and config
terraform validate

# Preview the changes
terraform plan

# Apply the changes
terraform apply
