
data "aws_iam_policy_document" "bucket_ronly" {
  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = [
      aws_s3_bucket.main.arn
    ]
    effect = "Allow"
  }

}

data "aws_iam_policy_document" "bucket_rw" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:ListBucketMultipartUploads",
    ]
    resources = [
      aws_s3_bucket.main.arn
    ]
    effect = "Allow"
  }
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListMultipartUploadParts",
      "s3:AbortMultipartUpload",
    ]
    resources = [
      "${aws_s3_bucket.main.arn}/*"
    ]
    effect = "Allow"
  }
}
