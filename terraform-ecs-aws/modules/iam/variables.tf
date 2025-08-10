variable "name_prefix" { type = string }
variable "vpc_id" { type = string }
variable "container_port" { type = number }
variable "alb_source_cidrs" { type = list(string) }   