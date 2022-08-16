#/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
. $SCRIPT_DIR/oasis_env.sh

. $SCRIPT_DIR/chain_info/network_parameter.sh

config_auto_value () {
	
	if [ "$2" != "$3" ] ; then 
		CONFIG_VALUE="$3"
		echo "$1 $2 => $3"
	else
		#echo "$1 $2"
		CONFIG_VALUE="$2"
	fi

}

if [[ "$NETWORK_PARAMETER_CORE_VERSION" != "22."* ]]; then
	echo skip because core version is not 22
	exit 1
fi

config_auto_value "OASIS_CORE_VERSION" "$OASIS_CORE_VERSION" "$NETWORK_PARAMETER_CORE_VERSION"
CONFIG_OASIS_CORE_VERSION="$CONFIG_VALUE"

config_auto_value "OASIS_GENESIS_URL" "$OASIS_GENESIS_URL" "$NETWORK_PARAMETER_GENESIS"
CONFIG_OASIS_GENESIS_URL="$CONFIG_VALUE"

config_auto_value "OASIS_SEED_NODE" "$OASIS_SEED_NODE" "$NETWORK_PARAMETER_SEED"
CONFIG_OASIS_SEED_NODE="$CONFIG_VALUE"

mkdir -p $CONFIG_NETWORK_DIR

cat >$CONFIG_NETWORK_DIR/network_config_2.sh << EOF
CUSTOM_OASIS_CORE_VERSION="$CONFIG_OASIS_CORE_VERSION"
CUSTOM_OASIS_GENESIS_URL="$CONFIG_OASIS_GENESIS_URL"
CUSTOM_OASIS_SEED_NODE="$CONFIG_OASIS_SEED_NODE"
EOF

#echo
#echo "Network config"
#cat $CONFIG_NETWORK_DIR/network_config_2.sh

. $SCRIPT_DIR/oasis_env.sh

config_auto_value "OASIS_CORE_VERSION_PARATIME" "$OASIS_CORE_VERSION" "$NETWORK_PARAMETER_CORE_VERSION"
if [[ "$CONFIG_VALUE" != "$CUSTOM_OASIS_CORE_VERSION" ]]; then
	CONFIG_OASIS_PARATIME_CORE_VERSION_PARATIME="$CONFIG_VALUE"
fi

config_auto_value "PARATIME_RUNTIME_VERSION" "$PARATIME_RUNTIME_VERSION" "$NETWORK_PARAMETER_PARATIME_VERSION"
CONFIG_PARATIME_RUNTIME_VERSION="$CONFIG_VALUE"

if [[ "$PARATIME_RUNTIME_VERSION" != "$NETWORK_PARAMETER_PARATIME_VERSION" ]]; then
	config_auto_value "PARATIME_RUNTIME_VERSION_OLD" "$PARATIME_RUNTIME_VERSION_OLD" "$PARATIME_RUNTIME_VERSION"
	CONFIG_PARATIME_RUNTIME_VERSION_OLD="$CONFIG_VALUE"

else
	CONFIG_PARATIME_RUNTIME_VERSION_OLD=$PARATIME_RUNTIME_VERSION_OLD

fi

config_auto_value "PARATIME_RUNTIME_IDENTIFIER" "$PARATIME_RUNTIME_IDENTIFIER" "$NETWORK_PARAMETER_RUNTIME_IDENTIFIER"
CONFIG_PARATIME_RUNTIME_IDENTIFIER="$CONFIG_VALUE"

config_auto_value "PARATIME_RUNTIME_IAS" "$PARATIME_RUNTIME_IAS" "$NETWORK_PARAMETER_IAS"
CONFIG_PARATIME_RUNTIME_IAS="$CONFIG_VALUE"


mkdir -p $CONFIG_TYPE_DIR

cat >$CONFIG_TYPE_DIR/type_config_2.sh << EOF
CUSTOM_OASIS_PARATIME_CORE_VERSION="$CONFIG_OASIS_PARATIME_CORE_VERSION"
CUSTOM_PARATIME_RUNTIME_IDENTIFIER="$CONFIG_PARATIME_RUNTIME_IDENTIFIER"
CUSTOM_PARATIME_RUNTIME_VERSION="$CONFIG_PARATIME_RUNTIME_VERSION"
CUSTOM_PARATIME_RUNTIME_VERSION_OLD="$CONFIG_PARATIME_RUNTIME_VERSION_OLD"
CUSTOM_PARATIME_RUNTIME_IAS="$CONFIG_PARATIME_RUNTIME_IAS"
EOF

#echo
#echo "Type config"

#cat $CONFIG_TYPE_DIR/type_config_2.sh

