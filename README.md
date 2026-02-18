# AWS Infrastructure (Terraform)

This repository contains AWS infrastructure defined using Terraform, organized into reusable modules and environment-specific configurations.

## Structure

- `repos/modules/`
  - `vpc/` – Simple VPC module
    - `main.tf` – Defines the `aws_vpc` resource
    - `variables.tf` – Input variables (CIDR block, tags)
    - `outputs.tf` – Outputs (e.g. `vpc_id`)
- `repos/envs/`
  - `prod/` – Production environment configuration
    - `providers.tf` – Terraform and AWS provider configuration
    - `variables.tf` – Environment variables (region, VPC CIDR, tags)
    - `main.tf` – Calls the `vpc` module

## Usage

From the repo root:

```bash
cd repos/envs/prod

# Initialize Terraform
terraform init

# Review the execution plan
terraform plan

# Apply the changes
terraform apply
```

You can override defaults (e.g. VPC CIDR, tags, region) using `-var` flags or a `.tfvars` file if needed.
