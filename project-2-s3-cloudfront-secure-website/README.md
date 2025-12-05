

`project-2-s3-cloudfront-secure-website/README.md`

---

# 🚀 **Project 2 — Secure Static Website (S3 + CloudFront)**

![AWS](https://img.shields.io/badge/AWS-Cloud%20Project-orange?logo=amazonaws)
![Level](https://img.shields.io/badge/Level-Cloud%20Practitioner-blue)
![Status](https://img.shields.io/badge/Status-Completed-success)
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

This project demonstrates how to host a **secure static website** using **Amazon S3 (private bucket)** and deliver it globally through **Amazon CloudFront** using **Origin Access Control (OAC)**.
The website is accessible only through CloudFront, ensuring the S3 bucket remains completely private.

This project reflects essential AWS Cloud Practitioner competencies:

**Storage, CDN, Security, IAM Policies, HTTPS, and Global Delivery.**

---

## 🏗️ **Architecture**

Refer to the architecture file here:
👉 [`architecture-diagram.md`](./architecture-diagram.md)

### High-Level Flow

1. User accesses a CloudFront HTTPS URL
2. CloudFront fetches the website files from a **private S3 bucket** using OAC
3. S3 serves files only to CloudFront → No public access
4. Optional: Route53 maps a custom domain to CloudFront

---

## 🚀 **What You Will Build**

A fully secure static hosting solution:

* Private S3 bucket containing static files
* CloudFront distribution using **Origin Access Control**
* S3 bucket policy allowing CloudFront OAC access
* Secure HTTPS website URL
* Optional Route53 custom domain (professional touch)

---

## 🔧 **AWS Services Used**

| Service        | Purpose                                   |
| -------------- | ----------------------------------------- |
| **S3**         | Stores static website files               |
| **CloudFront** | CDN for secure global delivery            |
| **IAM**        | OAC permissions & bucket policies         |
| **Route 53**   | (Optional) Custom domain support          |
| **ACM**        | SSL certificates for HTTPS custom domains |

---

## 📁 **Project Structure**

```
project-2-s3-cloudfront-secure-website/
│
├── README.md
├── architecture-diagram.md
├── steps.md
└── notes.md
```

---

## 📚 **Deployment Steps**

Full step-by-step implementation is documented here:
👉 [`steps.md`](./steps.md)

---

## 📝 **Key Deliverables**

* Secure static website hosted via CloudFront
* S3 bucket configured as **private-only**
* CloudFront OAC configured for secure object access
* Clean HTTPS endpoint for the website
* Optional: custom domain + ACM certificate
* Professional documentation for GitHub portfolio

---

## 🔒 **Security Best Practices**

* S3 bucket stays **100% private**
* Only CloudFront (via OAC) can access the bucket
* No public object URLs
* HTTPS enforced for all traffic
* Least-privilege IAM access

---

## 🔮 **Future Enhancements**

Possible improvements:

* Add CI/CD pipeline (CodePipeline / GitHub Actions)
* Enable CloudFront caching logs in S3
* Add WAF for security filtering
* Add versioning & lifecycle management

---

## 📄 **License**

This project is licensed under the **MIT License**.

---

## 👨‍💻 **Author**

**Vignesh Ganesan**
AWS Certified Cloud Practitioner — *Score: 1000/1000*

---

