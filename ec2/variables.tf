variable "project_name" {
  default = "expense"
}
variable "environment" {
  default = "dev"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "num" {
  default = 3
}
variable "tags" {
  default = {
    created_by = "terraform"
  }
}

variable "zone_id" {
  default = "Z041507112WH8TKZP9NS3"
}

variable "domain_name" {
  default = "daws38sat.fun"
}

variable "name" {
  type = map(string)
  default = {
    ec1 = "mysql"
    ec2 = "backend"
    ec3 = "frontend"
  }
}