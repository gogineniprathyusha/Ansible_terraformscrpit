variable "ami" {
  type        = string
  description = "The id of the mcahine image (AMI) to use for the server"
  default     = "ami-09d3b3274b6c5d4aa"
}

variable "instance_type" {
  type        = string
  description = "The id of the mcahine image (AMI) to use for the server"
  default     = "t2.micro"
}

variable "ssh_key_pair" {
    default = "/users/prathyusha/downloads/Devops.pem"
}
