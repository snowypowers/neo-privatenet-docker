#! /bin/bash

screen -d -m -S node dotnet neo-cli.dll
sleep 1
curl -d '{"jsonrpc": "2.0","method": "openwallet", "params": ["wallet.json","wallet"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep17balances",
    "params": ["NhxvE7rd27zdz3qTUdaBGpeckzd26VJHZr"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332

curl -d '
{
    "jsonrpc": "2.0",
    "method": "sendmany",
    "params": [
        "NhxvE7rd27zdz3qTUdaBGpeckzd26VJHZr",
        [
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"1000",
                "address":"NQrEVKgpx2qEg6DpVMT5H8kFa7kc2DFgqS"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"1000",
                "address":"NYaVsrMV9GS8aaspRS4odXf1WHZdMmJiPC"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"1000",
                "address":"NWcpK2143ZjgzDYyQJhoKrodJUymHTxPzR"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"1000",
                "address":"Ni8Dw2zt7nGidkvwr55vssvG2R7JAEXsBM"
            },
            {
                "asset":"0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5",
                "value":"1000",
                "address":"NYvLBq6UtdvQnqLWog2Vtgf6AY4D6M1Kim"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"100000000000",
                "address":"NQrEVKgpx2qEg6DpVMT5H8kFa7kc2DFgqS"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"100000000000",
                "address":"NYaVsrMV9GS8aaspRS4odXf1WHZdMmJiPC"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"100000000000",
                "address":"NWcpK2143ZjgzDYyQJhoKrodJUymHTxPzR"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"100000000000",
                "address":"Ni8Dw2zt7nGidkvwr55vssvG2R7JAEXsBM"
            },
            {
                "asset":"0xd2a4cff31913016155e38e474a2c06d08be276cf",
                "value":"100000000000",
                "address":"NYvLBq6UtdvQnqLWog2Vtgf6AY4D6M1Kim"
            }
        ]],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332

echo "tx sent"
sleep 5
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep17balances",
    "params": ["NQrEVKgpx2qEg6DpVMT5H8kFa7kc2DFgqS"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332

screen -S node -X quit
exit 0
