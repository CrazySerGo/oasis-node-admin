#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
. $SCRIPT_DIR/oasis_env.sh

ENTITY_ID=`$SCRIPT_DIR/account_info/get_entity_id.sh`
$SCRIPT_DIR/oasis_local.sh stake pubkey2address --public_key $ENTITY_ID
