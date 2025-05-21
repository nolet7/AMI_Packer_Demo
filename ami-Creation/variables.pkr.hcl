variable "ami_name" {
  type    = string
  default = "learn-packer-linux-aws-test"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami_filters" {
  type = map(string)
  default = {
    name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
}

variable "ami_owners" {
  type    = list(string)
  default = ["099720109477"]
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "ami_regions" {
  type    = list(string)
  default = ["us-east-1", "us-west-2", "eu-central-1"]
}

variable "ami_tags" {
  type = map(string)
  default = {
    Name        = "MyUbuntuImage"
    Environment = "Production"
    OS_Version  = "Ubuntu 22.04"
    Release     = "Latest"
    Created_by  = "Packer"
  }
}

variable "security_group" {
  type    = string
  default = "sg-xxxxxxxx"
}

variable "subnet_id" {
  type    = string
  default = "subnet-xxxxxxxx"
}