data "aws_canonical_user_id" "current" {}

data "aws_caller_identity" "caller_identity" {}

#-------------------------------------------------------------
#                  S3 - "us-east-1"
#-------------------------------------------------------------

data "aws_iam_policy_document" "us_east_1_access_log_delivery" {
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_us_east_1.s3_bucket_arn}",
      "${module.s3_us_east_1.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_us_east_1" {
  source = "../"

  bucket_name             = "damp-pii-us-east-1-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.us_east_1_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    },
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}

#-------------------------------------------------------------
#                  S3 - "us-west-1"
#-------------------------------------------------------------

data "aws_iam_policy_document" "us_west_1_access_log_delivery" {
  provider = aws.us-west-1
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_us_west_1.s3_bucket_arn}",
      "${module.s3_us_west_1.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_us_west_1" {
  source = "../"
  providers = {
    aws = aws.us-west-1
  }

  bucket_name             = "damp-pii-us-west-1-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.us_west_1_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    }
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}

#-------------------------------------------------------------
#                  S3 - "sa-east-1"
#-------------------------------------------------------------

data "aws_iam_policy_document" "sa_east_1_access_log_delivery" {
  provider = aws.sa-east-1
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_sa_east_1.s3_bucket_arn}",
      "${module.s3_sa_east_1.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_sa_east_1" {
  source = "../"
  providers = {
    aws = aws.sa-east-1
  }

  bucket_name             = "damp-pii-sa-east-1-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.sa_east_1_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    },
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}

#-------------------------------------------------------------
#                  S3 - "ca-central-1"
#-------------------------------------------------------------

data "aws_iam_policy_document" "ca_central_1_access_log_delivery" {
  provider = aws.ca-central-1
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_ca_central_1.s3_bucket_arn}",
      "${module.s3_ca_central_1.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_ca_central_1" {
  source = "../"
  providers = {
    aws = aws.ca-central-1
  }

  bucket_name             = "damp-pii-ca-central-1-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.ca_central_1_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    },
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}

#-------------------------------------------------------------
#                  S3 - "eu-central-1"
#-------------------------------------------------------------

data "aws_iam_policy_document" "eu_central_1_access_log_delivery" {
  provider = aws.eu-central-1
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_eu_central_1.s3_bucket_arn}",
      "${module.s3_eu_central_1.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_eu_central_1" {
  source = "../"
  providers = {
    aws = aws.eu-central-1
  }

  bucket_name             = "damp-pii-eu-central-1-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.eu_central_1_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    },
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}

#-------------------------------------------------------------
#                  S3 - "eu-west-2"
#-------------------------------------------------------------

data "aws_iam_policy_document" "eu_west_2_access_log_delivery" {
  provider = aws.eu-west-2
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_eu_west_2.s3_bucket_arn}",
      "${module.s3_eu_west_2.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_eu_west_2" {
  source = "../"
  providers = {
    aws = aws.eu-west-2
  }

  bucket_name             = "damp-pii-eu-west-2-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.eu_west_2_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    },
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}

#-------------------------------------------------------------
#                  S3 - "ap-south-1"
#-------------------------------------------------------------

data "aws_iam_policy_document" "ap_south_1_access_log_delivery" {
  provider = aws.ap-south-1
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_ap_south_1.s3_bucket_arn}",
      "${module.s3_ap_south_1.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_ap_south_1" {
  source = "../"
  providers = {
    aws = aws.ap-south-1
  }

  bucket_name             = "damp-pii-ap-south-1-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.ap_south_1_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    },
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}

#-------------------------------------------------------------
#                  S3 - "ap-southeast-2"
#-------------------------------------------------------------

data "aws_iam_policy_document" "ap_southeast_2_access_log_delivery" {
  provider = aws.ap-southeast-2
  statement {
    sid = "PrincipalPutObjectiflpAddress"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect  = "Allow"
    actions = [
      "s3:*",
      ]
    resources = [
      "${module.s3_ap_southeast_2.s3_bucket_arn}",
      "${module.s3_ap_southeast_2.s3_bucket_arn}/*",
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:Sourcelp"

      values = [
        "203.0.113.0/24",
      ]
    }
  }
}

module "s3_ap_southeast_2" {
  source = "../"
  providers = {
    aws = aws.ap-southeast-2
  }

  bucket_name             = "damp-pii-ap-southeast-2-bucket-01"
  force_destroy           = true
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  bucket_policy = data.aws_iam_policy_document.ap_southeast_2_access_log_delivery.json
  attach_access_control_policy = true
  object_ownership             = "ObjectWriter"
  grant_permissions            = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permission = "FULL_CONTROL"
    },
  ]
  versioning_status = "Disabled"
  sse_configuration = {
    attach_sse_configuration = true
    sse_algorithm            = "AES256"
  }
  s3_object = {
    enabled = true
    source = "./files"
  }
  tags = local.tags
}