provider "aws" {
    region = var.AWS_REGION
}
module "aws_vpc_module" {
    source = "../../modules/vpc"
    AWS_REGION = var.AWS_REGION
    VPC_CIDR = var.VPC_CIDR
    PB_SBNET_CIDR_1 = var.PB_SBNET_CIDR_1
    PB_SBNET_CIDR_2 = var.PB_SBNET_CIDR_2
    PR_SBNET_CIDR_1 = var.PR_SBNET_CIDR_1
    PR_SBNET_CIDR_2 = var.PR_SBNET_CIDR_2
    AWS_AZ_1 = var.AWS_AZ_1
    AWS_AZ_2 = var.AWS_AZ_2
    IGW_NAME = var.IGW_NAME
    VPC_NAME = var.VPC_NAME
    PUB_SUBNET1_NAME = var.PUB_SUBNET1_NAME
    PUB_SUBNET2_NAME = var.PUB_SUBNET2_NAME
    NG_NAME = var.NG_NAME
    PR_SUBNET2_NAME = var.PR_SUBNET2_NAME
    PR_SUBNET1_NAME = var.PR_SUBNET1_NAME
    PR_RT_NAME = var.PR_RT_NAME
    PB_RT_NAME = var.PB_RT_NAME
}