#!/bin/sh

GETH_PARAMETERS="--nodiscover --maxpeers=0 --rpc --rpcapi=${TESTNODE_RPC_API} --rpcport=${TESTNODE_RPC_PORT} --rpccorsdomain='*' --rpcaddr=${TESTNODE_RPC_ADDRESS} --port 30303 --identity=${TESTNODE_IDENTITY} --verbosity=${TESTNODE_VERBOSITY}"

if [[ "${TESTNODE_MINING}" = true ]]; then
	if [[ -z "${TESTNODE_MINING_THREADS}" ]]; then
		echo "No TESTNODE_MINING_THREADS environment variable set, setting it to 1"	
		TESTNODE_MINING_THREADS=1
	fi

	GETH_PARAMETERS="${GETH_PARAMETERS} --mine --minerthreads ${TESTNODE_MINING_THREADS}"
fi


#echo "Initializing..."
#/geth init /genesis.json
echo "Starting node"
/geth ${GETH_PARAMETERS}

