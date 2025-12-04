```markdown
# Project 1 — EC2 Web Hosting with S3, IAM Role & CloudWatch Monitoring

## 📌 Overview
This project demonstrates how to host a simple web application on an Amazon EC2 instance while securely loading static image assets from Amazon S3 using an IAM role.  
CloudWatch monitoring and SNS alerts are implemented to provide operational visibility and notifications.

This project reflects core AWS Cloud Practitioner competencies: **Compute, Storage, IAM, Monitoring, and Security**.

---

## 🏗️ Architecture Diagram
See the dedicated file:  
👉 [`architecture-diagram.md`](./architecture-diagram.md)

---

## 🚀 What You Will Build
- A web server running on **Amazon EC2 (Apache)**
- An **S3 bucket** storing public/static assets (images)
- An **IAM Role** allowing EC2 to read from S3
- A **CloudWatch Alarm** monitoring EC2 CPU usage
- An **SNS Topic** sending email alerts
- A fully working webpage: EC2 loads an image from S3

---

## 🧩 AWS Services Used
| Service | Purpose |
|--------|---------|
| **EC2** | Hosts the web application (Apache web server) |
| **S3** | Stores static image assets for the website |
| **IAM Role** | Grants EC2 access to S3 securely |
| **CloudWatch** | Monitors EC2 metrics and triggers alarms |
| **SNS** | Sends email alerts for threshold breaches |
| **Security Groups** | Controls inbound/outbound traffic |

---
## 📁 Project Folder Structure
project-1-web-hosting-on-ec2/
│
├── README.md
├── architecture-diagram.md
├── steps.md
├── src/
│ ├── index.html
│ └── userdata.sh
└── notes.md

---

## 📝 Key Deliverables
- Web server running on EC2  
- Apache installed using user-data script  
- Image loaded from S3 bucket  
- IAM role attached to EC2  
- CloudWatch alarm + SNS notification  
- Working website screenshot (you will add later)

---

## 🔒 Security Best Practices Followed
- No hard-coded credentials  
- EC2 uses **IAM Role** (not access keys)  
- S3 bucket configured with least-privilege policy  
- Security group with minimal required inbound rules  
- Monitoring and alerts enabled via CloudWatch  

---

## 📚 Hands-on Steps
Follow the detailed implementation steps here:  
👉 [`steps.md`](./steps.md)

---

## 👨‍💻 Author
**Vignesh Ganesan**  
AWS Certified Cloud Practitioner — *Score: 1000/1000*
```

---

