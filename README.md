# 🚀 Terraform Docker IaC Project

Infrastructure as Code with Terraform + Docker — Fully automated container provisioning.

## 📋 What This Demonstrates

✅ **Infrastructure as Code** — Define infrastructure in code, version-controlled  
✅ **Terraform Workflow** — init → plan → apply → destroy  
✅ **Docker Provider** — Provisioning containers programmatically  
✅ **State Management** — Track infrastructure with terraform.tfstate  
✅ **Resource Dependencies** — Containers depend on networks  
✅ **Best Practices** — Variables.tf, modular code, outputs  

---

## 🏗️ Architecture
┌─────────────────────────────────┐
│    Terraform Configuration      │
│  (main.tf + variables.tf)       │
└────────────┬────────────────────┘
│
▼
┌─────────────────────────────────┐
│   Docker Network (devops-net)   │
│  ┌─────────────┐ ┌──────────┐   │
│  │  Web App    │ │  Nginx   │   │
│  │ (Ubuntu)    │ │ (Reverse │   │
│  │  :3600s     │ │  Proxy)  │   │
│  │             │ │ :8888    │   │
│  └─────────────┘ └──────────┘   │
└─────────────────────────────────┘
---

## 🔧 Technologies

- **Terraform** v1.x — Infrastructure as Code
- **Docker** — Containerization platform
- **HCL** — Terraform language
- **Windows 11** — Development environment

---

## 📦 Files Explained

| File | Purpose |
|------|---------|
| `main.tf` | Main Terraform configuration — defines resources (network, containers) |
| `variables.tf` | Input variables — makes code reusable and flexible |
| `terraform.tfstate` | State file — Terraform's memory (auto-generated, don't edit) |
| `terraform.tfstate.backup` | Backup of previous state |

---

## 🚀 Quick Start

### Prerequisites
```bash
terraform --version  # Should be 1.x+
docker --version     # Should be 20.10+
```

### Run It

```bash
# Step 1: Initialize Terraform (download plugins)
terraform init

# Step 2: Preview what will be created
terraform plan

# Step 3: Actually create the infrastructure
terraform apply
# Type 'yes' when prompted

# Step 4: Verify containers are running
docker ps

# Step 5: Check container logs
docker logs terraform-web-app
docker logs terraform-nginx

# Step 6: View Terraform state
terraform state list
terraform state show docker_container.web_app

# Step 7: Clean up (destroy infrastructure)
terraform destroy
# Type 'yes' when prompted
```

---

## 📊 Execution Flow
terraform init
↓
terraform plan      → Shows 2 to add (network + containers)
↓
terraform apply     → Creates network, then web_app, then nginx
↓
docker ps           → Verify both containers running
↓
terraform state     → Check state file tracking
↓
terraform destroy   → Removes all resources
---

## 🎯 Key Learnings

### What is IaC?
Instead of manually clicking Docker UI to create containers, write **code** that describes infrastructure. Terraform executes that code.

### State File Magic
Terraform remembers what it created in `terraform.tfstate`. Next time you run `terraform apply`, it only changes what's different.

### Providers
Terraform needs to know "where to create resources" → Docker provider tells it "use Docker daemon at this socket".

### Dependencies
Notice `depends_on` in nginx_server? It tells Terraform: "Create network first, then web_app, then me (nginx)".

---

## 💡 What Makes This "Production-Ready"

- ✅ Variables file for reusability
- ✅ Proper resource dependencies
- ✅ Network isolation (containers on custom network)
- ✅ State management
- ✅ Outputs for important values
- ✅ Comments explaining code

---

## 🔗 Real-World Applications

This pattern scales to:
- AWS EC2 instances + RDS database
- Kubernetes pods + persistent volumes
- Multi-tier application infrastructure
- Microservices deployment

---
## ✨ Created By
Adi | DevOps Internship | Elevate Labs

---

## 📝 Execution Logs
See `TERRAFORM_EXECUTION_LOGS.txt` for full terraform init, plan, apply, destroy outputs.
