module "eip" {
  source      = "../eip"
  instance_id = aws_instance.web_server.id
}

module "sg" {
  source = "../sg"
}

resource "aws_instance" "web_server" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  tags = {
    Name = "web_server"
  }

  user_data       = file("${path.module}/server-script.sh")
  security_groups = [module.sg.sg_name]
}

output "PublicIP" {
  value = module.eip.web_server_public_ip
}
