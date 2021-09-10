provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "db_server" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  tags = {
    Name = "db_server"
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  tags = {
    Name = "web_server"
  }

  user_data       = file("server-script.sh")
  security_groups = [aws_security_group.allow_http_https.name]
}


resource "aws_eip" "elastic-ip" {
  instance = aws_instance.web_server.id
}


output "db_server_id" {
  value = aws_instance.db_server.id
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
