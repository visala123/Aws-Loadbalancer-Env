variable "lb_name" {}
variable "tg_name" {}
variable "vpcid" {}
variable "subnet_ids" {
  type = list(string)
}
variable "lbsgid" {}
variable "environment" {}
