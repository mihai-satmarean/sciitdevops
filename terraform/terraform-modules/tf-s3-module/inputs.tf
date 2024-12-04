variable "owner" {
  description = "The person who requested this resource"
  type        = string
}

variable "name" {
  description = "The name of the env"
  type        = string
}

variable "s3_bucket_names" {
  type    = list(any)
  default = []

}

variable "s3_bucket_names_overrides" {
  type    = list(any)
  default = []

}

variable "server_side_encryption_configuration" {
  description = "Encrypt s3 bucket"
  type        = any
  default     = {}

}

variable "force_destroy" {
  type        = bool
  description = ""
  default     = false

}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "acl" {
  type    = string
  default = "private"

}

variable "policy" {
  description = "A valid bucket policy JSON document"
  type        = string
  default     = ""

}

variable "attach_policy" {
  description = "Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy)"
  type        = bool
  default     = false

}

variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
  default     = []

}

variable "logging" {
  description = "Map containing access bucket logging configuration."
  type        = map(string)
  default     = {}

}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(string)
  default     = {}

}

variable "cors_rule" {
  description = "Map containing versioning configuration."
  type        = any
  default     = []
}

variable "attach_elb_log_delivery_policy" {
  description = "Controls if S3 bucket should have ELB log delivery policy attached"
  type        = bool
  default     = false
}

variable "attach_lb_log_delivery_policy" {
  description = "Controls if S3 bucket should have ALB/NLB log delivery policy attached"
  type        = bool
  default     = false
}

variable "control_object_ownership" {
  description = "Whether to manage S3 Bucket Ownership Controls on this bucket"
  type        = bool
  default     = true
}

variable "object_ownership" {
  description = "Object ownership. Valid values: BucketOwnerEnforced, BucketOwnerPreferred or ObjectWriter. 'BucketOwnerEnforced': ACLs are disabled, and the bucket owner automatically owns and has full control over every object in the bucket. 'BucketOwnerPreferred': Objects uploaded to the bucket change ownership to the bucket owner if the objects are uploaded with the bucket-owner-full-control canned ACL. 'ObjectWriter': The uploading account will own the object if the object is uploaded with the bucket-owner-full-control canned ACL."
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "attach_public_policy" {
  description = "Controls if a user defined public bucket policy will be attached (set to `false` to allow upstream to apply defaults to the bucket)"
  type        = bool
  default     = true
}

variable "extra_tags" {
  description = "Extra tags to dd to the bucket"
  type        = map(any)
  default     = {}
}

variable "website" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = any # map(string)
  default     = {}
}

