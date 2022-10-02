API="infura_api_for_polygon"

EXPLORER_SIX10=$(curl -s https://polygon-mainnet.infura.io/v3/${API} -X POST -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"eth_blockNumber","params": [],"id":1}' | jq ".result" | tr -
d '"') && \
EXPLORER_TEN10=$((16#${EXPLORER_SIX10:2})) && \
LOCAL_SIX10=$(curl -Ls -X POST 'http://127.0.0.1:31291' -H 'Content-Type: application/json' -d '{"jsonrpc": "2.0","method": "eth_blockNumber","params": [],"id": 1}' | jq ".result" | tr -d '"') && \
LOCAL_TEN10=$((16#${LOCAL_SIX10:2})) && \
echo -e "\nexplorer >>> ${EXPLORER_TEN10}.\nlocal >>>>>> ${LOCAL_TEN10}.\n"
