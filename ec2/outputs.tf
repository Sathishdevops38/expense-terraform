output "public_ip" {
  value = aws_instance_this.public_ip
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "db_record_fqdns" {
  description = "The fully qualified domain names of the Route53 records"
  value       = aws_route53_record.db[*].fqdn
}