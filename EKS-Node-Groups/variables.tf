variable "vpc_id" {
  type        = string
  description = "AWS account VPC ID"
}

variable "private_subnet_ids" {
  type        = list(any)
  description = "Account private subnets"
  default     = []
}