variable "unique_prefix" {
  description = <<-EOS
                Represents the unique prefix which used for naming entities of configuration.
                EOS
  type = string
}

variable "project_name" {
  description = <<-EOS
                Represents the project name which used for naming entities of configuration.
                EOS
  type = string
}

variable "instance_server_port" {
  description = <<-EOS
                Represents the port number on which listen instance server.
                EOS
  type = number
}

variable "asg_min_size" {
  description = "value"
  type = number
}

variable "asg_max_size" {
  description = "value"
  type = number
}

variable "instance_type" {
  description = "value"
  type = string
}

variable "asg_custom_tags" {
  description = "value"
  type = map(string)
}