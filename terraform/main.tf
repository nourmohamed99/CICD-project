#Create VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = "nodejs-vpc" 
    }
}

#Create Internet Gateway
resource "aws_internet_gateway" "my_internet_gateway" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "nodejs-gw"
    }
}

#Create Route Table
resource "aws_route" "my_route_table" {

    route_table_id = aws_vpc.my_vpc.main_route_table_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id

}

#Create Public Subnet
 resource "aws_subnet" "my_public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.16.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name = "nodejs subnet"
    }
 }

#Create Security Group
resource "aws_security_group" "my_security_group" {
  
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = aws_vpc.my_vpc.id


  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }
}

#Create ec2
resource "aws_instance" "my_ec2" {
    ami = "ami-0c101f26f147fa7fd"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.my_public_subnet.id
    vpc_security_group_ids = [aws_security_group.my_security_group.id]

}

#Configure Elastic IP
resource "aws_eip" "my_eip" {
  vpc = true
}

 #Associate eip to the ec2
resource "aws_eip_association" "associate" {
  instance_id = aws_instance.my_ec2.id
  allocation_id = aws_eip.my_eip.id
}

#Output Elastic IP
output "eip_value" {
    description = "The publih ip of the ec2 "
    value = aws_eip.my_eip.public_ip
}
