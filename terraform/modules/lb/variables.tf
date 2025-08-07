variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
}

variable "tg_name" {
  description = "Name of the Target Group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "lb_sg_id" {
  description = "Security Group ID for Load Balancer"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
