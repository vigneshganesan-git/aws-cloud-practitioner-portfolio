
---

# Project 2 — Deployment Steps

Secure Static Website using S3 + CloudFront (OAC)

This guide walks you through deploying a secure static website using a **private S3 bucket** and **CloudFront**.
Every step is **Free Tier compatible** and follows AWS best practices.

---

## Step 1 — Create a Private S3 Bucket

1. Go to **S3 Console → Create bucket**
2. Bucket name: must be globally unique
3. Region: Select your region
4. **Block Public Access → Keep ON (recommended)**
5. Leave all other settings default
6. Click **Create bucket**

### Upload website files

* Open the bucket → **Upload**
* Upload:

  * `index.html`
  * `/images/...` (if any)

**Important:**
Do NOT enable “Static website hosting” — we are using CloudFront.

---

## Step 2 — Create Origin Access Control (OAC)

CloudFront uses this to securely access private S3 objects.

If using the **Console**:

* You can create OAC directly during CloudFront setup (recommended for beginners).

If using **CLI**, this command creates an OAC:

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

This is **Free Tier safe** — OAC has no cost.

---

## Step 3 — Create CloudFront Distribution

1. Go to **CloudFront → Create Distribution**
2. **Origin domain** → Select your S3 bucket (NOT the website endpoint)
3. Under **Origin Access**:

   * Choose **Origin Access Control (OAC)**
   * If prompted → Click **Create new OAC**
4. Click **Yes, update bucket policy** when CloudFront offers to update it
   (This automatically applies a correct S3 policy)
5. Viewer protocol policy → **Redirect HTTP to HTTPS**
6. Cache policy → **CachingOptimized** (Free Tier safe)
7. Leave all other defaults
8. Click **Create Distribution**

Wait for the status to become **Deployed** (2–8 minutes).

---

## Step 4 — Verify or Apply Bucket Policy (Free Tier Safe)

If CloudFront did *not* auto-apply the policy, use this one:

Replace:

* `YOUR_BUCKET_NAME`
* `ACCOUNT_ID`
* `DISTRIBUTION_ID`

```json
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"AllowCloudFrontService",
    "Effect":"Allow",
    "Principal":{"Service":"cloudfront.amazonaws.com"},
    "Action":"s3:GetObject",
    "Resource":"arn:aws:s3:::YOUR_BUCKET_NAME/*",
    "Condition":{
      "StringEquals":{
        "AWS:SourceArn":"arn:aws:cloudfront::ACCOUNT_ID:distribution/DISTRIBUTION_ID"
      }
    }
  }]
}
```

This is the **minimal, least-privilege, secure** policy.

---

## Step 5 — Test the Website (Free Tier Safe)

Open your CloudFront URL:

```
https://dXXXXXXXXXXXXX.cloudfront.net
```

You should see your `index.html`.

### If you get:

* **403 Access Denied** → OAC or bucket policy incorrect
* **Access Denied in S3 direct link** → This is GOOD (bucket is private)

---

## Step 6 — Update Website Files (Optional)

CloudFront caches files—updates may not appear immediately.

Free Tier provides **1,000 invalidations/month free**.

Use this if you update files:

```bash
aws cloudfront create-invalidation \
  --distribution-id DISTRIBUTION_ID \
  --paths "/*"
```

OR rename files (versioning strategy) to avoid invalidations.

---

## Step 7 — (Optional) Custom Domain (Free Tier Compatible)

You can connect CloudFront with Route 53:

1. Request ACM certificate in **us-east-1**
2. Attach certificate to CloudFront
3. Create Route 53 alias record → CloudFront

This is **Free Tier safe**, except domain purchase cost.

---

# Deployment Complete

You now have a **completely secure static website** using:

* S3 (private) → Free Tier
* CloudFront → Free Tier
* OAC → Free
* HTTPS → Free
* No NAT, no EC2, no extra billing

This project is **fully Free Tier safe** and matches real AWS best practices.

---

