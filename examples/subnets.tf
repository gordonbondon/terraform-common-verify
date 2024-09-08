# Verify that all provided subnets have a route to NAT gateway

variable "private_subnet_ids" {
  type = list(string)
}

data "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_ids)
  id    = var.private_subnet_ids[count.index]
}

data "aws_route_table" "private_subnet" {
  count     = length(var.private_subnet_ids)
  subnet_id = var.private_subnet_ids[count.index]
}

data "aws_route" "private_subnet" {
  count                  = length(var.private_subnet_ids)
  route_table_id         = element(data.aws_route_table.private_subnet[*].id, count.index)
  destination_cidr_block = "0.0.0.0/0"
}

locals {
  # get subnet without NAT gateway
  temp_rt_no_nat = matchkeys(data.aws_route.private_subnet[*].route_table_id, data.aws_route.private_subnet[*].nat_gateway_id, tolist([""]))
  temp_sub_no_nat = [
    for rt_id in local.temp_rt_no_nat : element(var.private_subnet_ids, index(data.aws_route_table.private_subnet[*].id, rt_id))
  ]
}

module "verify_subnet" {
  source = "../"

  match = length(compact(data.aws_route.private_subnet[*].nat_gateway_id)) == length(var.private_subnet_ids)
  error = "All private subnets must have a route to NAT gateway. [${join(",", local.temp_sub_no_nat)}] don't have it."
}
