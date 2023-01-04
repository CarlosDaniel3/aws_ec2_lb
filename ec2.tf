resource "aws_instance" "server" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web.id]
  count                       = var.instance_count
  subnet_id                   = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name        = var.name
    Provisioner = "Terraform"
    Owner       = "Carlos Daniel"
  }
}