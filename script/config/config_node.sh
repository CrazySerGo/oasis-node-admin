#/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
. $SCRIPT_DIR/oasis_env.sh

CONFIG_VALUE=""

config_value "OASIS_NODE_NETWORK ex: testnet mainnet" "$OASIS_NODE_NETWORK"
CONFIG_OASIS_NODE_NETWORK="$CONFIG_VALUE"

CONFIG_ENTITY_DIR=$SCRIPT_DIR/../config/entity/$OASIS_NODE_NETWORK
ls $CONFIG_ENTITY_DIR
config_value "OASIS_NODE_ENTITY ex: my_entity" "$OASIS_NODE_ENTITY"
CONFIG_OASIS_NODE_ENTITY="$CONFIG_VALUE"

config_value "OASIS_NODE_TYPE ex: validator nonvalidator cipher-paratime emerald" "$OASIS_NODE_TYPE"
CONFIG_OASIS_NODE_TYPE="$CONFIG_VALUE"

config_value "OASIS_NODE_SSH_NAME ex: oasis" "$OASIS_NODE_SSH_NAME"
CONFIG_OASIS_NODE_SSH_NAME="$CONFIG_VALUE"

config_value "OASIS_NODE_SSH_ADMIN_NAME ex: root" "$OASIS_NODE_SSH_ADMIN_NAME"
CONFIG_OASIS_NODE_SSH_ADMIN_NAME="$CONFIG_VALUE"

config_value "OASIS_NODE_ROOT_DIR ex: /home/oasis" "$OASIS_NODE_ROOT_DIR"
CONFIG_OASIS_NODE_ROOT_DIR="$CONFIG_VALUE"

config_value "OASIS_NODE_ADDR ex: 8.8.8.8" "$OASIS_NODE_ADDR"
CONFIG_OASIS_NODE_ADDR="$CONFIG_VALUE"

config_value "OASIS_NODE_PORT ex: 26656" "$OASIS_NODE_PORT"
CONFIG_OASIS_NODE_PORT="$CONFIG_VALUE"

config_value "PARATIME_WORKER_CLIENT_PORT ex: 30001" "$PARATIME_WORKER_CLIENT_PORT"
CONFIG_PARATIME_WORKER_CLIENT_PORT="$CONFIG_VALUE"

config_value "PARATIME_WORKER_P2P_PORT ex: 30002" "$PARATIME_WORKER_P2P_PORT"
CONFIG_PARATIME_WORKER_P2P_PORT="$CONFIG_VALUE"

if [ -z "$OASIS_NODE_SSH_ID" ] ; then
	OASIS_NODE_SSH_ID="$(< ~/.ssh/id_rsa.pub)"
fi

config_value "OASIS_NODE_SSH_ID ex: ssh-rsa AAA...== oasis@host" "$OASIS_NODE_SSH_ID"
CONFIG_OASIS_NODE_SSH_ID="$CONFIG_VALUE"

mkdir -p $CONFIG_NODE_DIR

cat >$CONFIG_NODE_DIR/node_config.sh << EOF
CUSTOM_OASIS_NODE_ENTITY="$CONFIG_OASIS_NODE_ENTITY"
CUSTOM_OASIS_NODE_NETWORK="$CONFIG_OASIS_NODE_NETWORK"
CUSTOM_OASIS_NODE_TYPE="$CONFIG_OASIS_NODE_TYPE"
CUSTOM_OASIS_NODE_ROOT_DIR="$CONFIG_OASIS_NODE_ROOT_DIR"
CUSTOM_OASIS_NODE_ADDR="$CONFIG_OASIS_NODE_ADDR"
CUSTOM_OASIS_NODE_PORT="$CONFIG_OASIS_NODE_PORT"
CUSTOM_OASIS_NODE_SSH_NAME="$CONFIG_OASIS_NODE_SSH_NAME"
CUSTOM_OASIS_NODE_SSH_ADMIN_NAME="$CONFIG_OASIS_NODE_SSH_ADMIN_NAME"
CUSTOM_OASIS_NODE_SSH_ID="$CONFIG_OASIS_NODE_SSH_ID"
CUSTOM_PARATIME_WORKER_CLIENT_PORT="$CONFIG_PARATIME_WORKER_CLIENT_PORT"
CUSTOM_PARATIME_WORKER_P2P_PORT="$CONFIG_PARATIME_WORKER_P2P_PORT"
EOF

cat $CONFIG_NODE_DIR/node_config.sh

