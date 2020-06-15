#! /usr/bin/env bash

# trim leading / so we don't get bucket//file
s3_path="${S3_PATH#/}"
s3_bucket="${S3_BUCKET}"

cypress run $@
exit_code=$?

if [ $exit_code -ne 0 ]; then
  if [ -z "${s3_bucket}" ]; then
    echo s3_bucket not provided. Unable to upload to s3.
  else
    echo Tests failed, uploading to "s3://${s3_bucket}/${s3_path}"
    aws s3 sync ./cypress/screenshots/ "s3://${s3_bucket}/${s3_path}/screenshots/"
    aws s3 sync ./cypress/videos/ "s3://${s3_bucket}/${s3_path}/videos/"
  fi
  exit $exit_code
fi
