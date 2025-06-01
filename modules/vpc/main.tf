


#AWS VPC
resource "aws_vpc" "this" {
  cidr_block = var.VPC_CIDR
  
  tags = {
    Name: var.VPC_NAME
  }
}


#AWS SUBNETS PUBLIC AND PRIVATE
resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.PB_SBNET_CIDR_1
  availability_zone = var.AWS_AZ_1
  map_public_ip_on_launch = true
  tags = {
    Name: var.PUB_SUBNET1_NAME
  }
}


#private
resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.PR_SBNET_CIDR_1
  availability_zone = var.AWS_AZ_1
  tags = {
    Name:var.PR_SUBNET1_NAME
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.PR_SBNET_CIDR_2
  availability_zone = var.AWS_AZ_2
  tags = {
    Name:var.PR_SUBNET2_NAME
  }
}

#public
resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.PB_SBNET_CIDR_2
  availability_zone = var.AWS_AZ_2
  map_public_ip_on_launch = true
  tags = {
    Name:var.PUB_SUBNET2_NAME
  }
}

#AWS IGW
resource "aws_internet_gateway" "this" {
 vpc_id = aws_vpc.this.id
 tags = {
    Name: var.IGW_NAME
 } 
}

resource "aws_eip" "this" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id = aws_subnet.public_subnet_1.id

  tags = {
    Name = var.NG_NAME
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.this]

}

#public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name:var.PB_RT_NAME
    # subnet_id:aws_subnet.public_subnet_1.id
  }
  
}
# Associate Public Subnet to Public Route Table
resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.this.id
  # route = {
  #   cidr_block = var.PR_SBNET_CIDR_1
  #   route_table_id = aws_route_table.this.id
  # }

  tags = {
    Name:var.PR_RT_NAME
    # subnet_id:aws_subnet.private_subnet_1.id
  }
  
}

#Asscitea private route to private subnet
resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}


# AWS Network Access Control List NACL
# resource "aws_network_acl" "vpc_nacl" {
#   vpc_id = aws_vpc.this.id
#   egress {
#     protocol   = "tcp"
#     rule_no    = 200
#     action     = "allow"
#     cidr_block = "0.0.0.0/0" #any can connect using ssh
#     from_port  = 443
#     to_port    = 443
#   }
#   ingress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 80
#     to_port    = 80
#   }
#   ingress {
#     protocol   = "tcp"
#     rule_no    = 300
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 443 
#     to_port    = 443 
#   }
#   tags = {
#     Name = "Terraform vpc NACL"
#   }
  
# }

