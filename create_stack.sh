#!/bin/bash

echo 'Creating VPC stack...'
aws cloudformation create-stack --stack-name vpc-test --template-body file://vpc.yaml

echo 'Creating Cloudfront stack...'
aws cloudformation create-stack --stack-name cf-test --template-body file://cloudfront.yaml

echo 'Creating Lambda stack...'
aws cloudformation create-stack --stack-name lambda-sg --template-body file://lambda.yaml --capabilities CAPABILITY_NAMED_IAM --region us-east-1

# Invoke Lambda
echo 'Invoking lambda...'
./invoke_lambda.sh
