#/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
. $SCRIPT_DIR/oasis_env.sh

DIFF=$(diff $CONFIG_NETWORK_DIR/network_config.sh $CONFIG_NETWORK_DIR/network_config_2.sh)
if [ "$DIFF" != "" ] 
then
	echo "New config for network"
	echo -n "$DIFF"
	echo
	read -p "Apply? " -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		echo "skip config"
	else
		echo "apply config"
	    	cp $CONFIG_NETWORK_DIR/network_config_2.sh $CONFIG_NETWORK_DIR/network_config.sh
	fi
fi

DIFF=$(diff $CONFIG_TYPE_DIR/type_config.sh $CONFIG_TYPE_DIR/type_config_2.sh)
if [ "$DIFF" != "" ] 
then
	echo "New config for type"
	echo -n "$DIFF"
	echo
	read -p "Apply? " -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		echo "skip config"
	else
		echo "apply config"
	    	cp $CONFIG_TYPE_DIR/type_config_2.sh $CONFIG_TYPE_DIR/type_config.sh
	fi
fi
