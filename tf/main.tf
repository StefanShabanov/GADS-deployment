resource "aws_instance" "example_server" {
  ami           = "ami-0faab6bdbac9486fb"
  instance_type = "t2.micro"
  key_name      = "GADS"
  tags = {
    Name = "GADS"
  }
  vpc_security_group_ids = [aws_security_group.GADS_SG.id]

  user_data = <<-EOF
    #!/bin/bash
    ###INSTALL DOCKER
    sudo snap install docker
    sudo addgroup --system docker
    sudo adduser ubuntu docker
    newgrp docker
    sudo snap disable docker
    sudo snap enable docker

    ### Install GO
    sudo apt-get update && sudo apt-get -y install golang-go

    ### Install NODE.js
    sudo apt install -y nodejs
  EOF

  provisioner "file" {
    source = "../docker.sh"
    destination = "/tmp/docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/docker.sh",
      "/tmp/script.sh args",
      ]
  }
}
