resource "aws_instance" "hussein-ec2-private" {
  ami           = var.ami-id
  subnet_id = var.id-subnet
  instance_type = var.type-instance
  provisioner "local-exec" {
    command = "echo ${lookup(self.tags, "Name")}   ${self.public_ip} >> ./private-ip.txt"
  }
  user_data = <<EOF
    #!/bin/bash
    # install httpd (Linux Version2)
    yum update -y
    yum -y install httpd
    systemctl start httpd
    systemctl enable httpd
    EOF
  vpc_security_group_ids = var.sg-priv-id
  tags = {
    Name = var.instance-name-priv
  }
}