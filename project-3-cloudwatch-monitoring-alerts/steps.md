
---

# Project 3 — Deployment Steps

EC2 Monitoring & Alerts using CloudWatch + SNS

This guide shows how to set up basic EC2 monitoring and email alerts using CloudWatch and SNS.
All steps are fully Free-Tier safe.

---

## Step 1 — Launch an EC2 Instance

1. Go to EC2 Console → Launch Instance
2. Name: project3-monitoring-instance
3. AMI: Amazon Linux 2023 (or Amazon Linux 2)
4. Instance type: t2.micro (Free Tier)
5. Key pair: Create or use existing
6. Network settings:

   * Allow SSH (port 22)
7. Leave monitoring as **Basic (Free Tier)**
8. Launch the instance

The instance will automatically send basic CPU metrics to CloudWatch.

---

## Step 2 — Create an SNS Topic

1. Open SNS Console
2. Click **Create Topic**
3. Type: Standard
4. Name: project3-alerts-topic
5. Create Topic

### Create Subscription

1. Open the topic
2. Click **Create Subscription**
3. Protocol: Email
4. Add your email address
5. Confirm the email from your inbox

SNS is now ready to receive alarm notifications.

---

## Step 3 — Create a CloudWatch Alarm for CPU

1. Open **CloudWatch Console**
2. Go to **Alarms → Create Alarm**
3. Click **Select Metric**
4. Choose:
   EC2 → Per-Instance Metrics → CPUUtilization
5. Select your instance → Select metric

### Configure the alarm

* Statistic: Average
* Period: 5 minutes
* Condition: **Greater than 70%**

Click Next.

### Add SNS notification

* Alarm state: **In Alarm**
* Select SNS topic: project3-alerts-topic

### Complete setup

1. Name the alarm: project3-cpu-alarm
2. Review and create alarm

Your alarm will now evaluate CPU usage and send alerts when threshold is breached.

---

## Step 4 — Test the Alarm (Simple Working Test)

Run a basic CPU stress test to trigger the alarm.

SSH into EC2:

```bash
ssh -i yourkey.pem ec2-user@EC2_PUBLIC_IP
```

Install stress package:

```bash
sudo yum install stress -y
```

Run CPU load for 3 minutes:

```bash
stress --cpu 2 --timeout 180
```

Within 5–7 minutes, CloudWatch Alarm becomes **ALARM**.
SNS sends an email to your inbox.

---

## Step 5 — Shut Down Resources (Optional for Safety)

To avoid unnecessary usage:

* Stop or Terminate the EC2 instance
* SNS and CloudWatch alarms are free to keep

---

# Deployment Completed

This completes a working EC2 monitoring and alerting setup using:

* EC2 (Basic monitoring)
* CloudWatch Metrics
* CloudWatch Alarm
* SNS Email Notification

