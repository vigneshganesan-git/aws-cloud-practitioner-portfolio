
---

# Project 4 — Deployment Steps

Serverless API using API Gateway + Lambda in Private VPC

This guide explains how to build a secure serverless API where a Lambda function runs in a private VPC subnet and writes logs to CloudWatch through a VPC Endpoint.

All steps are Free-Tier safe.

---

## Step 1 — Create a VPC

1. Go to VPC Console → Create VPC
2. Choose: “VPC and more”
3. Name: project4-vpc
4. IPv4 CIDR: 10.0.0.0/16
5. Select:

   * 1 public subnet
   * 1 private subnet
6. NAT Gateway: **Disable** (to stay Free Tier safe)
7. VPC Endpoint: leave unchecked for now
8. Create VPC

This setup provides one private subnet for Lambda.

---

## Step 2 — Create a VPC Endpoint (CloudWatch Logs)

1. Go to **VPC → Endpoints → Create Endpoint**
2. Service Category: AWS Services
3. Search: **logs**
   Choose: `com.amazonaws.<region>.logs`
4. Type: Interface
5. VPC: select project4-vpc
6. Subnets: choose **private subnet**
7. Enable DNS Name: Yes
8. Security Group:

   * Create a new SG called `vpce-logs-sg`
   * Allow inbound *HTTPS (443)* from the VPC
9. Create endpoint

This allows Lambda to write logs without internet.

---

## Step 3 — Create IAM Role for Lambda

1. Go to IAM → Roles → Create Role
2. Trusted entity: AWS Service
3. Use case: Lambda
4. Permissions: Attach policy

   * **AWSLambdaBasicExecutionRole**
5. Role Name: lambda-vpc-execution-role
6. Create role

This role allows Lambda to write logs.

---

## Step 4 — Create Lambda Function

1. Go to Lambda Console → Create Function
2. Name: project4-lambda
3. Runtime: Python 3.12 (or Node.js if preferred)
4. Execution role:

   * Choose existing role → lambda-vpc-execution-role
5. Create function

After creation, configure VPC:

1. Go to **Configuration → VPC**
2. Edit
3. VPC: project4-vpc
4. Subnet: select **private subnet**
5. Security group: Create new SG `lambda-private-sg`

   * Outbound allowed (default)
6. Save

Lambda now runs inside a private subnet.

---

## Step 5 — Add Code to Lambda

Open lambda_function.py and replace with this:

```python
def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": "Hello from Lambda inside a private VPC!"
    }
```

Deploy the function.

---

## Step 6 — Create API Gateway REST API

1. Open API Gateway
2. Create API → REST API → Build
3. API Name: project4-serverless-api
4. Endpoint Type: Regional
5. Create API

### Create GET method

1. Resources → Create Method
2. Choose: GET
3. Integration Type: Lambda Function
4. Lambda Region: your region
5. Lambda Function: project4-lambda
6. Save
7. Click “OK” to add permissions

---

## Step 7 — Deploy the API

1. Go to **Actions → Deploy API**
2. Create new stage: prod
3. Note the invoke URL, e.g.:

```
https://abc123.execute-api.region.amazonaws.com/prod
```

---

## Step 8 — Test the API

Open the browser:

```
https://your-api-id.execute-api.your-region.amazonaws.com/prod
```

You should see:

```
Hello from Lambda inside a private VPC!
```

Logs will appear in CloudWatch Logs through the VPC Endpoint.

---

## Step 9 — Clean Up (Optional)

To avoid clutter:

* Delete API Gateway
* Delete Lambda
* Delete VPC Endpoint
* Delete VPC

All components used are Free Tier safe.

---

# Deployment Completed

You have successfully built:

* A serverless API
* Lambda in private subnet
* CloudWatch logging using VPC Endpoint
* IAM role with least privilege
* A secure, isolated architecture



---

