# Django CRM - Container Orchestration Final Assignment
## Project Report

### Richard Andrey Biscazzi - 8903530
### Nikhil Shankar Chirakkal Sivasankaran - 9026254

---

## Step 1: Gitea Repository Setup

### Tasks Completed:
- Cloned repository to Gitea: `https://gitea.devsecmindset.dev/Richard/final-assignment-crm.git`
- Added teammates as collaborators
- Repository configured with proper access

### Screenshots:
![Gitea Users Created](screenshots/Task1.1.png)
![Repository Setup](screenshots/Task1.2.png)
![Collaborators Added](screenshots/Task1.3.png)

---

## Step 2: NFS Storage Configuration

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

## Step 3: CI/CD Pipeline with Gitea Actions

### Tasks Completed:
- Created Gitea personal access token with package write permissions
- Set up Gitea Actions runner using Docker
- Created `.gitea/workflows/build-and-push.yml` workflow file
- Configured automated Docker image build on code push
- Configured automated push to Gitea container registry
- Fixed Dockerfile to include g++ compiler for numpy dependencies
- Successfully built and pushed image to `gitea.devsecmindset.dev/nikhil/final-assignment-crm`

### Runner Setup Process:
1. Generated Gitea token with `write:package` permission
2. Added token as repository secret (`GITEATOKEN`)
3. Created runner registration token from repository settings
4. Deployed runner using Docker:
   ```bash
   docker run -d --name gitea-runner \
     -e GITEA_INSTANCE_URL=https://gitea.devsecmindset.dev \
     -e GITEA_RUNNER_REGISTRATION_TOKEN=<token> \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitea/act_runner:latest
   ```
5. Verified runner registered and active in repository settings

### Screenshots:
![Gitea Token Created](screenshots/Task3.1-GiteaTokenCreated.png)
![Setting Up Runner - Configuration](screenshots/Task3.2-SettingUpRunner.png)
![Setting Up Runner - Docker Local](screenshots/Task3.2-SettingUpRunner-DockerLocalRunner.png)
![Registered Runner Active](screenshots/Task3.3-SettingUpRunner-RegisteredRunner.png)
![Workflow Run Success & Image Push](screenshots/Task3.4-PushedWorkflowRunAndPushedImageToCR.png)
![Docker Image in Container Registry](screenshots/Task3.5-PushedDockerImageInContainerRegistry.png)
![Image Details](screenshots/Task3.6-ImageDetails.png)

---

## Step 4: Cloudflared Tunnel - Exposing CRM to Internet

### Tasks Completed:
- Downloaded and installed Cloudflared CLI
- Fixed Python version compatibility issue (changed from `python:alpine` to `python:3.12-alpine`)
- Configured Django ALLOWED_HOSTS to accept Cloudflare tunnel domains
- Added CSRF_TRUSTED_ORIGINS for Cloudflare URLs
- Created cloudflared tunnel using `./cloudflared.exe tunnel --url http://localhost:8080`
- Successfully exposed CRM application to public internet via Cloudflare tunnel
- Verified public URL accessibility

### Configuration Changes:
1. **Dockerfile**: Updated base image to Python 3.12 for numpy/pandas compatibility
2. **settings.py**: Added Cloudflare tunnel URLs to ALLOWED_HOSTS:
   - `anaheim-bottles-hop-delayed.trycloudflare.com`
   - `architecture-smooth-linked-bright.trycloudflare.com`
3. **urls.py**: Added root URL redirect to `/en/123/` for better user experience

### Screenshots:
![Cloudflared Tunnel Setup](screenshots/Task4-CloudflaredTunnel.png)
![Getting Public IP](screenshots/Task4-CloudflareGettingPublicIp.png)
![Public URL Exposing CRM](screenshots/Task4-CloudflarePublicURLExposingCRM.png)
![Django CRM Running](screenshots/Task4-DjangoCRMRunning.png)

---

## Step 5: Kubernetes Deployment with Helm

### Tasks Completed:
- Updated docker-compose.yml to use Gitea registry image (`gitea.devsecmindset.dev/nikhil/final-assignment-crm:latest`)
- Installed Kompose tool
- Converted docker-compose.yml to Kubernetes manifests using Kompose
- Fixed Kubernetes resource naming (replaced underscores with hyphens for DNS compliance)
- Created Helm chart structure with Chart.yaml and values.yaml
- Organized Kompose-generated manifests into `crm-helm-chart/templates/`
- Modified up.yaml to use Helm for Kubernetes deployment
- Modified down.yaml to use Helm for Kubernetes cleanup
- Installed Helm on local machine
- Successfully deployed application to Kubernetes cluster using `helm install crm-app ./crm-helm-chart`

### Deployment Status:
- Database (MySQL) pod: Running
- Adminer pod: Running
- CRM application pod: Deployed (requires image rebuild with runtime dependencies)

### Screenshots:
![Kompose Conversion](screenshots/Task5-Kompose-CreatedKubernetesYaml.png)
![Helm Chart Deployed](screenshots/Task5-HelmDeployed.png)
![Kubernetes Pods Status](screenshots/Task5-AllContainersRunning.png)

---

## Project URLs

- **Gitea Repository**: https://gitea.devsecmindset.dev/Richard/final-assignment-crm.git
- **Public GitHub**: https://github.com/Richard-Conestoga/container-asssignment3.git
- **Gitea Instance**: https://gitea.devsecmindset.dev/
- **Container Registry**: https://gitea.devsecmindset.dev/Nikhil/-/packages/container/final-assignment-crm

---

## Technologies Used

- Docker & Docker Compose
- Kubernetes (K3s)
- Helm
- Kompose
- Gitea & Gitea Actions
- Gitea Container Registry
- TrueNAS (NFS Storage)
- Cloudflared Tunnel
- Django CRM Application
- MySQL Database
- Adminer (Database Management)

---

## Team Contributions

### Richard:
- Step 1: Gitea Repository Setup
- Step 2: NFS Storage Configuration

### Nikhil:
- Step 3: CI/CD Pipeline with Gitea Actions
- Step 4: Cloudflared Tunnel Configuration
- Step 5: Kubernetes Deployment with Helm
