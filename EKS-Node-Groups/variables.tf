variable "vpc_id" {
  type        = string
  description = "AWS account VPC ID"
}

variable "local_subnet_ids" {
  type        = list(any)
  description = "Account local subnets"
  default     = []
}