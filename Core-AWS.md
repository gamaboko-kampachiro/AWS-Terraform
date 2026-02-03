# AWS Core Concepts

## Introduction
This document explains the core concepts of Amazon Web Services (AWS) that are required to understand how cloud infrastructure works. These concepts form the foundation for launching and managing resources such as EC2 instances.

---

## 1. AWS Global Infrastructure

### Region
A Region is a physical geographical location where AWS has multiple data centers.
Each region is isolated from others to provide fault tolerance and stability.

**Example:**  
ap-south-1 (Mumbai)

---

### Availability Zone (AZ)
An Availability Zone is one or more isolated data centers within a region.
AZs are designed to be independent so that failure in one AZ does not affect others.

**Example:**  
ap-south-1a, ap-south-1b

---

### Edge Location
Edge locations are used by AWS CloudFront to cache and deliver content to users with low latency.
They are located closer to end users.

---

## 2. IAM (Identity and Access Management)

IAM is an AWS service used to manage access to AWS resources securely.

### Key Components:
- **Users** – Individual identities with specific permissions
- **Roles** – Permissions assigned to AWS services (recommended for EC2)
- **Policies** – JSON documents that define permissions

IAM helps follow the principle of **least privilege**, ensuring users and services only have the access they need.

---

## 3. EC2 (Elastic Compute Cloud)

EC2 provides scalable virtual servers in the cloud, known as instances.

### Important EC2 Components:
- **AMI (Amazon Machine Image):** Template containing OS and software
- **Instance Type:** Defines CPU, memory, and performance (e.g., t2.micro)
- **Key Pair:** Used for secure SSH access
- **Security Group:** Controls network traffic to the instance

EC2 allows users to run applications without managing physical servers.

---

## 4. VPC (Virtual Private Cloud)

A VPC is a logically isolated network created within AWS.

### Components of VPC:
- **Subnet:** A range of IP addresses within a VPC
  - Public Subnet: Has internet access
  - Private Subnet: No direct internet access
- **Internet Gateway (IGW):** Enables internet connectivity for public subnets
- **Route Table:** Defines how traffic is routed within the VPC

VPC provides full control over networking.

---

## 5. Security Group

A Security Group acts as a virtual firewall for EC2 instances.

### Key Features:
- Controls inbound and outbound traffic
- Rules are stateful
- Works at the instance level

### Example Rules:
- Allow SSH (Port 22) from My IP
- Allow HTTP (Port 80) from Anywhere

Security Groups help protect AWS resources from unauthorized access.

---

## Conclusion
Understanding AWS core concepts such as Regions, IAM, EC2, VPC, and Security Groups is essential before deploying infrastructure manually or using Infrastructure as Code tools like Terraform.
