Prerequisites
Docker installed on your system

## Build the Docker Image

docker build -t project-name .

-t project-name → tags the image with a name.

. → uses the Dockerfile in the current directory.

## Run the Docker Container

docker run -d -p 8080:8080 --name project-container project-name

-d → run in detached mode.

-p 8080:8080 → maps container port 8080 to host port 8080.

--name project-container → names the running container.

## Verify the Application
Once running, access the app in your browser:

http://localhost:8080

## Stop and Remove the Container

docker stop project-container
docker rm project-container

## Rebuild After Changes
If you modify the source code or Dockerfile:

docker build -t project-name .

## Infrastructure Deployment 

## Deploying the Terraform Code

Prerequisites:

Terraform installed 

AWS CLI installed and configured with valid credentials (aws configure)

S3 bucket and DynamoDB table (if using remote backend) created beforehand

## Steps to Deploy:

# Navigate to Terraform directory
cd terraform/

# Initialize Terraform (downloads providers, sets up backend)
terraform init

# Review the execution plan
terraform plan

# Apply the infrastructure changes
terraform apply

## 2. Architectural Decisions & Assumptions

AWS Fargate was chosen for container workloads to avoid managing EC2 instances and improve scalability.

Default VPC is used for simplicity; in production, a custom VPC with private subnets and NAT Gateway is recommended.

IAM roles are scoped with least privilege principle.

ECR is used for container image storage.

## 3. DevSecOps Considerations
Secrets Management: All sensitive values (AWS keys, DB passwords) are stored in AWS Secrets Manager, never in code or state files.

Image Scanning: ECR image scanning is enabled to detect vulnerabilities on push.

IAM Best Practices: Roles follow least-privilege access.

Logging & Monitoring: CloudWatch enabled for logs; GuardDuty for threat detection.

## 4. Running & Reviewing Linux Task Outputs
Navigate to the Linux tasks directory:

cd linux_tasks/
chmod +x script.sh
./script.sh

The output logs are stored in output.log in the same directory.

Security changes (SSH hardening, UFW firewall rules) can be reviewed in:

/etc/ssh/sshd_config for SSH settings

sudo ufw status for firewall rules

## 5. Challenges & Improvements
Challenges:

Managing state files securely in a collaborative setup.

Balancing simplicity (default VPC) with production-grade security.

Improvements if given more time:

Use custom VPC with multiple subnets, ALB, and WAF for enhanced security.

Automate Linux hardening tasks for consistency.




