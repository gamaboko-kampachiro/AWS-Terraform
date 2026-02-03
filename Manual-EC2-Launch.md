# Step 2: Launch EC2 Instance Manually (AWS Console)

## Objective
The objective of this step is to manually launch an Amazon EC2 instance using the AWS Management Console and demonstrate the complete process through a Loom video.

---

## Loom Video Walkthrough 🎥

The following Loom video demonstrates the full manual EC2 launch process, including:
- AWS Console navigation
- EC2 configuration
- Security group setup
- Instance launch and verification

🔗 **Loom Video Link:**  
https://www.loom.com/share/6467cb2df9f44c28be5943d8e501b61d

---

## Overview of Steps Performed

### 1. Login to AWS Management Console
- Logged into AWS Console
- Selected the region **ap-south-1 (Mumbai)**

---

### 2. Navigate to EC2 Service
- Opened EC2 Dashboard
- Clicked on **Launch Instance**

---

### 3. Choose Amazon Machine Image (AMI)
- Selected **Amazon Linux 2 / Amazon Linux 2023**
- Free-tier eligible AMI

---

### 4. Choose Instance Type
- Selected **t2.micro**
- Suitable for learning and free-tier usage

---

### 5. Configure Key Pair
- Selected or created a key pair
- Downloaded the `.pem` file for SSH access

---

### 6. Configure Network and Security Group
- Used default VPC
- Enabled public IP assignment
- Configured security group rules:
  - SSH (Port 22) → My IP
  - HTTP (Port 80) → Anywhere

---

### 7. Launch EC2 Instance
- Reviewed instance configuration
- Launched the instance
- Verified instance state as **Running**

---

## Instance Verification
- Copied Public IPv4 address
- Verified successful launch and accessibility
- Demonstrated instance details in the Loom video

---

## Key Learnings
- Understanding EC2 configuration through AWS Console
- Importance of AMI, instance type, key pairs, and security groups
- Hands-on experience before automating infrastructure using Terraform

---

## Conclusion
This step demonstrates a successful manual launch of an EC2 instance in AWS. The Loom video provides a clear visual walkthrough of the process, helping validate the practical implementation.
