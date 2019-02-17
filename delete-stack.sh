#!/bin/bash

echo 'Deleting VPC stack...'
aws cloudformation delete-stack --stack-name vpc-test

echo 'Deleting Cloudfront stack...'
aws cloudformation delete-stack --stack-name cf-test

echo 'Deleting Lambda stack...'
aws cloudformation delete-stack --stack-name lambda-sg
