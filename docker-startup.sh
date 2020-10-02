#!/bin/sh
nginx -g 'pid /run/nginx/nginx.pid;'
tail -f /dev/null