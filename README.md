# cfn-www

Create a simple website.

## Known Issues

ASG only in one AZ. It should be across multiple AZs for availability.
ASG is in public subnets, but should be in private.
ASG has ssh ingress from 0.0.0.0/0 - should be only from a public-facing subnet through a jumpbox that has been restricted to a particular IP address/address range. Ideally, ssh wouldn't be used at all: immutable infrastructure would be used.
ASG has http ingress from 0.0.0.0/0 - should be only from ELB subnet.
ASG should have more than one instance for redundancy.
ELB has ingress from 0.0.0.0/0 - should be only from CloudFront using something like https://raw.githubusercontent.com/aws-samples/aws-cloudfront-samples/master/update_security_groups_lambda/update_security_groups.py (refer to Lambda stack in the linked Cloudformation repository).d2lrax4ztwcwih.cloudfront.net
CloudFront should be used for both static assets on S3 and dynamic pages served through Apache. The distribution is available at: d2lrax4ztwcwih.cloudfront.net
No certificate has been configured on the ELB. I would suggest using ACM.
S3 bucket is public, but Origin Access Identity should be used to restrict access to CloudFront.
Source code is available at: https://github.com/aynsof/cfn-www.
CI/CD pipeline doesn't wait for the stack to be created. Ideally this would wait for a CREATE_COMPLETE/UPDATE_COMPLETE.
Testing is fairly limited - if the stack were long-running, the ARNs/IDs for particular long-running resources (CloudFront distribution, ELB, ASG) would be used.
