# Checkov-Integration-PaC: Secure AWS Provisioning Pipeline

##  Overview
A production-grade DevSecOps pipeline that automates the deployment of hardened AWS infrastructure. This project demonstrates how to move "Security to the Left" by integrating Policy as Code (PaC) and automated vulnerability scanning into the CI/CD lifecycle.
##  Security Features
- **Policy as Code:** Uses `Checkov` to enforce 50+ AWS security best practices (e.g., encryption at rest, no public S3 access).
- **Least Privilege:** Implements IAM roles for Service Accounts (IRSA) and encrypted state management.
- **KMS Integration:** Automated rotation of encryption keys for all data-at-rest.
##  Tech
- **IaC:** Terraform
- **CI/CD:** GitLab CI
- **Security Scanners:** Checkov, SonarQube
- **Cloud:** AWS (S3, KMS, IAM)
##  Impact
- **Reduced Risk:** 100% of infrastructure code is scanned for misconfigurations prior to deployment.
- **Efficiency:** Automated provisioning reduces manual intervention and human error by ~60%.
