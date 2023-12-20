source "amazon-ebs" "shopping-prod" {
    
  ami_name   = local.image_name
  source_ami = var.ami_id
  instance_type = var.instance_type
  ssh_username  = "ec2-user"
  tags       = {
    Name    = local.image_name
    project = var.project_name
    env     = var.project_env
   }
    
  }



build {

  sources =  [ "source.amazon-ebs.shopping-prod" ]
  
  provisioner "file" {
    source = "../website"
    destination = "/tmp"
  }
  
  provisioner "shell" {
    script = "./setup.sh"
    execute_command = "sudo {{.Path}}"
  }
  
  
}

