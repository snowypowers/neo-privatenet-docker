#! /bin/bash

screen -d -m -S node dotnet neo-cli.dll
sleep 1
curl -d '{"jsonrpc": "2.0","method": "openwallet", "params": ["wallet.json","wallet"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332 | jq '.'
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep17balances",
    "params": ["NR4SHeS9kfgN5EXVcAuFwfu6Y56xaSPxg9"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332 | jq '.'

curl -d '
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
        ]],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332 | jq '.'

echo "tx sent"
sleep 5
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep17balances",
    "params": ["NPTmAHDxo6Pkyic8Nvu3kwyXoYJCvcCB6i"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332 | jq '.'

screen -S node -X quit
exit 0
