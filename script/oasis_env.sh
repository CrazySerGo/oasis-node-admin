SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
#import
NETWORK_NODE_NAME=testnet
NETWORK_HOST=oasis@host
NETWORK_DIR="/home/oasis/testnet"
NETWORK_BIN_PATH="$NETWORK_DIR/node/bin/oasis-node"
OASIS_CORE_VERSION="21.2.7"
OASIS_GENESIS_URL="https://github.com/oasisprotocol/testnet-artifacts/releases/download/2021-04-13/genesis.json"
NETWORK_ADDR="unix:$NETWORK_DIR/node/data/internal.sock"
NETWORK_CONFIG="$NETWORK_DIR/node/etc/config.yml"

. $SCRIPT_DIR/oasis_custom.sh

if [ -n "$CUSTOM_NETWORK_NODE_NAME" ] ; then 
	NETWORK_NODE_NAME=$CUSTOM_NETWORK_NODE_NAME
fi

if [ -n "$CUSTOM_NETWORK_HOST" ] ; then 
	NETWORK_HOST=$CUSTOM_NETWORK_HOST
fi

if [ -n "$CUSTOM_NETWORK_DIR" ] ; then 
	NETWORK_DIR=$CUSTOM_NETWORK_DIR;
fi

if [ -n "$CUSTOM_NETWORK_BIN_PATH" ] ; then 
	NETWORK_BIN_PATH=$CUSTOM_NETWORK_BIN_PATH;
fi

if [ -n "$CUSTOM_OASIS_CORE_VERSION" ] ; then 
	OASIS_CORE_VERSION=$CUSTOM_OASIS_CORE_VERSION
fi

if [ -n "$CUSTOM_OASIS_GENESIS_URL" ] ; then 
	OASIS_GENESIS_URL=$CUSTOM_OASIS_GENESIS_URL
fi

if [ -n "$CUSTOM_NETWORK_ADDR" ] ; then 
	NETWORK_ADDR=$NETWORK_ADDR
fi

if [ -n "$CUSTOM_NETWORK_CONFIG" ] ; then 
	NETWORK_CONFIG=$NETWORK_NETWORK_CONFIG
fi


OASIS_CORE_DIR="oasis_core_${OASIS_CORE_VERSION}_linux_amd64"
OASIS_CORE_TAR="${OASIS_CORE_DIR}.tar.gz"
OASIS_CORE_URL="https://github.com/oasisprotocol/oasis-core/releases/download/v${OASIS_CORE_VERSION}/${OASIS_CORE_TAR}"
OASIS_GENESIS_URL="https://github.com/oasisprotocol/testnet-artifacts/releases/download/2021-04-13/genesis.json"

LOCAL_DIR="$SCRIPT_DIR/.."
LOCAL_BIN="$LOCAL_DIR/oasis-core/$OASIS_CORE_DIR/oasis-node"
LOCAL_TX="$LOCAL_DIR/tx"

ENTITY_DIR="$LOCAL_DIR/entity"
GENESIS_JSON="$LOCAL_DIR/genesis.json"
LOCAL_NODE_DIR=$ENTITY_DIR/node/$NETWORK_NODE_NAME

SSHCMD="ssh -4 $NETWORK_HOST"
NETWORK_BIN="$SSHCMD $NETWORK_BIN_PATH"
NETWORK_BIN_SCREEN="$SSHCMD screen -S $NETWORK_NODE_NAME -dm $NETWORK_BIN_PATH"
NETWORK_SCREEN="$SSHCMD -t screen -r $NETWORK_NODE_NAME"

mkdir -p $LOCAL_TX
