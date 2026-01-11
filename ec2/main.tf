resource "aws_instance" "this" {
  # Reference the ID found by the data source
  count = var.num
  ami           = local.ami_id
  subnet_id     = local.default_subnet[0]
  security_groups = [local.default_security_group]
  instance_type   = var.instance_type # Or any other desired instance type
  user_data = file("ansible.sh")
  tags= merge(
    var.tags,
    local.common_tags,{
      Name = "${local.common_name_suffix}-${element(values(var.name), count.index)}"
    }
  ) 
}


resource "aws_route53_record" "db" {
  count = var.num
  zone_id = var.zone_id
  name    = "${element(values(var.name), count.index)}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  # Logic: If the name is "frontend", use public_ip; otherwise, use private_ip
  records = [
    element(values(var.name), count.index) == "frontend" ? 
    aws_instance.this[count.index].public_ip : 
    aws_instance.this[count.index].private_ip
  ]
  allow_overwrite = true
}