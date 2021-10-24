#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
. $SCRIPT_DIR/oasis_env.sh

echo check isgx device
ls -l /dev/isgx

echo check aesmd status
$REMOTE_CMD_ADMIN systemctl status aesmd.service

echo nmap $CUSTOM_OASIS_NODE_ADDR -p $OASIS_NODE_PORT,$CUSTOM_PARATIME_WORKER_CLIENT_PORT,$CUSTOM_PARATIME_WORKER_P2P_PORT -Pn
nmap $CUSTOM_OASIS_NODE_ADDR -p $OASIS_NODE_PORT,$CUSTOM_PARATIME_WORKER_CLIENT_PORT,$CUSTOM_PARATIME_WORKER_P2P_PORT -Pn
