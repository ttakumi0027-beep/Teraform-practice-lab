provider "aws" {
  profile = "terraform_user"
  region = "ap-northeast-1"
}

resource "aws_instance" "hello-world" {
  ami = "ami-088103e734f7e0529"
  instance_type = "t3.micro"
}