\# Terraform Docker IaC Project



Infrastructure as Code project using Terraform to provision a Docker container.



\## What This Does

\- Uses Terraform's Docker provider to define infrastructure

\- Pulls Ubuntu 22.04 image from Docker Hub

\- Creates and runs a Docker container with a simple echo command

\- Demonstrates terraform init, plan, apply, destroy workflow



\## Prerequisites

\- Terraform installed

\- Docker installed and running



\## How to Run



\### Step 1: Initialize Terraform

```bash

terraform init

```



\### Step 2: See What Will Be Created

```bash

terraform plan

```



\### Step 3: Apply and Create Container

```bash

terraform apply

```

Type `yes` when prompted.



\### Step 4: Verify Container Is Running

```bash

docker ps

```



\### Step 5: Check Terraform State

```bash

terraform state list

terraform state show docker\_container.web\_app

```



\### Step 6: Destroy Infrastructure

```bash

terraform destroy

```

Type `yes` when prompted.



\## Files Explained

\- `main.tf` — Terraform configuration defining Docker resources

\- `terraform.tfstate` — Auto-generated state file (tracks infrastructure)

\- `terraform.tfstate.backup` — Backup of previous state



\## Key Concepts Learned

✅ Infrastructure as Code (IaC)

✅ Terraform providers

✅ Resource definitions

✅ State management

✅ Plan vs Apply vs Destroy workflow

