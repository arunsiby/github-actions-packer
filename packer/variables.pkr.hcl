variable "project_name" {

  type        = string
  description = "Project name"
  default     = "shopping"
}

variable "project_env" {

  type        = string
  description = "Project Environment"
  default     = "production"
}


variable "ami_id" {

  type        = string
  description = "ami id"
  default     = "ami-02e94b011299ef128"
}


variable "instance_type" {

  type        = string
  description = "instance type"
  default     = "t2.micro"
}


locals {
   timestamp    = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
   image_name   = "${var.project_name}-${var.project_env}-${local.timestamp}"
 }


