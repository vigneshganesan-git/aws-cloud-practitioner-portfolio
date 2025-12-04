
---

# 🚀 **AWS Cloud Practitioner Portfolio**

### **4 Real-World AWS Projects — EC2 • S3 • CloudFront • IAM • CloudWatch • Lambda • API Gateway • VPC**

This repository showcases **hands-on Cloud Practitioner–level AWS projects** demonstrating real cloud skills across **Compute, Storage, Security, Networking, Monitoring, and Serverless**.
Each project includes:

* Clear purpose & scope
* Architecture diagram
* Step-by-step deployment
* Best practices
* Source files & notes

This makes the portfolio ideal for **recruiters, interviewers, and students learning AWS fundamentals**.

---

# 🏗️ **Master Architecture — Combined View of All Projects**

flowchart TB

    %% MAIN TITLE
    subgraph MASTER["AWS Cloud Practitioner Portfolio — 4 Project Architecture Overview"]
    direction TB

        %% PROJECT 1
        subgraph P1["Project 1: EC2 Web Hosting (EC2 + S3 + IAM + CloudWatch)"]
        direction TB
            User1((User)) --> EC2[EC2 Web Server (Apache)]
            EC2 --> S3_1[(S3 Bucket - Image Assets)]
            EC2 --> CW_1[CloudWatch Alarm]
            CW_1 --> SNS_1[SNS Email Alert]
            EC2 --> IAM_1[(IAM Role: S3 Read Access)]
        end

        %% PROJECT 2
        subgraph P2["Project 2: Secure Static Website (S3 + CloudFront)"]
        direction TB
            User2((User)) --> CF[CloudFront CDN]
            CF --> S3_2[(Private S3 Bucket - Static Website)]
            DNS[Route53 (Optional)] --> CF
        end

        %% PROJECT 3
        subgraph P3["Project 3: Monitoring & Alerts (CloudWatch + SNS)"]
        direction TB
            EC2_2[EC2 Instance] --> Logs[CloudWatch Logs]
            EC2_2 --> Metrics[CloudWatch Metrics]
            Metrics --> Alarm[CloudWatch Alarm]
            Alarm --> SNS_3[SNS Notification]
        end

        %% PROJECT 4
        subgraph P4["Project 4: Serverless API (API Gateway + Lambda in Private VPC)"]
        direction TB
            User4((User)) --> APIGW[API Gateway (Public HTTPS)]
            APIGW --> Lambda[Lambda Function (Private Subnet)]
            Lambda --> VPCE[VPC Endpoint (CloudWatch Logs)]
            Lambda --> IAM_4[(IAM Execution Role)]
        end

    end
```

---

# 📦 **Portfolio Contents**

| Project       | Description                                                              | AWS Services Used                                       |
| ------------- | ------------------------------------------------------------------------ | ------------------------------------------------------- |
| **Project 1** | EC2-hosted webpage loading S3 assets with IAM role + CloudWatch alarms   | EC2, S3, IAM, CloudWatch, SNS                           |
| **Project 2** | Secure static website distributed through CloudFront (private S3 origin) | S3, CloudFront, IAM, Route53 (optional)                 |
| **Project 3** | EC2 monitoring with CloudWatch metrics, logs, and SNS notifications      | EC2, CloudWatch Logs, CloudWatch Metrics, SNS           |
| **Project 4** | Serverless API using API Gateway + Lambda running inside a private VPC   | API Gateway, Lambda, VPC, IAM, CloudWatch, VPC Endpoint |

---

# 📁 **Repository Structure**

```
aws-cloud-practitioner-portfolio/
│
├── README.md  ← Master Portfolio README  
│
├── project-1-ec2-s3-iam-webhosting/
│   ├── README.md
│   ├── architecture-diagram.md
│   ├── steps.md
│   ├── src/
│   │   ├── index.html
│   │   └── userdata.sh
│   └── notes.md
│
├── project-2-s3-cloudfront-secure-website/
│   ├── README.md
│   ├── architecture-diagram.md
│   ├── steps.md
│   └── notes.md
│
├── project-3-cloudwatch-monitoring-alerts/
│   ├── README.md
│   ├── architecture-diagram.md
│   ├── steps.md
│   └── notes.md
│
├── project-4-serverless-api-lambda-vpc/
│   ├── README.md
│   ├── architecture-diagram.md
│   ├── steps.md
│   ├── lambda/
│   │   └── lambda_function.py
│   └── notes.md
│
└── LICENSE
```

---

# 🧠 **Skills Demonstrated**

### ✔ **Compute**

* EC2 Linux instances
* Apache hosting
* Private-subnet Lambda functions

### ✔ **Storage**

* Public & private S3 buckets
* Static hosting
* CloudFront origins

### ✔ **Networking**

* CloudFront CDN
* VPC subnets
* API Gateway routing

### ✔ **Security**

* IAM Roles & policies
* S3 bucket security
* Execution roles
* Least-privilege best practices

### ✔ **Monitoring & Alerts**

* CloudWatch metrics & logs
* EC2 CPU alarms
* SNS email notifications
* VPC endpoint logging

---

# 👨‍💻 **Author**

**Vignesh Ganesan**
AWS Certified Cloud Practitioner — *Score: 1000/1000*
📧 Email: `vigneshganesan.pro@gmail.com`

---
