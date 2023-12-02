output "db_port" {
  description = <<-EOS
                Represent the port which used db.
                EOS
  value = aws_db_instance.db.port
}

output "db_address" {
  description = <<-EOS
                Represent the address which used db.
                EOS
  value = aws_db_instance.db.address
}