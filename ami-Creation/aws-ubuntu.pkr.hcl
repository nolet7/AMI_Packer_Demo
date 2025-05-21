packer {
  required_plugins {
    amazon = {
      version = ">= 1.3.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  ami_regions   = ["us-east-1", "us-west-2", "eu-central-1"]

  source_ami_filter {
    filters = var.ami_filters
    most_recent = true
    owners      = var.ami_owners
  }

  ssh_username = var.ssh_username

  tags = {
    "Name"        = "MyUbuntuImage"
    "Environment" = "Production"
    "OS_Version"  = "Ubuntu 22.04"
    "Release"     = "Latest"
    "Created-by"  = "Packer"
  }
}

build {
  name    = "learn-packer"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    inline = [
      "echo Installing Updates",
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get install -y nginx"
    ]
  }

  provisioner "file" {
    source      = "assets"
    destination = "/tmp/"
  }

  provisioner "shell" {
    inline = [
      "sudo sh /tmp/assets/setup-web.sh",
    ]
  }
}