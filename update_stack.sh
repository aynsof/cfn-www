#!/bin/bash

echo 'Updating VPC stack...'
aws cloudformation update-stack --stack-name vpc-test --template-body file://vpc.yaml

echo 'Updating Cloudfront stack...'
aws cloudformation update-stack --stack-name cf-test --template-body file://cloudfront.yaml --parameters file://parameters.json

echo 'Updating Lambda stack...'
aws cloudformation update-stack --stack-name lambda-sg --template-body file://lambda.yaml --capabilities CAPABILITY_NAMED_IAM --region us-east-1

echo 'Invoking lambda...'
./invoke_lambda.sh
