# Checkov-Integration-PaC: Secure AWS Provisioning Pipeline

## Overview
A production-grade DevSecOps pipeline that automates deployment of hardened AWS infrastructure.
This repo shifts security left by adding Policy as Code (PaC) gates before infrastructure is applied.

## Security Features
- **Policy as Code (Terraform Compliance):** Plan-time behavioral checks to enforce least privilege.
- **KMS Integration:** Encryption key rotation for data-at-rest.
- **S3 Hardening:** Public access blocked and bucket encryption enforced.

## Tech
- **IaC:** Terraform
- **CI/CD:** GitLab CI
- **Security Scanners:** Terraform Compliance
- **Cloud:** AWS (S3, KMS, IAM)

## CI Security Gates
This repository blocks `terraform apply` unless plan-time policy checks pass.

### Pipeline flow
1. `terraform:validate` — Terraform format + validation.
2. `terraform:plan` — generates `tfplan.binary` and `tfplan.json`.
3. `terraform:compliance` — runs `terraform-compliance` against `features/`.
4. `terraform:apply` — manual apply, only available after prior checks pass.

### Least-privilege checks currently enforced
In `features/least_privilege.feature`, IAM policies fail if:
- `Action` contains `"*"`
- `Resource` contains `"*"`

## Local run example
```bash
terraform init
terraform plan -out tfplan.binary
terraform show -json tfplan.binary > tfplan.json
pip install terraform-compliance
terraform-compliance -p tfplan.json -f features
```
