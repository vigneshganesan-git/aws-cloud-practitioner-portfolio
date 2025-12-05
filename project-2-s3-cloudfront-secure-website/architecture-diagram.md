Project 2 — Architecture Diagram

This architecture illustrates how a secure static website is delivered using a private S3 bucket and Amazon CloudFront with Origin Access Control (OAC). Users access the website only through CloudFront, ensuring the S3 bucket remains private and protected.

High-Level Architecture (Mermaid Diagram)
flowchart TB

    User((User))
    CF[CloudFront CDN]
    S3[(Private S3 Bucket - Static Website)]
    OAC[(Origin Access Control)]
    DNS[Route53 (Optional)]

    User -->|HTTPS Request| CF
    CF -->|Secure Access via OAC| S3
    DNS --> CF


## 📌 Components

### **CloudFront (CDN)**

Delivers the website globally over HTTPS with low latency.
Caches objects at AWS edge locations for faster performance.

### **Private S3 Bucket**

Stores static website files (HTML, CSS, images).
Bucket access is private — no public read access.

### **Origin Access Control (OAC)**

Grants CloudFront secure permission to read S3 objects.
Ensures S3 bucket is accessible **only** through CloudFront.

### **Route 53 (Optional)**

Maps a custom domain name (e.g., `www.example.com`) to the CloudFront distribution.

---

## 📈 Data Flow Summary

1. User sends an HTTPS request to CloudFront.
2. CloudFront checks cache or fetches content from S3 using OAC.
3. S3 returns website files to CloudFront (not to the public).
4. CloudFront returns the fully secure website to the user.

---

This architecture provides **secure, fast, and scalable** static website hosting using AWS best practices.




