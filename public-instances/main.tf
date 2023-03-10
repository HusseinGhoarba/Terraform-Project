resource "aws_instance" "hussein-ec2-public" {
  ami           = var.ami-id
  subnet_id = var.id-subnet
  instance_type = var.type-instance
  associate_public_ip_address = var.checking
  key_name = var.instance_key
  vpc_security_group_ids = var.sg-pub-id

  connection {
    type = var.conn-type
    host = self.public_ip
    user = var.instance-user
    private_key = file(var.path-priv-key)
  }

  provisioner "local-exec" {
    command = "echo ${lookup(self.tags, "Name")}   ${self.private_ip} >> ./private-ip.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y ",
      "echo 'server {\nlisten 80 default_server;\nlisten [::]:80 default_server;\nserver_name _;\nlocation / {\nproxy_pass http://${var.prv-alb-dns};\n}\n}' > default",
      "sudo mv default /etc/nginx/sites-enabled/default",
      "sudo systemctl restart nginx"
    ]
  }

  tags = {
    Name = var.instance-name-pub
  }
}
