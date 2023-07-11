managed_node_groups = {

  default_local_spot = {
    min_size     = 1
    max_size     = 30
    desired_size = 2

    subnet_ids     = var.local_subnet_ids
    version        = "1.25"
    instance_types = ["t3.large"]
    capacity_type  = "SPOT"
    disk_size      = "20"

    permissions = {
      "ecr-common-read" = data.aws_iam_policy_document.node_group_ecr_cross_account.json
    }
  }

  "default-${data.aws_availability_zones.available.names[0]}" = {
    min_size     = 1
    max_size     = 30
    desired_size = 1

    subnet_ids        = data.aws_subnets.local[data.aws_availability_zones.available.zone_ids[0]].ids
    version           = "1.25"
    instance_types    = ["t3.large"]
    capacity_type     = "ON_DEMAND"
    disk_size         = "20"
    availability_zone = data.aws_availability_zones.available.names[0]

    permissions = {
      "ecr-common-read" = data.aws_iam_policy_document.node_group_ecr_cross_account.json
    }
  }
  "default-${data.aws_availability_zones.available.names[1]}" = {
    min_size          = 1
    max_size          = 30
    desired_size      = 1
    subnet_ids        = data.aws_subnets.local[data.aws_availability_zones.available.zone_ids[1]].ids
    version           = "1.25"
    instance_types    = ["t3.large"]
    capacity_type     = "ON_DEMAND"
    disk_size         = "20"
    availability_zone = data.aws_availability_zones.available.names[1]
    permissions = {
      "ecr-common-read" = data.aws_iam_policy_document.node_group_ecr_cross_account.json
    }
  },
  "default-${data.aws_availability_zones.available.names[2]}" = {
    min_size          = 1
    max_size          = 30
    desired_size      = 1
    subnet_ids        = data.aws_subnets.local[data.aws_availability_zones.available.zone_ids[2]].ids
    version           = "1.25"
    instance_types    = ["t3.large"]
    capacity_type     = "ON_DEMAND"
    disk_size         = "20"
    availability_zone = data.aws_availability_zones.available.names[2]
    permissions = {
      "ecr-common-read" = data.aws_iam_policy_document.node_group_ecr_cross_account.json
    }
  }
}
