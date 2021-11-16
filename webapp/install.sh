#!/bin/sh

#set -x

injected_dir=$1

echo "*** INJECTED DIRECTORY -> $injected_dir"

source /usr/local/s2i/install-common.sh

echo "*** LOADED COMMON INFRASTRUCTURE"

configure_drivers $injected_dir/drivers.env

echo "*** CONFIGURED DRIVERS"

$JBOSS_HOME/bin/jboss-cli.sh --file=$injected_dir/setup.cli

echo "*** CONFIGURED EAP INSTANCE"
