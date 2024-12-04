output "bucket_names" {
  value = module.s3_buckets[*].s3_bucket_id
}

output "bucket_regional_domain_name" {
  value = module.s3_buckets[*].s3_bucket_bucket_regional_domain_name
}

output "bucket_arn" {
  value = module.s3_buckets[*].s3_bucket_arn
}

