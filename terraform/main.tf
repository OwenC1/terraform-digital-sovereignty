resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.ec2_security.id]

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name         = "ATUL0012345-EC2"
    Organisation = "ATUL0012345"
    Environment  = "Development"
  }
}