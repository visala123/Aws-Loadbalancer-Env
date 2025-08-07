variable "lb_name" {}
variable "tg_name" {}
variable "vpcid" {}
variable "subnet_ids" {
  type = list(string)
}
variable "lbsgid" {}
variable "environment" {}
variable "internal" {
  description = "Whether the ALB is internal"
  type        = bool
}

variable "load_balancer_type" {
  description = "Type of Load Balancer"
  type        = string
}
