
provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "selected" {
  filter {
    name   = "vpc-id"
    values = ["vpc-12345678"]
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_security_group" "lb_sg" {
  id = "sg-1234abcd"
}

module "alb" {
  source            = "../../modules/lb"
  lb_name           = var.lb_name
  tg_name           = var.tg_name
  internal          = var.internal
  load_balancer_type= var.load_balancer_type
  vpc_id            = data.aws_vpc.selected.id
  subnet_ids        = data.aws_subnets.selected.ids
  lb_sg_id          = data.aws_security_group.lb_sg.id
  environment       = var.environment
}