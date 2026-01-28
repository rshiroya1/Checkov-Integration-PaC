# main.tf - Secure S3 Bucket Module
resource "aws_kms_key" "s3_key" {
  description             = "KMS key for S3 bucket encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true # Security Best Practice
}

resource "aws_s3_bucket" "secure_storage" {
  bucket = "sentinel-prod-data-bucket-${var.environment}"
  
  tags = {
    Project   = "Sentinel"
    Security  = "High"
    ManagedBy = "Terraform"
  }
}

# Enforce Public Access Block (The "Contractual Control")
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.secure_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enforce Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.secure_storage.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
