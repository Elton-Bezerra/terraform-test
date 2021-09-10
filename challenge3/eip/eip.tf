variable "instance_id" {
  type = string
}

resource "aws_eip" "elastic-ip" {
  instance = var.instance_id
}


output "web_server_public_ip" {
  value = aws_eip.elastic-ip.public_ip
}