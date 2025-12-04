
---

# **Project 1 — EC2 Web Hosting with S3, IAM Role & CloudWatch Monitoring**

## 📌 **Overview**

This project showcases a complete, beginner-friendly yet industry-relevant AWS deployment.
It demonstrates how to host a simple web application on **Amazon EC2**, load static assets from **Amazon S3**, enable secure access using **IAM Roles**, and implement monitoring with **CloudWatch** + **SNS Alerts**.

This project reflects essential AWS Cloud Practitioner competencies:
**Compute, Storage, IAM, Networking, Monitoring, and Security**.

---

## 🏗️ **Architecture Diagram**

Refer to the architecture flow here:
👉 [`architecture-diagram.md`](./architecture-diagram.md)

---

## 🚀 **What You Will Build**

By completing this project, you will deploy a fully functional AWS web hosting stack:

* 🌐 **Amazon EC2** instance running Apache web server
* 🗂️ **S3 Bucket** storing static website images
* 🔐 **IAM Role** attached to EC2 to securely read S3 objects
* 📊 **CloudWatch Alarm** tracking CPU utilization
* 📩 **SNS Email Alerts** triggered by CloudWatch
* 🖼️ A working webpage where EC2 loads an image from S3

---

## 🔧 **AWS Services Used**

| Service             | Purpose                                      |
| ------------------- | -------------------------------------------- |
| **EC2**             | Hosts the web server and website             |
| **S3**              | Stores static assets such as images          |
| **IAM Role**        | Grants EC2 secure S3 read access             |
| **CloudWatch**      | Monitors EC2 performance and triggers alerts |
| **SNS**             | Sends email notifications for alarms         |
| **Security Groups** | Controls inbound/outbound traffic            |

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

## 📝 **Key Deliverables**

* EC2 instance with Apache installed using **user data script**
* Public S3 bucket hosting static assets
* IAM Role with correct permissions attached to EC2
* CloudWatch CPU alarm linked to SNS notifications
* Successful webpage tested in browser (add your screenshot here)
* Clean, documented folder structure suitable for GitHub portfolio

---

## 🔒 **Security Best Practices**

* No access keys stored on EC2
* EC2 uses **IAM Role with least privilege**
* S3 bucket access scoped minimally
* Security group restricted to necessary ports only
* Monitoring and alerting enabled for proactive visibility

---

## 📚 **Hands-On Deployment Steps**

Follow the complete step-by-step implementation guide:
👉 [`steps.md`](./steps.md)

---

## 👨‍💻 **Author**

**Vignesh Ganesan**
AWS Certified Cloud Practitioner — *Score: 1000/1000*

---
