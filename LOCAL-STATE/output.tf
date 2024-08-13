output "bucket_id_output" {
  description = "Id da Bucket criada na AWS"
  value       = aws_s3_bucket.meu-bucket-local-state.id
}

output "bucket_arn_output" {
  description = "ARN da Bucket criada na AWS"
  value       = aws_s3_bucket.meu-bucket-local-state.arn
  sensitive   = true
}