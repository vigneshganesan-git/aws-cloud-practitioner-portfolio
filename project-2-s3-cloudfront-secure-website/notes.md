
---

# Project 2 — Notes

Secure Static Website using S3 + CloudFront (OAC)

---

## General Notes

This project uses a **private S3 bucket** and **CloudFront** with **Origin Access Control (OAC)**.
The website can only be accessed through CloudFront, ensuring all S3 objects remain private.

Direct access to S3 URLs will show **AccessDenied**, which is expected and correct.

---

## Key Points

* Keep the S3 bucket **private** at all times
* OAC ensures CloudFront can read objects securely
* CloudFront provides global HTTPS delivery
* Cache invalidation is required after updating files
* Free Tier offers **1,000 invalidations per month**
* Custom domain with Route 53 is optional
* ACM certificate must be requested in **us-east-1** for CloudFront

---

## Common Issues and Solutions

### 1. CloudFront shows **Access Denied**

Possible reasons:

* Bucket policy does not allow CloudFront distribution ARN
* OAC was not attached to the origin
* Wrong S3 origin selected (must select bucket name, not website endpoint)

### 2. Website not updating after changes

CloudFront is serving cached files.
Use invalidation:

```bash
aws cloudfront create-invalidation \
  --distribution-id DISTRIBUTION_ID \
  --paths "/*"
```

### 3. Cannot access S3 URL

This is correct.
S3 objects must not be public — only CloudFront should access them.

---

## Helpful Commands

### Create Origin Access Control (OAC)

(Optional if created from console)

```bash
aws cloudfront create-origin-access-control \
  --origin-access-control-config '{
    "Name":"project2-oac",
    "Description":"Secure access from CloudFront to S3",
    "SigningProtocol":"sigv4",
    "SigningBehavior":"always",
    "OriginAccessControlOriginType":"s3"
  }'
```

### Create CloudFront Invalidation

(Use after updating files)

```bash
aws cloudfront create-invalidation \
  --distribution-id DISTRIBUTION_ID \
  --paths "/*"
```

### Example Bucket Policy (if CloudFront did not auto-apply)

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudFrontService",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:aws:cloudfront::ACCOUNT_ID:distribution/DISTRIBUTION_ID"
        }
      }
    }
  ]
}
```

---

## Final Notes

* This setup is **fully Free-Tier compatible**
* S3 bucket stays private — no public access required
* CloudFront handles all HTTPS and caching
* OAC is the recommended and secure method to access S3
* This design follows AWS best practices for a static website

---

