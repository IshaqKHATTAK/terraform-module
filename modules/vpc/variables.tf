

variable "AWS_REGION" {
  type = string
  description = "AWS vpc region"
}

variable "VPC_CIDR" {
  type = string
  description = "vpc cidr block range"
}

variable "AWS_AZ_1" {
  type = string
  description = "first AZ which is us-east-1a"
}

variable "AWS_AZ_2" {
  type = string
  description = "second AZ which is us-east-1b"
}

variable "PB_SBNET_CIDR_1" {
  type = string
  description = "first public subnet sidr block."
}

variable "PB_SBNET_CIDR_2" {
  type = string
  description = "first public subnet sidr block."
}

variable "PR_SBNET_CIDR_1" {
  type = string
  description = "first private subnet sidr block."
}

variable "PR_SBNET_CIDR_2" {
  type = string
  description = "first private subnet sidr block."
}

variable "VPC_NAME" {
  type        = string
  description = "Name tag for the VPC"
}

variable "PUB_SUBNET1_NAME" {
  type        = string
  description = "Name tag for Public Subnet 1"
}

variable "PUB_SUBNET2_NAME" {
  type        = string
  description = "Name tag for Public Subnet 2"
}

variable "PR_SUBNET1_NAME" {
  type        = string
  description = "Name tag for Private Subnet 1"
}

variable "PR_SUBNET2_NAME" {
  type        = string
  description = "Name tag for Private Subnet 2"
}

variable "NG_NAME" {
  type        = string
  description = "Name tag for the Network Gateway"
}

variable "PB_RT_NAME" {
  type        = string
  description = "Name tag for the Public Route Table"
}

variable "PR_RT_NAME" {
  type        = string
  description = "Name tag for the Private Route Table"
}

variable "IGW_NAME" {
  type        = string
  description = "Name tag for the Internet Gateway"
}
