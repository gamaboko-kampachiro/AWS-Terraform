# Launching an EC2 Instance Using Terraform (Full Process)

## Objective
This document explains the **complete process of launching an EC2 instance in AWS using Terraform**, including:

- VPC creation  
- Public Subnet  
- Internet Gateway  
- Route Table  
- Security Group  
- Key Pair  
- EC2 Instance  
- Accessing EC2 via SSH  
- Destroying infrastructure with Terraform

---

## Loom Video Walkthrough 🎥

Watch the full process in this Loom video:  
🔗 https://www.loom.com/share/c773c325e6604df0a09e24c7a9abc1e9

---

## Prerequisites
- AWS account with permissions to create VPC, EC2, and related resources  
- Terraform installed  
- AWS CLI configured  
- SSH key pair (.pem or .ppk)  

---

## 1️⃣ Folder Structure
terraform/
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf


---

## 2️⃣ Terraform Files

### `provider.tf`

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

---

### 'variables.tf'

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Existing AWS key pair name for SSH access"
  type        = string
}

---

### 'main.tf'

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = { Name = "terraform-vpc" }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "terraform-igw" }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags                    = { Name = "terraform-public-subnet" }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = { Name = "terraform-public-rt" }
}

# Route Table Association
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "terraform-ec2-sg" }
}

# EC2 Instance
resource "aws_instance" "ec2" {
  ami                    = "ami-0f58b397bc5c1f2e8" # Amazon Linux 2 (Mumbai)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name

  tags = { Name = "terraform-ec2" }
}

---

### 'outputs.tf'

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}

output "vpc_id" {
  description = "ID of the VPC created"
  value       = aws_vpc.main.id
}

---

3️⃣ Terraform Workflow

1. Initialize
	terraform init

2. Validate
	terraform validate

3. Preview Plan
	terraform plan -var="key_name=your-key-name"

4. Apply (Create Infrastructure)
	terraform apply -var="key_name=your-key-name"

  Type yes when prompted
  Example output:
  "
   ec2_public_ip = "13.xxx.xxx.xxx"
   vpc_id        = "vpc-0abc123"
  "

5. to Access via SSH
	ssh -i your-key.pem ec2-user@<ec2_public_ip>

6. Destroy Infrastructure
	terraform destroy -var="key_name=your-key-name"
  "
   Type yes to remove all resources
  "
---
