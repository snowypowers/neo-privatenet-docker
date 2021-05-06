#! /bin/bash

# Startup node
screen -d -m -S node dotnet neo-cli.dll
sleep 1

# Open wallet
curl -s -d '{"jsonrpc": "2.0","method": "openwallet", "params": ["wallet.json","wallet"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332 | jq '{"open wallet": .result}'

# Perform basic check for the origin account
curl -s -d '
{
    "jsonrpc": "2.0",
    "method": "getnep17balances",
    "params": ["NR4SHeS9kfgN5EXVcAuFwfu6Y56xaSPxg9"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332 | jq '{"basic check": .result}'

# Distribute funds to all other accounts
curl -s -d '
{
    "jsonrpc": "2.0",
    "method": "sendmany",
    "params": [
        "NR4SHeS9kfgN5EXVcAuFwfu6Y56xaSPxg9",
        [
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"10000",
                "address":"NPTmAHDxo6Pkyic8Nvu3kwyXoYJCvcCB6i"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"10000",
                "address":"NMBfzaEq2c5zodiNbLPoohVENARMbJim1r"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"10000",
                "address":"NfVdwyaJbijrWkRagrvs4eSRQUpP7WpukT"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"10000",
                "address":"NfScrtKDZFefNjVotBfrhEQR6GWhe8SXkH"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"10000",
                "address":"Nf586VLNQE3mnriHyNR7k2pTCHm9jenLtc"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"1000000000000",
                "address":"NPTmAHDxo6Pkyic8Nvu3kwyXoYJCvcCB6i"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"1000000000000",
                "address":"NMBfzaEq2c5zodiNbLPoohVENARMbJim1r"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"1000000000000",
                "address":"NfVdwyaJbijrWkRagrvs4eSRQUpP7WpukT"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"1000000000000",
                "address":"NfScrtKDZFefNjVotBfrhEQR6GWhe8SXkH"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"1000000000000",
                "address":"Nf586VLNQE3mnriHyNR7k2pTCHm9jenLtc"
            }
        ]],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332 | jq '{"distribute funds": .result}'

sleep 2

# Register a candidate
curl -s -d '{
    "jsonrpc": "2.0",
    "method": "invokefunction",
    "params": [
        "ef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
        "registerCandidate",
        [
            {
                "type": "PublicKey",
                "value": "02028a99826edc0c97d18e22b6932373d908d323aa7f92656a77ec26e8861699ef"
            }
        ],
        [
            {
                "account": "118ba6f59931a56ec469770f7fc790ece96df00d",
                "scopes": "CalledByEntry"
            },
            {
                "account": "a7cbfee3f01f89d58c042644b0b6df2d59a6eb26",
                "scopes": "CalledByEntry"
            }
        ]
    ],
    "id": 3
}' -H 'Content-Type: application/json' http://localhost:20332 |
    jq '{"jsonrpc": "2.0","method": "sendrawtransaction","params": [.result.tx],"id": 3 }' |
    curl -s -H 'Content-Type: application/json' 'http://localhost:20332' -d@- |
    jq '{"register candidate": .result}'

sleep 2

# Final check for all accounts
cat ./wallet.json |
    jq '[.accounts[].address | { "jsonrpc": "2.0","method": "getnep17balances", "params": [.],  "id": 3}]' |
    curl -s -H 'Content-Type: application/json' 'http://localhost:20332' -d@- |
    jq '.[]|.result'

# Stop the node here. We will rely on Docker to restart it.
screen -S node -X quit
exit 0
