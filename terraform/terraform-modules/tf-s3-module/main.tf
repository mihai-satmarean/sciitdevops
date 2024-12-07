module "s3_buckets" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.2.2"

  count         = length(var.s3_bucket_names_overrides) > 0 ? length(var.s3_bucket_names_overrides) : length(var.s3_bucket_names)
  bucket        = length(var.s3_bucket_names_overrides) > 0 ? var.s3_bucket_names_overrides[count.index] : "tf-${var.s3_bucket_names[count.index]}-${var.owner}-${var.name}"
  acl           = var.acl
  force_destroy = var.force_destroy

  server_side_encryption_configuration = var.server_side_encryption_configuration
  lifecycle_rule                       = var.lifecycle_rule
  logging                              = var.logging
  versioning                           = var.versioning
  cors_rule                            = var.cors_rule
  attach_elb_log_delivery_policy       = var.attach_elb_log_delivery_policy
  attach_lb_log_delivery_policy        = var.attach_lb_log_delivery_policy

  block_public_acls        = var.block_public_acls
  block_public_policy      = var.block_public_policy
  ignore_public_acls       = var.ignore_public_acls
  restrict_public_buckets  = var.restrict_public_buckets
  attach_public_policy     = var.attach_public_policy
  attach_policy            = var.attach_policy
  control_object_ownership = var.control_object_ownership
  object_ownership         = var.object_ownership
  policy                   = var.policy

  website = var.website

  tags = merge(local.common_tags, var.extra_tags)
}

