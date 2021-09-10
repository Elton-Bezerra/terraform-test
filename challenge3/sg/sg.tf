variable "security_group_rules" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_security_group" "allow_http_https" {
  name        = "allow_http_https"
  description = "Allow HTTP/HTTPS inbound/outbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.security_group_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.security_group_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}

output "sg_name" {
  value = aws_security_group.allow_http_https.name
}

