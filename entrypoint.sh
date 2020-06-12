#! /usr/bin/env bash

cypress run $@
exit_code=$?

if [ $exit_code -ne 0 ]; then
  if [ -v ${S3_BUCKET+x} ]; then
    echo S3_BUCKET not provided. Unable to upload to s3.
  else
    echo Tests failed, uploading to "s3://${S3_BUCKET}/${S3_PATH}"
    aws s3 sync ./cypress/screenshots/ "s3://${S3_BUCKET}/${S3_PATH}/screenshots/"
    aws s3 sync ./cypress/videos/ "s3://${S3_BUCKET}/${S3_PATH}/videos/"
  fi
  exit $exit_code
fi
