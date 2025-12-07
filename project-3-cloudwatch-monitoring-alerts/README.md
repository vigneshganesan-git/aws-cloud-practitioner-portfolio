
```markdown
# 🚀 **Project 3 — EC2 Monitoring & Alerts (CloudWatch + SNS)**

![AWS](https://img.shields.io/badge/AWS-CloudWatch-yellow?logo=amazonaws)
![Level](https://img.shields.io/badge/Level-Cloud%20Practitioner-blue)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📑 **Table of Contents**

* [Overview](#overview)
* [Architecture](#architecture)
* [What You Will Build](#what-you-will-build)
* [AWS Services Used](#aws-services-used)
* [Project Structure](#project-structure)
* [Deployment Steps](#deployment-steps)
* [Key Deliverables](#key-deliverables)
* [Security Best Practices](#security-best-practices)
* [Future Enhancements](#future-enhancements)
* [License](#license)
* [Author](#author)

---

## 📌 **Overview**

This project demonstrates how to monitor an **EC2 instance** using **Amazon CloudWatch Metrics**, **CloudWatch Logs**, and **SNS Email Alerts**.

You will configure alarms, receive real-time notifications, and set up basic monitoring that reflects essential AWS Cloud Practitioner-level operational skills.

This project focuses on AWS domains:

**Monitoring, Logging, Alerts, Compute, IAM, and Operations.**

---

## 🏗️ **Architecture**

Refer to the architecture file here:  
👉 [`architecture-diagram.md`](./architecture-diagram.md)

### High-Level Flow

1. EC2 generates metrics and logs  
2. CloudWatch collects CPU and system metrics  
3. Alarm evaluates thresholds (e.g., CPU > 70%)  
4. SNS sends an email alert when the alarm triggers  

---

## 🚀 **What You Will Build**

You will deploy a complete EC2 monitoring workflow:

- EC2 instance with monitoring enabled  
- CloudWatch Metrics (CPU, Network, Status Checks)  
- CloudWatch Alarm with a threshold  
- SNS Topic + Email subscription  
- Optional: CloudWatch Logs for deeper analysis  

---

## 🔧 **AWS Services Used**

| Service               | Purpose                                        |
|-----------------------|------------------------------------------------|
| **EC2**               | Compute instance to monitor                    |
| **CloudWatch Metrics**| Collects CPU, network, and status metrics      |
| **CloudWatch Logs**   | Stores system logs (optional)                  |
| **CloudWatch Alarm**  | Triggers notifications when threshold is met   |
| **SNS**               | Sends email notifications                      |
| **IAM**               | Permissions for EC2 and CloudWatch agent       |

---

## 📁 **Project Structure**

```

project-3-cloudwatch-monitoring-alerts/
│
├── README.md
├── architecture-diagram.md
├── steps.md
└── notes.md

```

---

## 📚 **Deployment Steps**

Detailed step-by-step guide is documented here:  
👉 [`steps.md`](./steps.md)

---

## 📝 **Key Deliverables**

- CloudWatch metrics enabled for EC2  
- CPU-based alarm configured  
- SNS email notification working  
- Optional CloudWatch Logs integration  
- Clean and professional documentation for portfolio  

---

## 🔒 **Security Best Practices**

- Use IAM role for EC2 (no access keys)  
- SNS email subscription must be confirmed  
- EC2 security group should allow only necessary ports  
- IAM policies follow least-privilege principles  

---

## 🔮 **Future Enhancements**

- Add CloudWatch Dashboard  
- Add Disk, Memory, and Network alarms  
- Integrate EventBridge for automated recovery actions  
- Enable CloudWatch Logs Agent for deeper insights  
- Add Auto Scaling triggered by CloudWatch alarms  

---

## 📄 **License**

This project is licensed under the **MIT License**.

---

## 👨‍💻 **Author**

**Vignesh Ganesan**  
AWS Certified Cloud Practitioner — *Score: 1000/1000*
```
