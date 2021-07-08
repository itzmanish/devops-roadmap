# Devops Roadmap

# Infrastructure

a) Write terraform script to create a multi-AZ setup(AWS Mumbai region). You can create an AWS account and use the free tier.

It should have

- [x] Internet Gateway
- [x] NAT.
- [x] Application Loadbalancer.
- [x] Two bastion machines (one per AZ). (Public subnet)
- [x] Three service machines(2+1 AZ). The service box should be in the private subnet.
- [x] Attach 8 GB extra EBS volume to the service box.
- [x] One rds(my-sql/postgres).
- [x] One S3 bucket. Create two users one with read-access and the other with read+write-access to the bucket.

The service boxes, RDS should be in the private subnet.
Use the minimum size of the box and RDS.

---

Note: If you are selecting ap-south region and instance type t2.micro then azs must be set manually to ["ap-south-1a", "ap-south-1b"] only.
Because ap-south-1c doesn't support ec2 instance type t2.micro.

---

**Expectations**

- [x] The code can be deployed on any region and adheres to its availability zones
- [x] The same templates can be used for multiple environments.
- Try to understand the difference between ALB, NLB and Classic Load Balancer.

---

# Software Provisioning

### Docker Registry

- [ ] Create a docker registry backed by S3. The docker registry should run on the docker container.
- [ ] Deploy the Docker registry on three of the service box.
- [ ] The registry should be reachable via the ALB.
- [ ] Provision the docker registry by Ansible.

### Application Provisioning

- [ ] Create a simple Django/RoR rest app backed by RDS for production and docker-compose for local testing.
- [ ] Containerize the application using docker.
- [ ] Use make files to run tests, create docker images and push to docker registry.
- [ ] Use Ansible's dynamic inventory to provision the application on three service boxes.
- [ ] The application should be reachable behind ALB.

Once the Software Provisioning is complete, reduce the count of service machines and its EBS volume via terraform code.

---

# Configure Jenkins

- [ ] Install Vagrant on your local machine.
- [ ] Provision two Ubuntu VMs via Vagrant.
- [ ] Setup a Jenkins server on one VM and Jenkins slave on another VM.
- [ ] Configure the Jenkins slave over SSH.

---

# Build and Deploy Pipeline

Use the Jenkins setup to create a multi-branch CI/CD pipeline.

Create a declarative CI pipeline with the following stages:

- [ ] Lint code
- [ ] Run tests
- [ ] Build Docker image for the application
- [ ] Push to the docker registry

Re-use the make file created earlier in pipeline stages.

Extend the CD pipeline

- [ ] Deploy on AWS Infrastructure via Jenkins using Ansible.

**The status of the build pipeline should be sent to a Slack channel.**

# Documentation

Once all of the exercises are completed, prepare a document which tells:

- What were the assumptions for the solution?
- Implementation details.
- Try to capture the nuances, caveats and gotchas.
- Learnings.

# Resources

Ansible

[https://learning.oreilly.com/videos/hands-on-ansible/9780136746171/](https://learning.oreilly.com/videos/hands-on-ansible/9780136746171/) [https://learning.oreilly.com/videos/automation-with-ansible/9781800206496/](https://learning.oreilly.com/videos/automation-with-ansible/9781800206496/)

Setting up your own docker registry

[https://hub.docker.com/\_/registry](https://hub.docker.com/_/registry)

Terraform

For reference have a look at: [https://github.com/one2nc/terraform/tree/master/sitaram/terraform](https://github.com/one2nc/terraform/tree/master/sitaram/terraform)

Docker

[https://container.training/intro-selfpaced.yml.html#28](https://container.training/intro-selfpaced.yml.html#28)

[https://dockerlabs.collabnix.com/workshop/docker/](https://dockerlabs.collabnix.com/workshop/docker/)

[https://dockerlabs.collabnix.com/intermediate/workshop/](https://dockerlabs.collabnix.com/intermediate/workshop/)
