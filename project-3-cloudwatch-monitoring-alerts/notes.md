

# Project 3 — Notes

EC2 Monitoring & Alerts using CloudWatch + SNS

---

## General Notes

This project shows how to monitor an EC2 instance using CloudWatch and receive email alerts through SNS.
The EC2 instance automatically sends CPU metrics to CloudWatch under basic monitoring.
CloudWatch Alarms evaluate these metrics and trigger SNS notifications.

---

## Key Points

* EC2 basic monitoring (Free Tier) sends CPU metrics every 5 minutes
* SNS email subscription must be confirmed before alerts work
* CloudWatch Alarm triggers only when the condition stays true for the entire evaluation period
* Only CPUUtilization metric is required for this project
* No CloudWatch Agent or additional logs are needed
* Stress test is used only to verify that the alarm works

---

## Common Issues and Fixes

### Alarm not triggering

* CPU usage did not exceed the threshold
* Not enough time passed (5-minute evaluation)
* SNS subscription not confirmed

### No email received

* Check spam folder
* SNS subscription may still be pending
* Alarm did not enter **ALARM** state yet

### SSH is failing

* Ensure port 22 is open in Security Group
* Use correct key pair

---

## Useful Commands

### Connect to EC2 instance

```bash
ssh -i yourkey.pem ec2-user@EC2_PUBLIC_IP
```

### Install stress tool

```bash
sudo yum install stress -y
```

### Generate CPU load to trigger alarm

```bash
stress --cpu 2 --timeout 180
```

---

## Final Notes

* This project is fully Free-Tier compatible
* Only uses basic metrics and SNS, both of which are free
* Ideal for Cloud Practitioner portfolio as a monitoring demonstration
* Shows real alerting workflow with minimal configuration
* Clean and simple implementation using AWS-managed services

---

