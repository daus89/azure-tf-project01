# Terraform + Azure Projects

This repository is a hands-on, multi-tier learning environment for using **Terraform Cloud (HCP)** to provision infrastructure on **Microsoft Azure**. Projects are organized by difficulty — from basic VM provisioning to AKS clusters with GitOps and policy enforcement.

---

## 📁 Project Overview

### 1. `linux-vm-provisioning/`
Provision a simple Ubuntu VM in Azure using Terraform Cloud (CLI-driven workflow).
- Resources: Resource Group, VNet, Subnet, NIC, Public IP, Linux VM
- Teaches: Terraform basics, provider setup, SSH keys, tfvars usage

### 2. `three-tier-app/`
Deploy a 3-tier architecture using modules and `terraform.workspace` tagging.
- Resources: Frontend VM, PostgreSQL Database, Virtual Network
- Teaches: Module usage, remote state, tags, environment isolation

### 3. `aks-gitops/`
Provision a production-ready AKS cluster with GitOps, security checks, and CI/CD.
- Resources: AKS, TFLint, Checkov, GitHub Actions
- Teaches: GitHub Actions pipeline, IaC scanning tools, Sentinel alternative policies

---

## 🚀 Getting Started

### Prerequisites
- Terraform CLI >= 1.3
- Azure CLI (`az login`)
- SSH Key pair
- [Terraform Cloud account](https://app.terraform.io)

### HCP Terraform Setup
1. Authenticate: `terraform login`
2. Add the `terraform { cloud { ... } }` block to `main.tf`
3. Create CLI Workspaces via HCP Terraform dashboard
4. Add Azure credentials (environment variables) to each workspace:
   - `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`

---

## 📦 Repository Structure
```
hcp-terraform-azure-projects/
├── beginner-vm-provisioning/     # Basic Ubuntu VM
├── intermediate-3tier-app/       # Modular 3-tier app
├── expert-aks-gitops/            # AKS, GitOps, security policies
│   ├── .tflint.hcl               # TFLint ruleset
│   ├── .checkov.yaml             # Checkov checks
│   └── policy-examples/          # YAML-based tag policy
├── .gitignore
└── README.md
```

---

## ✅ Run Example Project
```bash
cd beginner-vm-provisioning
terraform init
terraform plan
terraform apply
```

---

## 🔐 Free-Tier Policy Checks (No Sentinel)
Use `tflint` and `checkov` for free-tier policy validation.

### TFLint
```bash
brew install tflint
cd expert-aks-gitops
tflint --init
tflint
```

### Checkov
```bash
pip install checkov
checkov -d .
```

YAML policy file: `policy-examples/checkov-tag-policy.yaml`