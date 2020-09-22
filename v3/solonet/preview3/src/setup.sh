#! /bin/bash

screen -d -m -S node dotnet neo-cli.dll
sleep 1
curl -d '{"jsonrpc": "2.0","method": "openwallet", "params": ["wallet.json","wallet"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep5balances",
    "params": ["NZCbeSDnadGsacF69zVvfaB4zDKMioMHJV"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332

curl -d '
{
    "jsonrpc": "2.0",
    "method": "sendmany",
    "params": [
        "NZCbeSDnadGsacF69zVvfaB4zDKMioMHJV",
        [
            {
                "asset":"0xde5f57d430d3dece511cf975a8d37848cb9e0525",
                "value":"1000",
                "address":"NNWAo5vdVJz1oyCuNiaTBA3amBHnWCF4Yk"
            },
            {
                "asset":"0xde5f57d430d3dece511cf975a8d37848cb9e0525",
                "value":"1000",
                "address":"NiwvMyWYeNghLG8tDyKkWwuZV3wS8CPrrV"
            },
            {
                "asset":"0xde5f57d430d3dece511cf975a8d37848cb9e0525",
                "value":"1000",
                "address":"NTWHAzB82LRGWNuuqjVyyzpGvF3WxbbPoG"
            },
            {
                "asset":"0xde5f57d430d3dece511cf975a8d37848cb9e0525",
                "value":"1000",
                "address":"NSyfwYL3LUNgjiiXDZBi9SDYh5eoe5DA71"
            },
            {
                "asset":"0xde5f57d430d3dece511cf975a8d37848cb9e0525",
                "value":"1000",
                "address":"NZcX6tJCGQreJbNZXewMC9TcKaa5LRsNJx"
            },
            {
                "asset":"0x668e0c1f9d7b70a99dd9e06eadd4c784d641afbc",
                "value":"1000",
                "address":"NNWAo5vdVJz1oyCuNiaTBA3amBHnWCF4Yk"
            },
            {
                "asset":"0x668e0c1f9d7b70a99dd9e06eadd4c784d641afbc",
                "value":"1000",
                "address":"NiwvMyWYeNghLG8tDyKkWwuZV3wS8CPrrV"
            },
            {
                "asset":"0x668e0c1f9d7b70a99dd9e06eadd4c784d641afbc",
                "value":"1000",
                "address":"NTWHAzB82LRGWNuuqjVyyzpGvF3WxbbPoG"
            },
            {
                "asset":"0x668e0c1f9d7b70a99dd9e06eadd4c784d641afbc",
                "value":"1000",
                "address":"NSyfwYL3LUNgjiiXDZBi9SDYh5eoe5DA71"
            },
            {
                "asset":"0x668e0c1f9d7b70a99dd9e06eadd4c784d641afbc",
                "value":"1000",
                "address":"NZcX6tJCGQreJbNZXewMC9TcKaa5LRsNJx"
            }
        ]],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332

echo "tx sent"
sleep 5
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep5balances",
    "params": ["NNWAo5vdVJz1oyCuNiaTBA3amBHnWCF4Yk"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332

screen -S node -X quit
exit 0
