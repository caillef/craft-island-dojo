#!/bin/bash
#
# Execute this script being into `examples/spawn-and-move`.
# And then -> `./scripts/default_auth.sh`
#
set -euo pipefail
pushd $(dirname "$0")/..

export RPC_URL="http://localhost:5050";

export WORLD_ADDRESS=$(cat ./manifests/dev/manifest.json | jq -r '.world.address')

export ACTIONS_ADDRESS="0x5c70a663d6b48d8e4c6aaa9572e3735a732ac3765700d470463e670587852af"

echo "---------------------------------------------------------------------------"
echo world : $WORLD_ADDRESS 
echo " "
echo actions : $ACTIONS_ADDRESS
echo "---------------------------------------------------------------------------"

# List of the models.
MODELS=("Position" "Moves" "PlayerConfig" "Block" "Chunk")

AUTH_MODELS=""
# Give permission to the action system to write on all the models.
for component in ${MODELS[@]}; do
    AUTH_MODELS+="$component,$ACTIONS_ADDRESS "
done

sozo auth grant writer $AUTH_MODELS

echo "Default authorizations have been successfully set."
