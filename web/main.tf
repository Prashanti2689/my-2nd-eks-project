#ec2

resource "aws_instance" "my-eks-server"{
    ami = "ami-04033bacc0e4caae7"
    instance_type = "t2.micro"
    subnet_id = var.sn
    security_groups = [var.sg]

    tags = {
        Name = "my-ec2-server"

    }
}