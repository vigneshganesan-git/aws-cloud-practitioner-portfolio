
---

# Project 1 — Deployment Steps

EC2 Web Hosting with S3, IAM Role and CloudWatch Monitoring

This guide explains how to deploy a simple web server on EC2, store an image in S3, allow EC2 to access it using an IAM Role, and set up CloudWatch monitoring with SNS alerts.

---

## 1. Create S3 Bucket and Upload Image

1. Open the Amazon S3 console
2. Click **Create bucket**
3. Enter a unique bucket name (example: `project1-vignesh-assets`)
4. Choose your AWS Region
5. Keep **Block Public Access** enabled
6. Create the bucket
7. Inside the bucket, create a folder named **images**
8. Upload your image file `photo.jpg` into the images folder

Your S3 bucket is ready.

---

## 2. Create IAM Role for EC2 (to read from S3)

1. Go to **IAM → Roles → Create role**
2. Select **AWS Service → EC2**
3. Continue
4. Click **Add permissions → Create inline policy**
5. Paste the policy below (replace `YOUR_BUCKET_NAME`):

```json
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

6. Name the role: **EC2-S3ReadOnly-Project1**
7. Create the role

This role safely allows EC2 to read your S3 objects.

---

## 3. Prepare the User Data Script

Create a file in your project:

**src/userdata.sh**

Paste this script and replace `YOUR_BUCKET_NAME` and `YOUR_REGION` before launching EC2:

```bash
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
<head><title>Project 1 — EC2 Web Hosting</title></head>
<body style="font-family: Arial; margin: 40px;">
<h1>EC2 Web Hosting with S3</h1>
<p>This image is loaded from a private S3 bucket using an IAM Role:</p>
<img src="/images/photo.jpg" width="500">
</body>
</html>
EOF
```

This script installs Apache, pulls your S3 image, and creates the webpage automatically.

---

## 4. Launch the EC2 Instance

1. Open **EC2 → Launch Instance**
2. Instance name: `project1-ec2`
3. AMI: **Amazon Linux 2**
4. Instance type: **t2.micro / t3.micro**
5. Key pair: choose or create
6. Network settings:

   * VPC: default
   * Subnet: public subnet
   * Auto-assign Public IP: enabled
7. IAM Role:
   Select **EC2-S3ReadOnly-Project1**
8. User Data:
   Paste your updated `userdata.sh` script
9. Security Group:

   * Allow HTTP (80) from Anywhere
   * Allow SSH (22) from Your IP only
10. Launch the instance

Your EC2 instance will configure itself automatically.

---

## 5. Test the Webpage

Open this in your browser:

```
http://<EC2-Public-IP>
```

You should see:

* A webpage
* The image loaded from S3

If the image does not load, check the log:

```
sudo cat /var/log/cloud-init-output.log
```

---

## 6. Create SNS Topic (Email Alerts)

1. Open **Amazon SNS**
2. Click **Create topic**
3. Choose **Standard**
4. Topic name: `project1-alerts`
5. Create subscription → choose **Email**
6. Enter your email
7. Confirm from inbox

SNS notifications are now enabled.

---

## 7. Create CloudWatch CPU Alarm

1. Go to **CloudWatch → Alarms → Create alarm**
2. Choose metric:
   EC2 → Per-instance → CPUUtilization
3. Set the condition:

   * CPU > 70% for 2 periods
4. Select SNS topic: `project1-alerts`
5. Create the alarm

This will notify you when CPU usage is high.

---

## 8. Optional: Test the Alarm

SSH into EC2 and run:

```bash
sudo yum install -y stress
stress --cpu 2 --timeout 60
```

This simulates high CPU usage and should trigger a CloudWatch alert.

---

## Deployment Completed

You have successfully deployed:

* EC2 web server
* Private S3 bucket
* IAM Role for secure access
* Automated setup using User Data
* CloudWatch CPU monitoring
* SNS email alerts

Project 1 is fully operational.

---

