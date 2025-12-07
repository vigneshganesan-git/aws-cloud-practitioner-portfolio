

---

# Project 4 — Serverless API (API Gateway + Lambda + Private VPC)

This project demonstrates how to build a secure serverless REST API using API Gateway and AWS Lambda running inside a private VPC subnet.
The Lambda function has **no internet access**, and logs are sent to CloudWatch through a **VPC Endpoint**, ensuring a secure, fully private architecture.

---

## Table of Contents

* Overview
* Architecture
* What You Will Build
* AWS Services Used
* Project Structure
* Deployment Steps
* Key Deliverables
* Security Best Practices
* Future Enhancements
* License
* Author

---

## Overview

This project shows how API Gateway invokes a Lambda function that runs **inside a private subnet**.
Since the Lambda cannot access the internet, a **VPC Endpoint** is used to allow Lambda to send logs to CloudWatch privately.

This project strengthens Cloud Practitioner-level skills in:

* Serverless
* VPC networking
* IAM roles
* CloudWatch logging
* API Gateway configuration

---

## Architecture

Refer to: architecture-diagram.md

High-Level Flow:

1. A user sends an HTTPS request to API Gateway
2. API Gateway invokes the Lambda function
3. Lambda runs inside a private subnet in the VPC
4. Lambda sends logs to CloudWatch through a VPC Endpoint
5. IAM Role controls Lambda’s permissions

Mermaid Diagram:

```mermaid
flowchart TB

    User((User)) --> APIGW[API Gateway]
    APIGW --> Lambda[Lambda Function (Private Subnet)]
    Lambda --> VPCE[VPC Endpoint (CloudWatch Logs)]
    Lambda --> IAM[(IAM Execution Role)]
```

---

## What You Will Build

* A public HTTPS API exposed by API Gateway
* A Lambda function running in a private subnet
* A VPC with subnets and routing
* A VPC Endpoint for CloudWatch Logs
* IAM Execution Role for Lambda
* A working GET endpoint returning a simple JSON response

---

## AWS Services Used

API Gateway — Provides the public HTTPS API
Lambda — Runs application logic
VPC — Hosts Lambda in a private subnet
VPC Endpoint — Allows secure access to CloudWatch Logs
CloudWatch Logs — Stores Lambda logs
IAM — Provides least-privilege permissions

---

## Project Structure

project-4-serverless-api-lambda-vpc/
├── README.md
├── architecture-diagram.md
├── steps.md
├── lambda/
│   └── lambda_function.py
└── notes.md

---

## Deployment Steps

All setup instructions are available here: steps.md

---

## Key Deliverables

* A functioning REST API
* Lambda running securely in a private subnet
* VPC Endpoint enabling CloudWatch logs
* Logs visible in CloudWatch
* Proper IAM roles attached to Lambda
* Fully documented project

---

## Security Best Practices

* Lambda stays **inside a private subnet**
* No NAT Gateway or internet access needed
* VPC Endpoint ensures private communication with CloudWatch
* IAM role uses least-privilege policies
* API Gateway uses HTTPS by default

---

## Future Enhancements

* Add more API routes (POST, PUT, DELETE)
* Add DynamoDB integration
* Add API authentication (API Keys / Cognito)
* Build Terraform or CloudFormation automation

---

## License

This project is licensed under the MIT License.

---

## Author

Vignesh Ganesan
AWS Certified Cloud Practitioner — Score: 1000/1000

---
