aws iam create-open-id-connect-provider \
  --url "https://sts.windows.net/<tenant-id>/" \
  --client-id-list "https://analysis.windows.net/powerbi/connector/AmazonS3"

aws iam create-role --role-name fabric-openaq-archive-read \
  --assume-role-policy-document file://trust-policy.json \
  --query Role.Arn --output text

aws iam put-role-policy --role-name fabric-openaq-archive-read \
  --policy-name openaq-archive-read \
  --policy-document file://s3-read-policy.json
