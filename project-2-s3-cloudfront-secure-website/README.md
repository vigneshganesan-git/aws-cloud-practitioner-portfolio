
```markdown
# Project 2 — Secure Static Website (S3 + CloudFront)

## Table of Contents
- Overview  
- Architecture  
- What You Will Build  
- AWS Services Used  
- Project Structure  
- Deployment Steps  
- Key Deliverables  
- Security Best Practices  
- Future Enhancements  
- License  
- Author  

---

## Overview

This project demonstrates how to host a **secure static website** using **Amazon S3** and deliver it globally using **Amazon CloudFront**.

The static website files are stored in a **private S3 bucket**, and **CloudFront** is configured using **Origin Access Control (OAC)** to securely fetch content from S3.  
Users cannot access the S3 bucket directly — all content is served only through CloudFront, ensuring a secure and scalable architecture.

This project reflects AWS Cloud Practitioner skills across **Storage, CDN, IAM, Networking, and Security**.

---

## Architecture

Refer to the architecture file here:  
👉 `architecture-diagram.md`

### High-Level Flow
1. User requests the website through a **CloudFront HTTPS endpoint**  
2. CloudFront retrieves the file from a **private S3 bucket**  
3. OAC ensures CloudFront has secure access to S3  
4. (Optional) Route53 maps a custom domain to CloudFront  

---

## What You Will Build

In this project, you will deploy a fully secure static website:

- A **private S3 bucket** for hosting HTML, CSS, images  
- A **CloudFront distribution** for secure global content delivery  
- **Origin Access Control** to grant CloudFront permission to read S3 files  
- HTTPS website URL served directly via CloudFront  
- (Optional) Domain configuration using Route53 and ACM  

---

## AWS Services Used

| Service        | Purpose                                          |
|----------------|--------------------------------------------------|
| **S3**         | Private storage for static website files         |
| **CloudFront** | CDN to serve content globally and securely       |
| **IAM**        | Access control policies for OAC and S3 bucket    |
| **Route53**    | (Optional) map custom domain to CloudFront       |
| **ACM**        | SSL certificate for HTTPS custom domains         |

---

## Project Structure

```

project-2-s3-cloudfront-secure-website/
│
├── README.md
├── architecture-diagram.md
├── steps.md
└── notes.md

```

---

## Deployment Steps

Detailed guide for setup is documented in:  
👉 `steps.md`

---

## Key Deliverables

- Private S3 bucket containing website files  
- CloudFront distribution using Origin Access Control  
- Bucket policy allowing CloudFront-only access  
- Live, secure website URL via CloudFront  
- Optional custom domain setup  
- Professional documentation suitable for GitHub portfolio  

---

## Security Best Practices

- S3 bucket remains **private** at all times  
- CloudFront accesses S3 through **OAC** only  
- Direct S3 object access is blocked  
- HTTPS enforced for all website access  
- Least-privilege IAM policies applied  

---

## Future Enhancements

Potential improvements:

- Enable CloudFront access logs  
- Add versioning or lifecycle policies on S3  
- Add AWS WAF for security filtering  
- Set up CI/CD (GitHub Actions or CodePipeline)  
- Use CloudFront Functions or Lambda@Edge for custom logic  

---

## License

This project is licensed under the **MIT License**.

---

## Author

**Vignesh Ganesan**  
AWS Certified Cloud Practitioner — Score: *1000/1000*
```

---

