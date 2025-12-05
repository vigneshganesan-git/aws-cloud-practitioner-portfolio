

````markdown
# Project 1 — Notes  
EC2 Web Hosting with S3, IAM Role, CloudWatch & SNS

These notes highlight the key learnings, decisions, and issues encountered while completing this project.

---

## 1. What This Project Covers
- Hosting a webpage on an EC2 instance using Apache  
- Storing static assets (image) in an S3 bucket  
- Allowing EC2 to access S3 using an IAM Role  
- Using User Data for automated server setup  
- Setting up CloudWatch CPU alarms  
- Sending notifications using SNS  

---

## 2. S3 Access Method Used in This Project
To keep the project simple and beginner-friendly, the image stored in S3 was made publicly accessible using a **bucket policy**, while keeping the rest of the bucket private.

### Bucket Policy Applied

```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/images/*"
  }]
}
````

Purpose:

* Only objects inside `images/` are public
* Easy to load the image directly from EC2
* Good for learning before moving to private-access-only patterns

---

## 3. Common Issues and Quick Fixes

### Image Not Showing on EC2

* Bucket name in User Data script incorrect
* Wrong region used
* Public access policy not applied
* Wrong object path (`images/photo.jpg`)
* User Data script failed to run
* Image not uploaded to correct folder

Check User Data logs:

```
sudo cat /var/log/cloud-init-output.log
```

---

### User Data Failed to Execute

* Script missing `#!/bin/bash`
* Formatting errors when pasted
* User Data only runs on **first boot**

Fix: Terminate instance → relaunch with correct script.

---

### AccessDenied on S3

* Bucket policy missing
* Object not inside `images/` folder
* URL used incorrectly

Correct object URL format:

```
https://YOUR_BUCKET_NAME.s3.amazonaws.com/images/photo.jpg
```

---

## 4. CloudWatch Alarm Notes

* Alarm triggers only when CPU stays above threshold
* SNS subscription must be confirmed by email
* To test the alarm:

```
sudo yum install -y stress
stress --cpu 2 --timeout 60
```

---

## 5. Best Practices Learned

* Verify bucket name and region before launching EC2
* Keep S3 buckets private except required objects/folders
* IAM Roles remove need for access keys (recommended security practice)
* Use `/var/log/cloud-init-output.log` to debug User Data
* Maintain clean folder structure:

```
src/
  index.html
  userdata.sh
```
