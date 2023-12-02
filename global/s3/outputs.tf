output "backend_s3_bucket_id" {
  description = <<-EOS
                Represents the bucket id used for store the terraform states of project.
                EOS
  value = module.project_backend.tfstates_bucket_id
}

output "backend_dynamodb_table_name" {
  description = <<-EOS
                Represents the dynamodb table name used for locking the terraform states bucket.
                EOS
  value = module.project_backend.tflocks_table_name
}