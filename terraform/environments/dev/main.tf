provider "aws" {
  region = "us-east-1"
}
data "aws_vpc" "selected" {
  filter {
    name   = "vpc-id"
    values = [var.vpcid]
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_security_group" "lb_sg" {
  id = var.lbsgid
}

module "eks_lb" {
  source      = "../../modules/eks"
  lb_name     = var.lb_name
  tg_name     = var.tg_name
  vpc_id     = data.aws_vpc.selected.id
  subnet_ids = data.aws_subnets.selected.ids
  lb_sg_id   = data.aws_security_group.lb_sg.id
  environment = var.environment
}
