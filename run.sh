#!/bin/bash

redis_host=$1
redis_port=$2
redis_db=$3
redis_password=$4
redis_queue_name=$5
redis_salt=$6

config_file='/root/selena-agent/settings-local.py'

echo "REDIS_CONNECTION = {" > $config_file
echo "  'HOST': '$redis_host'," > $config_file
echo "  'PORT': '$redis_port'," > $config_file
echo "  'DB': $redis_db," > $config_file
echo "  'PASSWORD': '$redis_password'," > $config_file
echo "}" > $config_file
echo "QUEUE_NAME = '$redis_queue_name'" > $config_file
echo "SALT = '$redis_salt'" > $config_file

/root/selena-agent/venv/bin/rqworker $redis_queue_name
