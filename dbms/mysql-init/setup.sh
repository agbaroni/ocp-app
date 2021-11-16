#!/bin/sh

# set +x

# echo $PWD

# echo $0

# ls -l /opt/app-root/src/

# ls -l

mysql $mysql_flags < setup.sql
