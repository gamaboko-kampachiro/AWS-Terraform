output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}
