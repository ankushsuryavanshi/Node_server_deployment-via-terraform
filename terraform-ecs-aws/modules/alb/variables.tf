variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "alb_sg_ingress_cidr" { type = string }
variable "target_group_port" { type = number, default = 3000 }


