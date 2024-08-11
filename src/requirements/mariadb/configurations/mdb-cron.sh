#!/bin/bash

# Example debug commands
echo "---- MariaDB Status ----"
service mariadb status

echo "---- Disk Usage ----"
df -h

echo "---- Memory Usage ----"
free -m

echo "---- Active Connections ----"
mysqladmin -uroot -pYOUR_ROOT_PASSWORD processlist

# Add any other debug info you'd like to include
