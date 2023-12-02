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

variable "db_instance_class" {
  description = <<-EOS
                Represents the db instance class used in configuraiton.
                EOS
  type = string
}

variable "db_allocated_storage" {
  description = <<-EOS
                Represents the number of GB allocated for store db.
                EOS
  type = number
}

variable "db_name" {
  description = <<-EOS
                Represents the name of used db.
                EOS
  type = string
}

variable "db_username" {
  description = <<-EOS
                Represents the username of db.
                EOS
  type = string
}

variable "db_password" {
  description = <<-EOS
                Represents the password of db.
                EOS
  type = string
}