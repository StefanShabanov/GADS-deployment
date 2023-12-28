resource "aws_security_group" "GADS_SG" {
  name        = "security-group-GADS"
  description = "Allow SSH and outbound traffic"
  vpc_id      = "vpc-02033db23a0304222"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
