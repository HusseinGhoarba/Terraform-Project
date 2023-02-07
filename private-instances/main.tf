resource "aws_instance" "hussein-ec2-private" {
  ami           = var.ami-id
  subnet_id = var.id-subnet
  instance_type = var.type-instance
  associate_public_ip_address = "false"
  provisioner "local-exec" {
    command = "echo ${lookup(self.tags, "Name")}   ${self.private_ip} >> ./private-ip.txt"
  }
  user_data = var.user-data-inf
  vpc_security_group_ids = var.sg-priv-id
  tags = {
    Name = var.instance-name-priv
  }
  depends_on = [
    var.dependencies
  ]
}