import json
import logging

# Set up logging so we can see output in CloudWatch Logs
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    """
    This Lambda function runs inside a private subnet.
    It gets triggered by API Gateway and returns a simple JSON response.

    What this function does:
    1. Logs the incoming request (visible in CloudWatch Logs)
    2. Reads a query parameter 'name' if provided
    3. Returns a friendly message as JSON
    """

    # Log the incoming event for debugging
    logger.info("Event received from API Gateway: %s", json.dumps(event))

    # Read query parameters safely (example: GET /?name=Vignesh)
    query_params = event.get("queryStringParameters")
    if query_params and "name" in query_params:
        user_name = query_params["name"]
        message = f"Hello, {user_name}! This message is from Lambda in a private VPC."
    else:
        message = "Hello from Lambda inside a private VPC!"

    # Build the response body
    response_body = {
        "message": message
    }

    # Final response returned to API Gateway
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(response_body)
    }
