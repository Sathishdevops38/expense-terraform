data "aws_ami" "amazon_linux_2023" {
  # The 'amazon' owner alias is used to search for official AMIs provided by AWS.
  owners = ["self"]
  # Setting most_recent to true ensures you get the latest version.
  most_recent = true

  # Filters to find the correct AMI name pattern for AL2023
  filter {
    name   = "name"
    values = ["devops-practice"] 
  }

  # Standard filters for virtualization and root device type
  filter {
    name   = "architecture"
    values = ["x86_64"] # Specify the desired architecture
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

data "aws_security_group" "default_security_group" {
  vpc_id = data.aws_vpc.default_vpc.id
  name   = "default"
}

