# modules/vpc/main

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "main-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets_cidrs)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnets_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Private Subnets
resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnets_cidrs)
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_subnets_cidrs[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "two_tier_igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.two_tier_igw.id
}

resource "aws_route_table_association" "public_rt_assoc" {
  count          = length(var.public_subnets_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# # Web Servers Security Group
# resource "aws_security_group" "web_sg" {
#   vpc_id = aws_vpc.main_vpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tpc"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # Database Security Group
# resource "aws_security_group" "db_sg" {
#   vpc_id = aws_vpc.main_vpc.id

#   ingress {
#     from_port       = 3306
#     to_port         = 3306
#     protocol        = "tpc"
#     security_groups = [aws_security_group.web_sg.id]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
