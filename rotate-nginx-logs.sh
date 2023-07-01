


tee /root/scripts/rotate-nginx-logs.sh <<-'EOF'


#!/bin/bash
# Description: rotate nginx access logs
#nginx日志切割脚本
# can be used in production .


NGX_PID=`cat /usr/local/nginx/logs/nginx.pid`

LOGS_DIR="/usr/local/nginx/logs"

LOG1_NAME="main.log"
LOG2_NAME="error.log"

cd $LOGS_DIR
/usr/bin/mv  $LOG1_NAME $(date +%F -d 'yesterday')_$LOG1_NAME
/usr/bin/mv  $LOG2_NAME $(date +%F -d 'yesterday')_$LOG2_NAME

/usr/bin/kill -USR1 $NGX_PID


EOF
