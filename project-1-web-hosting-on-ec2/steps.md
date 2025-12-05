

```markdown
# Project 1 — Deployment Steps
EC2 Web Hosting with S3, IAM Role & CloudWatch Monitoring

This guide explains how to deploy a simple web application on EC2 that loads an image from a private S3 bucket using an IAM Role. It also includes CloudWatch monitoring and SNS alerts.

---

## 1. Create S3 Bucket and Upload Image

1. Open Amazon S3 → Create bucket  
2. Bucket name example: project1-vignesh-assets  
3. Region: your preferred region  
4. Keep “Block Public Access” enabled  
5. Create bucket  
6. Inside the bucket, create a folder named **images**  
7. Upload **photo.jpg** inside the images folder  

---

## 2. Create IAM Role (EC2 → S3 Read Access)

1. Go to IAM → Roles → Create role  
2. Trusted entity: AWS Service  
3. Use case: EC2  
4. Continue  
5. Click “Add permissions” → “Create inline policy”  
6. Paste the policy below (replace YOUR_BUCKET_NAME):

```

{
"Version": "2012-10-17",
"Statement": [{
"Effect": "Allow",
"Action": ["s3:GetObject", "s3:ListBucket"],
"Resource": [
"arn:aws:s3:::YOUR_BUCKET_NAME",
"arn:aws:s3:::YOUR_BUCKET_NAME/*"
]
}]
}

```

7. Name the role: EC2-S3ReadOnly-Project1  
8. Create role  

---

## 3. Prepare User Data Script

Create a file in your repo:  
src/userdata.sh

Paste the script below (replace BUCKET + REGION before launching EC2):

```

#!/bin/bash
yum update -y
yum install -y httpd unzip

systemctl enable httpd
systemctl start httpd

BUCKET="YOUR_BUCKET_NAME"
REGION="YOUR_REGION"

mkdir -p /var/www/html/images

aws s3 cp s3://$BUCKET/images/photo.jpg /var/www/html/images/photo.jpg --region $REGION

cat > /var/www/html/index.html << 'EOF'

<!DOCTYPE html>

<html>
<head>
  <title>Project 1 — EC2 Web Hosting</title>
</head>
<body style="font-family: Arial; margin: 40px;">
  <h1>EC2 Web Hosting with S3</h1>
  <p>Below image is loaded from a private S3 bucket using IAM Role:</p>
  <img src="/images/photo.jpg" width="500">
</body>
</html>
EOF
```

---

## 4. Launch EC2 Instance

1. EC2 → Launch Instance
2. Name: project1-ec2
3. AMI: Amazon Linux 2
4. Instance type: t2.micro / t3.micro
5. Key pair: choose/create
6. Network:

   * Default VPC
   * Public subnet
   * Auto-assign public IP: Enable
7. IAM Role:
   Select **EC2-S3ReadOnly-Project1**
8. User Data:
   Paste the modified userdata.sh script
9. Security Group:

   * Allow HTTP (80) from anywhere
   * Allow SSH (22) only from your IP
10. Launch instance

---

## 5. Test the Website

1. Open browser:
   http://<EC2-Public-IP>
2. You should see:

   * Heading text
   * Image loaded from S3

If image is missing:

* Check bucket name in user data
* Check IAM role permissions
* Check log file:
  `/var/log/cloud-init-output.log`

---

## 6. Create SNS Topic (Email Alerts)

1. Open SNS → Create Topic
2. Type: Standard
3. Topic name: project1-alerts
4. Create subscription → Email
5. Enter your email → Confirm via inbox

---

## 7. Create CloudWatch CPU Alarm

1. CloudWatch → Alarms → Create alarm
2. Metric: EC2 → Per-Instance → CPUUtilization
3. Condition:

   * CPU > 70%
   * For 2 periods (5 minutes each)
4. Notification:
   Select SNS topic project1-alerts
5. Create alarm

---

## 8. (Optional) Simulate CPU Load

SSH into EC2:

```
sudo yum install -y stress
stress --cpu 2 --timeout 60
```

This triggers the alarm → SNS email alert.

---

## ✓ Deployment Complete

You now have:

* EC2 web server
* Private S3 bucket
* Secure IAM Role access
* Automated user-data provisioning
* CloudWatch alarm
* SNS email alerts

```
