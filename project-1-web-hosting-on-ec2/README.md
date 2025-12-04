
---

# **Project 1 — EC2 Web Hosting with S3, IAM Role & CloudWatch Monitoring**

![AWS](https://img.shields.io/badge/AWS-Cloud%20Project-orange?logo=amazonaws)
![Level](https://img.shields.io/badge/Level-Cloud%20Practitioner-blue)
![Status](https://img.shields.io/badge/Status-Completed-success)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📑 **Table of Contents**

* [Overview](#-overview)
* [Architecture](#-architecture)
* [What You Will Build](#-what-you-will-build)
* [AWS Services Used](#-aws-services-used)
* [Project Structure](#-project-structure)
* [Deployment Steps](#-deployment-steps)
* [Key Deliverables](#-key-deliverables)
* [Security Best Practices](#-security-best-practices)
* [Future Enhancements](#-future-enhancements)
* [License](#-license)
* [Author](#-author)

---

## 📌 **Overview**

This project demonstrates how to host a simple web application on **Amazon EC2**, serve static assets from **Amazon S3**, securely authorize access via **IAM Roles**, and configure monitoring with **CloudWatch** and **SNS Alerts**.

It reflects essential AWS Cloud Practitioner competencies:
**Compute, Storage, IAM, Networking, Monitoring, Alerts, and Security**.

---

## 🏗️ **Architecture**

Refer to the architecture file here:
👉 [`architecture-diagram.md`](./architecture-diagram.md)

**High-Level Flow:**

1. User requests webpage → EC2 Apache server
2. EC2 retrieves image from S3 using IAM Role
3. CloudWatch monitors EC2 CPU
4. SNS sends email alert if threshold is breached

---

## 🚀 **What You Will Build**

You will deploy a fully functional AWS web hosting stack:

* 🌐 EC2 instance with **Apache web server**
* 🗂️ S3 bucket storing static images
* 🔐 IAM Role that lets EC2 read S3 objects (no access keys used)
* 📊 CloudWatch CPU alarm
* 📩 SNS email alert subscription
* 🖥️ Live webpage loading an image from the S3 bucket

---

## 🔧 **AWS Services Used**

| Service             | Purpose                             |
| ------------------- | ----------------------------------- |
| **EC2**             | Runs web server (Apache)            |
| **S3**              | Stores static website images/assets |
| **IAM Role**        | Grants EC2 secure access to S3      |
| **CloudWatch**      | Monitors EC2 CPU metrics            |
| **SNS**             | Sends alert emails                  |
| **Security Groups** | Firewall rules for EC2              |

---

## 📁 **Project Structure**

```
project-1-web-hosting-on-ec2/
│
├── README.md
├── architecture-diagram.md
├── steps.md
├── src/
│   ├── index.html
│   └── userdata.sh
└── notes.md
```

---

## 📚 **Deployment Steps**

Detailed implementation guide is here:
👉 [`steps.md`](./steps.md)

---


## 📝 **Key Deliverables**

* EC2 instance with Apache installed using User-Data
* S3 bucket configured for static asset hosting
* IAM Role with least-privilege S3 access
* CloudWatch alarm + SNS notifications
* Fully functional browser-accessible webpage
* Professional GitHub documentation (this README)

---

## 🔒 **Security Best Practices**

* No hard-coded access keys
* IAM Role attached directly to EC2
* S3 bucket policy: **least privilege**
* Only required ports opened in Security Group
* Monitoring + alerting enabled for visibility

---

## 🔮 **Future Enhancements**

Planned improvements for next versions:

* Add **CloudFront CDN** for faster global delivery
* Add a **Load Balancer + Auto Scaling** (still optional at CP level)
* Add a **CI/CD pipeline** for automated deployment
* Add **HTTPS using ACM + ALB**
* Add **Terraform/IaC version** (for DevOps path)

---

## 📄 **License**

This project is licensed under the **MIT License**.
You are free to use this project for learning and portfolio purposes.

---

## 👨‍💻 **Author**

**Vignesh Ganesan**
AWS Certified Cloud Practitioner — *Score: 1000/1000*
Cloud & DevOps Enthusiast

---

