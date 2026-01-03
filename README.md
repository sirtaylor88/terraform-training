# Terraform

## Get start

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
