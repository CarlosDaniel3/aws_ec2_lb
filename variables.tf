variable "aws_region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-1"
}

variable "instance_count" {
  type        = number
  description = "Number of instances"
  default     = 2
}
variable "env" {
  description = "Environment of the application"
  default     = "dev"
}

variable "instance_type" {
  description = "AWS Instance type defines the hardware configuration of the machine"
  default     = "t2.micro"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0ca7a41b0cf690c29"
}

variable "name" {
  description = "Name of the application"
  default     = "server-nginx"
}

