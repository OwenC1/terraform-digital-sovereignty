variable "aws_region" {
  description = "AWS region used to deploy infrastructure"
  type        = string
  default     = "eu-west-1"
}

variable "ami_id" {
  description = "AMI ID used for the EC2 instance"
  type        = string
  default     = "ami-0123456789abcdef0"
}