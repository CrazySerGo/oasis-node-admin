#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
. $SCRIPT_DIR/oasis_env.sh

echo source node data directory : 
read SOURCE_NODE_DATA_DIR

$REMOTE_CMD rm -rf $NETWORK_DIR/node/data/tendermint/oasis_priv_validator.json $NETWORK_DIR/node/data/tendermint/config
$REMOTE_CMD rsync -av --stats --progress $SOURCE_NODE_DATA_DIR/tendermint/data $SOURCE_NODE_DATA_DIR/tendermint/abci-state $NETWORK_DIR/node/data/tendermint