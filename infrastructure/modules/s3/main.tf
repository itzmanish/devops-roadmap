resource "aws_s3_bucket" "main" {
  bucket        = var.bucket
  force_destroy = true

  versioning {
    enabled = var.enable_versioning
  }
  tags = {
    "Name" = "${var.bucket_namespace}"
  }
}

resource "aws_iam_user" "s3_rw" {
  name = "service_s3_rw"
}

resource "aws_iam_access_key" "s3_rw" {
  user = aws_iam_user.s3_rw.name
}

resource "aws_iam_user_policy" "s3_rw_policy" {
  name   = "s3_read_write_policy"
  user   = aws_iam_user.s3_rw.name
  policy = data.aws_iam_policy_document.bucket_rw.json
}


resource "aws_iam_user" "s3_ronly" {
  name = "service_s3_ronly"
}

resource "aws_iam_access_key" "s3_ronly" {
  user = aws_iam_user.s3_ronly.name
}

resource "aws_iam_user_policy" "s3_read_policy" {
  name   = "s3_read_only_policy"
  user   = aws_iam_user.s3_ronly.name
  policy = data.aws_iam_policy_document.bucket_ronly.json
}

