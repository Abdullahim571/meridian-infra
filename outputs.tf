output "instance_public_ip" {
  description = "Public IP address of the EC2 instance."
  value       = aws_instance.app.public_ip
}

output "bucket_name" {
  description = "Name of the S3 bucket."
  value       = aws_s3_bucket.app.bucket
}

output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.main.id
}

output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.app.id
}
