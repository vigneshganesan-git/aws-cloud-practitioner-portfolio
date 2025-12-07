
---

# Project 4 — Notes

Serverless API using API Gateway + Lambda in Private VPC

---

## General Notes

This project demonstrates how API Gateway triggers a Lambda function that runs inside a private subnet.
Since the Lambda has **no internet access**, logs are written to CloudWatch Logs through a **VPC Endpoint**.

The architecture highlights secure serverless design and private networking.

---

## Key Points

* Lambda runs inside a **private subnet**
* No internet access is allowed or required
* A **VPC Endpoint** enables Lambda to send logs to CloudWatch
* API Gateway is the public entry point
* IAM Execution Role provides permissions for writing logs
* No NAT Gateway is needed (Free Tier safe)
* Simple GET API returns a JSON response

---

## Common Issues and Fixes

### Lambda timeout

Usually caused by:

* No VPC Endpoint for CloudWatch Logs
* Incorrect subnet or security group configuration

### Logs not appearing in CloudWatch

Check:

* Lambda IAM Role has **AWSLambdaBasicExecutionRole**
* VPC Endpoint for Logs created in private subnet
* Lambda attached to correct SG with outbound rules

### API not invoking Lambda

Possible causes:

* Lambda permission not added by API Gateway
* Wrong Lambda region
* Method not deployed to stage

---

## Useful Commands

### Test Lambda locally inside AWS Console

No command needed; use **Test** button in Lambda.

### Check CloudWatch Logs (after invoking API)

AWS Console → CloudWatch → Logs → `/aws/lambda/project4-lambda`

### Example response from the API

```
Hello from Lambda inside a private VPC!
```

---

## Important Reminders

* API Gateway is public, but Lambda remains private
* CloudWatch logging must go through VPC Endpoint
* Do not enable NAT Gateway (costs money)
* IAM permissions must follow least privilege
* Keep private subnet truly private (no internet gateway)

---

## Final Notes

This project demonstrates a secure, real-world serverless API design using API Gateway and Lambda in a private VPC.
It reinforces AWS concepts around networking, VPC endpoints, IAM roles, CloudWatch logging, and serverless architecture.



---
