# provisioning-jenkins-server-with terraform
# project Outlook and Projectory

- provisioing the jenkins-server sitting on an EC2 instance created
- Accessibility to this Ec2 instance through port 8080 defined in SG
- the user me can only have access through SSH connection
- The provioning was done solely using terraform (IAC)

# Workflow for this task using Terraform?
- VPC creation effected to start with
- Internet Gateway created while attaching it the VPC using a Route Table
- Public Subnet creation and associate it with the Route Table
- Security Group creation for firewall for the EC2 Instance
- Jenkins installation on the EC2 Instance done with script automation
- Attach an Elastic IP and Key Pair to the Ec2 instance created
- Making sure all works as specified

# project Prerequisites
Installation and configuration of AWS CLI
Installation of Terraform


# Run this to SSH into EC2
ssh -i devops_key.pem ubuntu@$(terraform output -raw jenkinsapp-server_public_ip)

confirm that jenkins is up and active  run t6he command below
sudo systemctl status jenkins
![Image](https://github.com/user-attachments/assets/ad53e5cc-315d-476a-80f2-1219aa55835b)

# Use this to get the jenkins Admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
one you entered jenkins passwoord in the escreenshots below

![Image](https://github.com/user-attachments/assets/d8ecd5b5-65fc-446e-ba42-b6663337cae6)
