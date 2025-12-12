# Django CRM - Container Orchestration Final Assignment
## Project Report

---

## Step 1: Gitea Repository Setup (4 marks)

### Tasks Completed:
- Cloned repository to Gitea: `https://gitea.devsecmindset.dev/Richard/final-assignment-crm.git`
- Added teammates as collaborators
- Repository configured with proper access

### Screenshots:
![Gitea Users Created](screenshots/Task1.1.png)
![Repository Setup](screenshots/Task1.2.png)
![Collaborators Added](screenshots/Task1.3.png)

---

## Step 2: NFS Storage Configuration (4 marks)

### Tasks Completed:
- Configured TrueNAS NFS storage for database persistence
- Created StorageClass: `truenas-nfs`
- Verified NFS mount accessibility
- Database PVCs created and bound

### Screenshots:
![NFS Configuration](screenshots/Task2.1.png)
![StorageClass Verification](screenshots/Task2.2.png)
![PVC Binding](screenshots/Task2.3.png)
![NFS Mount Verification](screenshots/Task2.4.png)

---

## Step 3: CI/CD Pipeline with Gitea Actions (4 marks)

### Tasks Completed:
- Created Gitea Actions workflow file
- Configured Docker image build process
- Automated push to Gitea container registry
- Workflow triggers on code push

### Screenshots:
![Gitea Actions Workflow](screenshots/Task3.1.png)
![Docker Image Build](screenshots/Task3.2.png)
![Container Registry](screenshots/Task3.3.png)
![Successful Build](screenshots/Task3.4.png)

---

## Step 4: Cloudflared Ingress Setup (4 marks)

### Tasks Completed:
- Configured cloudflared tunnel
- Exposed CRM application to internet
- Verified public access

### Screenshots:
![Cloudflared Configuration](screenshots/Task4.1.png)
![Tunnel Active](screenshots/Task4.2.png)
![Public Access Verification](screenshots/Task4.3.png)

---

## Step 5: Kubernetes Deployment with Helm (4 marks)

### Tasks Completed:
- Updated docker-compose.yml with Gitea registry image
- Converted to Kubernetes using Kompose
- Created Helm chart structure
- Modified up.yaml for K8s deployment
- Modified down.yaml for cleanup
- Integrated cloudflared tunnel
- Application running on Kubernetes

### Screenshots:
![Kompose Conversion](screenshots/Task5.1.png)
![Helm Chart Structure](screenshots/Task5.2.png)
![Kubernetes Deployment](screenshots/Task5.3.png)
![Application Running](screenshots/Task5.4.png)
![Cloudflared Tunnel Integration](screenshots/Task5.5.png)
![Public Access Test](screenshots/Task5.6.png)

---

## Project URLs

- **Gitea Repository**: https://gitea.devsecmindset.dev/Richard/final-assignment-crm.git
- **Public GitHub**: https://github.com/Richard-Conestoga/container-asssignment3.git
- **Gitea Instance**: https://gitea.devsecmindset.dev/
- **Application URL**: [Add cloudflared tunnel URL here]

---

## Technologies Used

- Docker & Docker Compose
- Kubernetes (K3s)
- Helm
- Gitea & Gitea Actions
- TrueNAS (NFS Storage)
- Cloudflared Tunnel
- Kompose
- Django CRM Application
- PostgreSQL Database

---

## Total Marks: 20/20
