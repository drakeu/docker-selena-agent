#!/bin/bash

config_file='/root/selena-agent/selena_agent/settings-local.py'

echo "REDIS_CONNECTION = {" > $config_file
echo "  'HOST': '$REDIS_HOST'," >> $config_file
echo "  'PORT': $REDIS_PORT," >> $config_file
echo "  'DB': $REDIS_DB," >> $config_file
echo "  'PASSWORD': $REDIS_PASSWORD" >> $config_file
echo "}" >> $config_file
echo "QUEUE_NAME = '$REDIS_QUEUE_NAME'" >> $config_file
echo "SALT = '$REDIS_SALT'" >> $config_file

source /root/selena-agent/venv/bin/activate

selena-agent
