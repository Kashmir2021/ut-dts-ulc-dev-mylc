resource "aws_security_group" "Myulc_App" {
  name        = "ulc-myulc-app-${var.labeltags.env}"
  description = "Allow inbound traffic to myulc App Server"
  vpc_id      = var.vpcId

  #ingress {
  #  description      = "Load Balancer to App Server"
  #  from_port        = 80
  #  to_port          = 80
  #  protocol         = "tcp"
  #  cidr_blocks      = ["${var.subnetPublicACidr}", "${var.subnetPublicBCidr}"]
  #}

  ingress {
    description      = "Internal subnets to App Server"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${var.subnetPrivateACidr}", "${var.subnetPrivateBCidr}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
    var.labeltags,
    {
      Name = "myulc-app-${var.labeltags.env}",
      app = "myulc"
    })
}

resource "aws_security_group" "Public_ELB" {
  name        = "myulc-elb-public-${var.labeltags.env}"
  description = "Allow inbound traffic to Myulc App Server"
  vpc_id      = var.vpcId

  ingress {
    description      = "Internet to ELB port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Internet to ELB port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
    var.labeltags,
    {
      Name = "myulc-elb-public-${var.labeltags.env}",
      app = "myulc"
    })
}

#resource "aws_security_group" "Public_Myulc_ELB" {
#  name        = "myulc-elb-${var.labeltags.env}"
#  description = "Allow inbound traffic to Myulc App Server"
#  vpc_id      = var.vpcId
#
#
#  ingress {
#    from_port   = "443"
#    to_port     = "443"
#    protocol    = "tcp"
#    description = "VPN Access"
#
#    cidr_blocks = ["10.72.31.0/24"]
#  }
#  ingress {
#    from_port   = "80"
#    to_port     = "80"
#    protocol    = "tcp"
#    description = "VPN Access"
#
#    cidr_blocks = ["10.72.31.0/24"]
#  }
#  
#    
#  egress {
#    from_port        = 0
#    to_port          = 0
#    protocol         = "-1"
#    cidr_blocks      = ["0.0.0.0/0"]
#    ipv6_cidr_blocks = ["::/0"]
#  }
#  tags = merge(
#    var.labeltags,
#    {
#      Name = "myulc-elb-${var.labeltags.env}",
#      app = "myulc"
#    })
#}
#
