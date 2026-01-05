locals {
  common_name_suffix = "${var.project_name}-${var.environment}"
  ami_id = data.aws_ami.amazon_linux_2023.id
  default_vpc = data.aws_vpc.default_vpc.id
  default_subnet = data.aws_subnets.default_subnets.ids
  default_security_group = data.aws_security_group.default_security_group.id
  common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    }
}