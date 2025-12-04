
````markdown
# Architecture — Project 1: EC2 Web Hosting with S3, IAM Role & CloudWatch


flowchart TB
    User((User))
    EC2[EC2 Instance<br/>Apache Web Server]
    S3[(S3 Bucket<br/>Private Image Assets)]
    IAM[(IAM Role<br/>EC2 Instance Profile)]
    CW[CloudWatch<br/>CPU Alarm]
    SNS[SNS Topic<br/>Email Alerts]
    SG[Security Group<br/>Inbound: 80, 22]

    User -->|HTTP (Port 80)| EC2
    EC2 -->|GetObject via IAM Role| S3
    EC2 -->|Send Metrics| CW
    CW -->|Trigger Alarm| SNS
    EC2 -->|Role Attached| IAM
    EC2 -->|Protected By| SG
````

---

## 🏗️ **Components Overview**

### **1. EC2 Instance (Apache Web Server)**

* Hosts `index.html`
* Uses **user-data** to install Apache + AWS CLI
* Fetches image from S3 at boot

### **2. S3 Bucket (Private)**

* Stores image assets (`photo.jpg`)
* NOT public — accessed securely via IAM Role

### **3. IAM Role (Instance Profile)**

* Allows EC2 to call:

  * `s3:GetObject`
  * `s3:ListBucket`

### **4. Security Group**

* **Port 80** → Open to Internet (HTTP access)
* **Port 22** → Restricted to admin IP

### **5. CloudWatch Monitoring**

* Tracks EC2 CPU utilization
* Alarm triggers when CPU > threshold

### **6. SNS Email Alerts**

* Sends notification when CloudWatch alarm activates

---

## 🔁 **Data Flow**

1. User sends HTTP request → EC2 Apache Server
2. EC2 serves webpage + image downloaded from S3
3. EC2 sends CPU metrics to CloudWatch
4. CloudWatch alarm triggers SNS alert email
5. IAM Role ensures EC2 accesses S3 **without access keys**

---


