# 🧾 End-to-End CI/CD Pipeline Implementation

Over the past few sessions, I implemented a **fully automated CI/CD pipeline** that builds, pushes, and deploys Dockerized applications to **AWS EC2** using **GitHub Actions**.

---

## 🔹 Infrastructure Setup
- Launched an **Amazon EC2 instance (Amazon Linux)**
- Installed and configured **Docker** on the instance
- Verified manual container deployment with an `nginx` test

---

## 🔹 Containerization
- Created a `Dockerfile` in the project root to containerize the application
- Defined a lightweight **Python base image**
- Added dependency installation via `requirements.txt`
- Set a clear startup command for the app
- Verified successful local builds and container runs

---

## 🔹 GitHub Actions Integration
Added a GitHub Actions workflow at `.github/workflows/deploy.yml` to automate:

### Workflow Overview
1. **Build:** Checkout code → build Docker image  
2. **Push:** Authenticate with Docker Hub → push image (`username/myapp:latest`)  
3. **Deploy:** SSH into EC2 → pull latest image → stop old container → run new one on port 80  

### GitHub Secrets Configured
| Secret Name | Purpose |
|--------------|----------|
| `DOCKERHUB_USERNAME` | Docker Hub username |
| `DOCKERHUB_TOKEN` | Docker Hub access token |
| `EC2_HOST` | EC2 public IP |
| `EC2_USER` | EC2 username (`ec2-user`) |
| `EC2_SSH_KEY` | Private key for SSH authentication |

---

## 🔹 Deployment Workflow
**Trigger:** Any `git push` to the `main` branch

### CI/CD Steps
1. GitHub builds and pushes the Docker image to **Docker Hub**
2. GitHub connects to **EC2** via `appleboy/ssh-action`
3. EC2 pulls the latest image, cleans up old containers, and runs the new one

**Verification:**  
✅ Successful build and deployment — accessible at  
`http://<EC2_PUBLIC_IP>`

---

## 🔹 Issues Resolved Along the Way
| Issue | Resolution |
|--------|-------------|
| **SSH Key Mismatch** | Generated and linked correct private/public key pair |
| **Missing Requirements** | Added `requirements.txt` for Python dependencies |
| **Port 80 Conflict** | Stopped old `nginx` container before redeployment |
| **Final State** | Green pipeline and live EC2 deployment verified |

---

## ✅ Current State
- End-to-end automated build & deploy working  
- Containerized application running on EC2  
- Repeatable, production-grade CI/CD foundation in place  

---

## 🚀 Next Steps (Future Improvements)
- Migrate Docker Hub → **AWS ECR** for private image storage  
- Add **staging vs production** environment branching  
- Integrate **monitoring and logging** (CloudWatch / Grafana)  
- Optionally move deployment to **ECS or EKS** for orchestration  

---

### 💡 Summary
This setup enables:
- Automated builds on each push  
- Reproducible deployments via Docker  
- Zero manual SSH or configuration changes  
- A scalable base for DevOps and Platform Engineering workflows
