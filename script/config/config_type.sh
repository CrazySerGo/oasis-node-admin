#/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
. $SCRIPT_DIR/oasis_env.sh

CONFIG_VALUE=""

echo "Custom core version? y/N"
read READ_VALUE

if [ "$READ_VALUE" = "y" ] ; then

config_value "OASIS_CORE_VERSION ex: 21.3.3" "$OASIS_CORE_VERSION"
CONFIG_OASIS_CORE_VERSION="$CONFIG_VALUE"

config_value "OASIS_GENESIS_URL ex: https://github.com/oasisprotocol/testnet-artifacts/releases/download/2021-04-13/genesis.json" "$OASIS_GENESIS_URL"
CONFIG_OASIS_GENESIS_URL="$CONFIG_VALUE"

config_value "OASIS_SEED_NODE ex: 05EAC99BB37F6DAAD4B13386FF5E087ACBDDC450@34.86.165.6:26656" "$OASIS_SEED_NODE"
CONFIG_OASIS_SEED_NODE="$CONFIG_VALUE"

mkdir -p $CONFIG_TYPE_DIR
cat >$CONFIG_TYPE_DIR/type_config.sh << EOF
CUSTOM_OASIS_CORE_VERSION="$CONFIG_OASIS_CORE_VERSION"
CUSTOM_OASIS_GENESIS_URL="$CONFIG_OASIS_GENESIS_URL"
CUSTOM_OASIS_SEED_NODE="$CONFIG_OASIS_SEED_NODE"
EOF

else

mkdir -p $CONFIG_TYPE_DIR
cat >$CONFIG_TYPE_DIR/type_config.sh << EOF
EOF

fi

echo "Custom error check? y/N"
read READ_VALUE

if [ "$READ_VALUE" = "y" ] ; then

config_value "LATEST_TIME_ERROR ex: 120" "$LATEST_TIME_ERROR"
CONFIG_LATEST_TIME_ERROR="$CONFIG_VALUE"

mkdir -p $CONFIG_TYPE_DIR
cat >>$CONFIG_TYPE_DIR/type_config.sh << EOF
CUSTOM_LATEST_TIME_ERROR="$CONFIG_LATEST_TIME_ERROR"
EOF

fi

echo "Is paratime? y/N"
read READ_VALUE

if [ "$READ_VALUE" = "y" ] ; then

config_value "PARATIME_RUNTIME_IDENTIFIER ex: 000000000000000000000000000000000000000000000000e199119c992377cb" "$PARATIME_RUNTIME_IDENTIFIER"
CONFIG_PARATIME_RUNTIME_IDENTIFIER="$CONFIG_VALUE"

config_value "PARATIME_RUNTIME_VERSION ex: 1.0.0" "$PARATIME_RUNTIME_VERSION"
CONFIG_PARATIME_RUNTIME_VERSION="$CONFIG_VALUE"

config_value "PARATIME_RUNTIME_VERSION_OLD ex: 1.0.0" "$PARATIME_RUNTIME_VERSION_OLD"
CONFIG_PARATIME_RUNTIME_VERSION_OLD="$CONFIG_VALUE"

cat >>$CONFIG_TYPE_DIR/type_config.sh << EOF
CUSTOM_PARATIME_RUNTIME_IDENTIFIER="$CONFIG_PARATIME_RUNTIME_IDENTIFIER"
CUSTOM_PARATIME_RUNTIME_VERSION="$CONFIG_PARATIME_RUNTIME_VERSION"
CUSTOM_PARATIME_RUNTIME_VERSION_OLD="$CONFIG_PARATIME_RUNTIME_VERSION_OLD"
EOF

echo "Is paratime SGX? y/N"
read READ_VALUE

if [ "$READ_VALUE" = "y" ] ; then

config_value "PARATIME_RUNTIME_SGSX ex: https://github.com/oasisprotocol/cipher-paratime/releases/download/v1.0.0/cipher-paratime.sgxs" "$PARATIME_RUNTIME_SGSX"
CONFIG_PARATIME_RUNTIME_SGSX="$CONFIG_VALUE"

config_value "PARATIME_RUNTIME_SIG ex: https://github.com/oasisprotocol/cipher-paratime/releases/download/v1.0.0/cipher-paratime.sig" "$PARATIME_RUNTIME_SIG"
CONFIG_PARATIME_RUNTIME_SIG="$CONFIG_VALUE"

config_value "PARATIME_RUNTIME_IAS ex: tnTwXvGbbxqlFoirBDj63xWtZHS20Lb3fCURv0YDtYw=@34.86.108.137:8650" "$PARATIME_RUNTIME_IAS"
CONFIG_PARATIME_RUNTIME_IAS="$CONFIG_VALUE"

cat >>$CONFIG_TYPE_DIR/type_config.sh << EOF
CUSTOM_PARATIME_RUNTIME_SGSX="$CONFIG_PARATIME_RUNTIME_SGSX"
CUSTOM_PARATIME_RUNTIME_SIG="$CONFIG_PARATIME_RUNTIME_SIG"
CUSTOM_PARATIME_RUNTIME_IAS="$CONFIG_PARATIME_RUNTIME_IAS"
EOF

fi

fi

cat $CONFIG_TYPE_DIR/type_config.sh


