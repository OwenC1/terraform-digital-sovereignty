resource "aws_security_group" "ec2_security" {
  name        = "atul0012345-ec2-security"
  description = "Security group for ATUL0012345 EC2 instance"

  ingress = []

  egress = []

  tags = {
    Name = "ATUL0012345-EC2-Security"
  }
}