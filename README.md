

# 🚀 **AWS Cloud Practitioner Portfolio**

### *Real-World AWS Projects — EC2 • S3 • CloudFront • IAM • CloudWatch • Lambda • API Gateway • VPC*

This repository contains **four Cloud Practitioner–level AWS projects** designed to demonstrate real hands-on cloud skills.
Each project includes:

* 📌 Description & purpose
* 🏗️ Architecture diagram
* 🔧 Step-by-step implementation
* 🔒 Security best practices
* 📁 Source code & notes

This entire portfolio reflects practical understanding of **Compute, Storage, Networking, Serverless, Monitoring, and IAM** — the core areas of AWS Cloud Practitioner.

---
        %% PROJECT 1
        subgraph P1["Project 1: EC2 Web Hosting (EC2 + S3 + IAM + CloudWatch)"]
        User1((User)) --> EC2[EC2 Web Server (Apache)]
        EC2 --> S3_1[(S3 Bucket - Image Assets)]
        EC2 --> CW_1[CloudWatch Alarm]
        CW_1 --> SNS_1[SNS Email Alert]
        EC2 --> IAM_1[(IAM Role: S3 Read Access)]
        end

        %% PROJECT 2
        subgraph P2["Project 2: Secure Static Website (S3 + CloudFront)"]
        User2((User)) --> CF[CloudFront CDN]
        CF --> S3_2[(Private S3 Bucket - Static Website)]
        DNS[Route53 (Optional)] --> CF
        end

        %% PROJECT 3
        subgraph P3["Project 3: Monitoring & Alerts (CloudWatch + SNS)"]
        EC2_2[EC2 Instance] --> Logs[CloudWatch Logs]
        EC2_2 --> Metrics[CloudWatch Metrics]
        Metrics --> Alarm[CloudWatch Alarm]
        Alarm --> SNS_3[SNS Notification]
        end

        %% PROJECT 4
        subgraph P4["Project 4: Serverless API (API Gateway + Lambda in Private VPC)"]
        User4((User)) --> APIGW[API Gateway (HTTPS)]
        APIGW --> Lambda[Lambda Function (Private Subnet)]
        Lambda --> VPCE[VPC Endpoint (CloudWatch Logs)]
        Lambda --> IAM_4[(IAM Execution Role)]
        end

    end
```

---

# 📦 **Projects Included**

| Project                                        | Description                                                                  | AWS Services Used                             |
| ---------------------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------- |
| **Project 1 — EC2 Web Hosting**                | Apache web server with S3 image loading, IAM role access & CloudWatch alarms | EC2, S3, IAM, CloudWatch, SNS                 |
| **Project 2 — CloudFront Secure Website**      | Private S3 bucket + CloudFront CDN distribution                              | S3, CloudFront, IAM, Route53 (optional)       |
| **Project 3 — CloudWatch Monitoring & Alerts** | EC2 monitoring using metrics, logs, alarms + SNS notifications               | EC2, CloudWatch Metrics, CloudWatch Logs, SNS |
| **Project 4 — Serverless API**                 | REST API using API Gateway + Lambda inside VPC                               | Lambda, API Gateway, VPC, IAM, CloudWatch     |

---

# 📁 **Repository Structure**

```
aws-cloud-practitioner-portfolio/
│
├── README.md  ← Master Portfolio README (this file)
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

* EC2 hosting
* Amazon Linux & Apache
* Lambda serverless runtime

### ✔ **Storage**

* Public + private S3 buckets
* Static hosting
* Asset delivery

### ✔ **Networking**

* CloudFront CDN
* API Gateway routing
* VPC private subnets

### ✔ **Security**

* IAM roles
* S3 bucket permissions
* Execution roles
* Least-privilege configurations

### ✔ **Monitoring & Alerts**

* CloudWatch metrics
* Logs & log groups
* CPU alarms
* SNS notifications

---

# 👨‍💻 **Author**

**Vignesh Ganesan**
AWS Certified Cloud Practitioner — *Perfect Score (1000/1000)*
📧 Email: **[vigneshganesan.pro@gmail.com](mailto:vigneshganesan.pro@gmail.com)**

---


