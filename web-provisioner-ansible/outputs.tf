output "aws_elb_dns_name" {
  value = "http://${aws_elb.web.dns_name}/"
}
