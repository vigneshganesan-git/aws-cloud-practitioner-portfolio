
# Project 4 — Serverless API (API Gateway + Lambda in Private VPC)

A real-world serverless REST API built using AWS Lambda (in a private subnet) and exposed through Amazon API Gateway.
Lambda writes logs to CloudWatch using a VPC Endpoint, ensuring no public internet access.

This project covers AWS Cloud Practitioner concepts around Serverless, Networking, VPC Endpoints, Security, IAM Roles, and Monitoring.

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

This project demonstrates how to build a secure serverless API using API Gateway and Lambda.
The Lambda function runs inside a private VPC subnet with **no internet access**, and communicates with CloudWatch Logs through a **VPC Endpoint**.

You will learn:

* How API Gateway triggers Lambda
* How Lambda works inside a private VPC
* How CloudWatch logging works using VPC endpoints
* How IAM roles secure the entire workflow

---

## Architecture

Refer to the architecture file here: architecture-diagram.md

High-Level Flow:

1. User sends an HTTPS request to API Gateway
2. API Gateway invokes Lambda function
3. Lambda runs inside a private subnet
4. Lambda logs messages to CloudWatch Logs through a VPC Endpoint
5. IAM role controls Lambda permissions



```mermaid
flowchart TB

    User((User)) --> APIGW[API Gateway]
    APIGW --> Lambda[Lambda Function (Private Subnet)]
    Lambda --> VPCE[VPC Endpoint (CloudWatch Logs)]
    Lambda --> IAM[(IAM Execution Role)]
```

---

## What You Will Build

* Public API endpoint using API Gateway
* Lambda function running in a private subnet
* VPC with private and public subnets
* CloudWatch logging via VPC Endpoint
* IAM Execution Role for Lambda
* A working GET endpoint returning a JSON response

---

## AWS Services Used

API Gateway — Exposes the REST API
Lambda — Executes backend logic
VPC — Provides private subnet for Lambda
VPC Endpoint — Enables CloudWatch Logs access privately
CloudWatch Logs — Stores Lambda logs
IAM — Defines Lambda execution permissions

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

Full step-by-step guide is available here: steps.md

---

## Key Deliverables

* Secure REST API with HTTPS
* Lambda inside private subnet (no internet)
* CloudWatch logs available through VPC Endpoint
* Correct IAM role for Lambda
* Fully working API endpoint

---

## Security Best Practices

* Lambda placed in **private subnet**
* No public internet access
* VPC Endpoint for CloudWatch Logs
* IAM role using least privilege
* API Gateway uses HTTPS by default

---

## Future Enhancements

* Add POST, PUT, DELETE methods
* Add DynamoDB integration
* Add API Keys or Cognito authentication
* Add Terraform/CloudFormation version

---

## License

This project is licensed under the MIT License.

---

## Author

Vignesh Ganesan
AWS Certified Cloud Practitioner — Score: 1000/1000

