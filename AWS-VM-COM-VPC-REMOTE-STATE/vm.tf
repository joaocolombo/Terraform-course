//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair

resource "aws_key_pair" "key_pair" {
  key_name   = "aws-key-pair"
  public_key = file("./aws-key-pair.pub")
}

//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "vm" {
  ami           = "ami-080111c1449900431"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair.key_name
  subnet_id     = data.terraform_remote_state.vpc.outputs.subnet_id
  //QUE LOUCURA!!! 
  //  data. => vem la do main é o bloco data  
  //  terraform_remote_state.vpc => bloco.nome 
  //  subnet_id => na criação do vpc(AWS-VPC) tem o output e o nome é subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true
  tags = {
    Name = "vm-colombo"
  }
}