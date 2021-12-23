#!/bin/sh

set -e

# Create basic config for s3cmd
echo "[default]
check_ssl_certificate = True
check_ssl_hostname = True
guess_mime_type = True
bucket_location = ru-central1
host_base = storage.yandexcloud.net
host_bucket = %(bucket)s.storage.yandexcloud.net
access_key = ${AWS_ACCESS_KEY_ID}
secret_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.s3cfg

echo "Uploading"

s3cmd put ${LOCAL_FILE} s3://${AWS_BUCKET}/ $*
