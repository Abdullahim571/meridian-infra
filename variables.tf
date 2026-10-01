variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name: dev, staging, or production. Used in resource names and tags."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "Invalid environment \"${var.environment}\". Must be one of: dev, staging, production (lowercase, exact match)."
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type. t2.micro is Free Tier eligible on legacy Free Tier accounts."
  type        = string
  default     = "t2.micro"
}

variable "ssh_allowed_cidr" {
  description = "CIDR allowed to SSH into the instance. Set this to your own IP (e.g. 203.0.113.10/32). Null disables SSH ingress."
  type        = string
  default     = null
}

variable "key_name" {
  description = "Name of an existing EC2 key pair for SSH access. Null launches without a key pair."
  type        = string
  default     = null
}

variable "use_localstack" {
  description = "Send AWS calls to LocalStack instead of real AWS. CI sets this to false."
  type        = bool
  default     = true
}

variable "localstack_endpoint" {
  description = "LocalStack edge endpoint that all AWS service calls are sent to."
  type        = string
  default     = "http://localhost:4566"
}

variable "ami_id" {
  description = "AMI ID to launch. Null looks up the latest Amazon Linux 2023 image. Set this for LocalStack (list options with `awslocal ec2 describe-images`)."
  type        = string
  default     = null
}
