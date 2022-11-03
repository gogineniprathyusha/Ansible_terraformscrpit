resource "aws_instance" "Ansible_controlnode" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "Devops"
  security_groups = ["ansible-lab-sg"]
  associate_public_ip_address = true
  user_data = file("Ansible_controlnode.sh")

  tags = {
    Name = "Ansible_controlnode"
  }
}