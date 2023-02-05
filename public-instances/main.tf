resource "aws_instance" "hussein-ec2-public" {
  ami           = var.ami-id
  subnet_id = var.id-subnet
  instance_type = var.type-instance
  associate_public_ip_address = var.checking
  key_name = var.instance_key
  provisioner "local-exec" {
    command = "echo ${lookup(self.tags, "Name")}   ${self.public_ip} >> ./private-ip.txt"
  }

  provisioner "remote-exec" {
    inline = [
     "sudo apt update -y",
     "sudo apt install apache2 -y"
    ]
  }

  connection {
    type = var.conn-type
    host = "self.public_ip"
    user = var.instance-user
    private_key = file(var.path-priv-key)
  }
  vpc_security_group_ids = var.sg-pub-id
  tags = {
    Name = var.instance-name-pub
  }
}