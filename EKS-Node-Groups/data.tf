data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_subnets" "private" {

  for_each = toset(data.aws_availability_zones.available.zone_ids)
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "availability-zone-id"
    values = [each.value]
  }

  filter {
    name = "tag:Name"

    values = ["private-subnet*"]
  }
}

