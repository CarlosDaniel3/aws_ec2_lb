data "aws_availability_zones" "available_zones" {
  state = "available"
}

resource "aws_vpc" "ec2_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.ec2_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.ec2_vpc.cidr_block, 8, 2 + count.index)
  availability_zone       = data.aws_availability_zones.available_zones.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.ec2_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ec2_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  tags = {
    Name = "dev-private-subnet"
  }

}
