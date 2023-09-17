################################## Network Config ###################################
variable "project_name" {
  description = "name of the project"
  type        = string
}

variable "env" {
  description = "environment"
  type        = string
}

################################## Instance Config ###################################

variable "ec2_ami_id" {
  description = "EC2 instance ami id"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "aws_key_pair_name" {
  description = "aws ssh key to be associated with the EC2 instances"
  type        = string
}

########################## PROVIDER ##############################
variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "user_access_key" {
  description = "user access key"
  type        = string
}

variable "user_secret_key" {
  description = "user secret key"
  type        = string
}