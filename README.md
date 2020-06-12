# cypress-to-s3

Publish cypress artifacts to s3

## Usage

```sh
docker run \
  -v $(PWD)/cypress/:/cypress/ \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -e AWS_SESSION_TOKEN \
  -e AWS_DEFAULT_REGION=us-east-2 \
  -e S3_BUCKET=my-artifact-bucket \
  -e S3_PATH=edge/build123/ \
  jgramoll/cypress-to-s3
```
