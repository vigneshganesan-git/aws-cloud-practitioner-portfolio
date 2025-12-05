#!/bin/bash

# Update system packages
yum update -y

# Install Apache web server
yum install -y httpd

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Replace these values before launching EC2
BUCKET="YOUR_BUCKET_NAME"
REGION="YOUR_REGION"

# Create folder for images inside the web directory
mkdir -p /var/www/html/images

# Download the image from your S3 bucket using IAM Role permissions
aws s3 cp s3://$BUCKET/images/photo.jpg /var/www/html/images/photo.jpg --region $REGION

# Create the index.html webpage
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AWS Project 1 - EC2 Web Hosting</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 40px;">

    <h1>AWS Project 1: EC2 Web Hosting with S3 Integration</h1>

    <p>
        This webpage is hosted on an EC2 instance. 
        The image below is loaded from your private S3 bucket using an IAM Role.
    </p>

    <img src="/images/photo.jpg" width="500">

</body>
</html>
EOF
