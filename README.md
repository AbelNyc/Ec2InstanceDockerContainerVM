# Ec2InstanceDockerContainerVM
🧾 Summary: End-to-End CI/CD Pipeline Implementation

Over the past few sessions, I implemented a fully automated CI/CD pipeline that builds, pushes, and deploys Dockerized applications to AWS EC2 using GitHub Actions.

🔹 Infrastructure Setup

Launched an Amazon EC2 instance (Amazon Linux)

Installed and configured Docker on the instance

Verified manual container deployment with an nginx test

🔹 Containerization

Created a Dockerfile in the project root to containerize the application

Defined a lightweight Python base image

Added dependency installation (requirements.txt)

Set a clear startup command for the app

Verified successful local builds and container runs

🔹 GitHub Actions Integration

Added a GitHub Actions workflow (.github/workflows/deploy.yml) to automate:

Build: Checkout code → build Docker image

Push: Authenticate with Docker Hub → push image (username/myapp:latest)

Deploy: SSH into EC2 → pull latest image → stop old container → run new one on port 80

Configured secrets in GitHub for:

DOCKERHUB_USERNAME

DOCKERHUB_TOKEN

EC2_HOST, EC2_USER, and EC2_SSH_KEY

🔹 Deployment Workflow

Trigger: any git push to main

CI/CD Steps:

GitHub builds and pushes image to Docker Hub

GitHub connects to EC2 via appleboy/ssh-action

EC2 pulls the latest image, cleans up old containers, and runs the new one

Verified success with a clean pipeline run (http://<EC2_PUBLIC_IP> serving the app)

🔹 Issues Resolved Along the Way

SSH Key Mismatch: fixed by generating proper private/public key pairs

Missing Requirements: added requirements.txt for dependencies

Port 80 Conflict: stopped old nginx container before redeploy

Successful Final State: green pipeline and live EC2 deployment
