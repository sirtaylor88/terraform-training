# Terraform

## Get started

Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

```bash
    sudo apt install unzip
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
```

Create `provider.tf` file:

```bash
    touch provider.tf
```

In `provider.tf` file, add those codes:

```tf
    terraform {
      required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.27.0"
        }
      }
    }

    # Configure the AWS Provider
    provider "aws" {
      region = "us-east-1"
    }
```

Init terrform to install the provider

```bash
    terraform init
```

## Authenticate with AWS

Provide AWS credentials so terraform can perform actions with AWS:

```bash
    aws configure
```

```text
    AWS Access Key ID [None]: <AWS_ACCESS_KEY_ID>
    AWS Secret Access Key [None]: <AWS_SECRET_ACCESS_KEY>
    Default region name [None]: <region name> (i.e. us-east-1)
    Default output format [None]: json
```

## Add a resource

In `main.tf`, add:

```tf
    resource "aws_s3_bucket" "my_s3_bucket" {
      bucket = "my-s3-bucket-ntntuyen-002"
    }
```

To allow versioning for the resource, you need to add

```tf
    resource "aws_s3_bucket_versioning" "versioning_example" {
      bucket = aws_s3_bucket.my_s3_bucket.id
      versioning_configuration {
        status = "Enabled"
      }
    }
```

> [!IMPORTANT]
> If you are enabling versioning on the `S3 bucket` for the first time, AWS recommends that you wait for 15 minutes after enabling versioning before issuing write operations (PUT or DELETE) on objects in the bucket.
> For **critical and/or production** `S3 objects`, do not create a bucket, enable versioning, and create an object in the bucket within the same configuration. Doing so will not allow the AWS-recommended 15 minutes between enabling versioning and writing to the bucket.

## Terrform Console

To activate the console, type:

```bash
    terrform console
```

To display the full config of a resource, i.e. `aws_s3_bucket.my_s3_bucket`

```bash
    aws_s3_bucket.my_s3_bucket
```

To quit the console, simply type:

```bash
    exit
```

## Assign a value and display it using terraform

Declare the output value to the `.tf` file:

```tf
    output "my_s3_bucket_complete_details" {
      value = aws_s3_bucket.my_s3_bucket
    }
```

Then apply it. We can use `-refresh=false` in local to quick test. In prod, we always want to check the real state, not the one present in the `.tf` file.

```bash
    terrafrom apply -refresh=false
```
