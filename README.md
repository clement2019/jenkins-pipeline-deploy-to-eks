# Jenkins-pipeline-deploy-to-eks
### Project Name: End to end deployment of Applications to Kubernetes using a Jenkins CI/CD Pipeline
### Steps for the project

#### 1. Create a Keypair that matches your keypair
#### 2. Create a Jenkins Server with all the dependencies, libraries and packagies needed.
#### 2. Once completed, access the Jenkins server and Set it up
#### 4. Run the jenkins-pipeline-deploy-to-eks to create Kubernetes Cluster, create deployments and Services
#### 5. Test that the application is running 
#### 6. Destroy infrastructure


#### project Outlook and Projectory

- provisioing the jenkins-server sitting on an EC2 instance created
- Accessibility to this Ec2 instance through port 8080 defined in SG
- the user me can only have access through SSH connection
- The provioning was done solely using terraform (IAC)

#### Workflow for this task using Terraform?
- VPC creation effected to start with
- Internet Gateway created while attaching it the VPC using a Route Table
- Public Subnet creation and associate it with the Route Table
- Security Group creation for firewall for the EC2 Instance
- Jenkins installation on the EC2 Instance done with script automation
- Attach an Elastic IP and Key Pair to the Ec2 instance created
- Making sure all works as specified

### project Prerequisites
Installation and configuration of AWS CLI

Installation of Terraform

![Image](https://github.com/user-attachments/assets/8f1dd791-757f-4598-8c86-a840e5bf7964)


#### MANUAL DEPLOYMENT OF AWS EKS ON MY LOCAL MACHINE

#### Now, let’s see if we have logged it correctly to our cluster:

kubectl config current-context

arn:aws:eks:eu-west-1:012321433432232:cluster/example



### You can view your cluster’s nodes by running the following command:

kubectl get nodes 

NAME                                       STATUS   ROLES    AGE   VERSION

ip-10-0-0-78.eu-west-2.compute.internal    Ready    <none>   14m   v1.31.7-eks-473151a

ip-10-0-1-151.eu-west-2.compute.internal   Ready    <none>   14m   v1.31.7-eks-473151a


### To get more specific details about them, you can use the -o custom-columns options:

kubectl get nodes -o custom-columns=Name:.metadata.name,nCPU:.status.capacity.cpu,Memory:.status.

capacity.memory

Name                                       nCPU   Memory

ip-10-0-0-78.eu-west-2.compute.internal    2      3919464Ki

ip-10-0-1-151.eu-west-2.compute.internal   2      3919464Ki

### With the long command from above, we can view the number of CPUs our nodes have and their available memory.

### Let’s deploy an Nginx instance to see if the cluster is working correctly:

kubectl run --port 80 --image nginx nginx

pod/nginx created

kubectl get pods    

NAME    READY   STATUS    RESTARTS   AGE

nginx   1/1     Running   0          34s

### Now, let’s set up a tunnel from your computer to this pod:


kubectl port-forward nginx 3000:80

Forwarding from 127.0.0.1:3000 -> 80

Forwarding from [::1]:3000 -> 80

Handling connection for 3000

Handling connection for 3000


![Image](https://github.com/user-attachments/assets/b1ba1b33-bd14-4c58-ae9e-76083a1d8e98)

## NOW AUTOMATED DEPLOMENT OF AWS EKS CLUSTER USING JENKINS AND TERRAFORM

now git clone the project urlas shown below

git clone https://github.com/clement2019/jenkins-pipeline-deploy-to-eks.git
cd infra-jenkins

### The folder contains the terraform files to deply jenkins

### now run the following command

terraform init


terraform fmt

terraform validate

terraform apply--auto-approve

### terraform will run the script that will install the folwing on the jenklins -server

aws cli

kubectl 

terraform

### Run The terraform apply command as shown below 

terraform apply --auto-approve 

![Image](https://github.com/user-attachments/assets/32542b46-01fb-4bb4-b3de-14156cc4e6fe)


![Image](https://github.com/user-attachments/assets/398a58a0-0ddd-4dfa-9b8d-6d6c507639db)



### first make sure jenkins was deployed on the ec2 instance server from my local machine using terraform

### Run this to SSH into EC2

ssh -i devops_key.pem ubuntu@$(terraform output -raw jenkinsapp-server_public_ip)

### Now because this is brown new machine we need to update the packages

![Image](https://github.com/user-attachments/assets/00d71ec5-bc7a-4d4f-bbf7-e987c65966e7)

### Now confirm if kubectl was installed on the ec2 instance


![Image](https://github.com/user-attachments/assets/987992b5-5fb6-4e11-a2b9-56adb520c83a)

### Now conform if aws cli aws command line interface  was installed on the ec2 instance

aws --version

aws-cli/2.27.15 Python/3.13.3 Linux/5.19.0-1025-aws exe/x86_64.ubuntu.22

### Now authenticate into aws infrastructure using aws configure, this will allow you to insert the access 
### key and secret key of the IAM useerr created with adminstrative access

### Alternatively

You can create IAM role with adminstrative access permission, you can now update and moditify the IAM role

 on the jenkins server as shown below

![Image](https://github.com/user-attachments/assets/a97548e0-3a3e-4c2b-9e21-d428ae19aeaf)

![Image](https://github.com/user-attachments/assets/2d809562-d45c-45c0-aa7a-38e76834c1b7)

### confirm if terraform was installed on the machine
terraform --version

Terraform v1.12.0

on linux_amd64

### confirm that jenkins is up and active  run t6he command below

sudo systemctl status jenkins

![Image](https://github.com/user-attachments/assets/94b83bde-af8c-4f58-8d6a-c6d20d7edb97)

![Image](https://github.com/user-attachments/assets/ad53e5cc-315d-476a-80f2-1219aa55835b)

### Use this to get the jenkins Admin password

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

one you entered jenkins passwoord in the escreenshots below

![Image](https://github.com/user-attachments/assets/d8ecd5b5-65fc-446e-ba42-b6663337cae6)

### the below is the screenshots of the jenkins dashboard

![Image](https://github.com/user-attachments/assets/8be14fd7-6805-49a8-a073-8b4ad8b69e6f)


# Now create a new project in jenkins

![Image](https://github.com/user-attachments/assets/ec4efa8c-8286-4919-a95b-932f4f2e60a9)

### No enter aws creadentails in jenkins to allow jenkisn to be able to access aws infrastructure

![Image](https://github.com/user-attachments/assets/512baa89-0401-4e27-b6af-79f6d214f726)

Now run the build with parameters on the kenkins dashbaod the ill trigger the jenkins file to first deployerd the aws-eks cluster and latter deploy the nginx using the nginx-deployment.yaml file na dthe nginx-service.yaml file
with types as load balancer

![Image](https://github.com/user-attachments/assets/293f8a66-5c34-44e8-9ba7-6cb91a35c3ab)


