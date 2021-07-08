resource "aws_s3_bucket" "main" {
  bucket = var.bucket
  versioning {
    enabled = var.enable_versioning
  }
  tags = {
    "Name" = "${var.bucket_namespace}"
  }
}

resource "aws_iam_user" "primary" {
  name = "service_s3_rw"
}

resource "aws_iam_access_key" "primary" {
  user = aws_iam_user.primary.name
}

resource "aws_iam_user_policy" "s3_rw_policy" {
  name   = "s3_read_write_policy"
  user   = aws_iam_user.primary.name
  policy = data.aws_iam_policy_document.bucket_rw.json
}


resource "aws_iam_user" "secondary" {
  name = "service_s3_ronly"
}

resource "aws_iam_access_key" "secondary" {
  user = aws_iam_user.secondary.name
}

resource "aws_iam_user_policy" "s3_read_policy" {
  name   = "s3_read_only_policy"
  user   = aws_iam_user.secondary.name
  policy = data.aws_iam_policy_document.bucket_ronly.json
}

