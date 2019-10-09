#! /bin/sh

set -xe

BASE_URL=${BASE_URL:-/}

if [ "${BASE_URL}" ]; then
  sed -i "s|location .* {|location $BASE_URL {|g" /etc/nginx/nginx.conf
fi

# replace the PORT that nginx listens on if PORT is supplied
if [[ -n "${PORT}" ]]; then
    sed -i "s|8080|${PORT}|g" /etc/nginx/nginx.conf
fi

exec nginx -g 'daemon off;'
