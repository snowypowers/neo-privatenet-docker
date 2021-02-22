#! /bin/bash

screen -d -m -S node dotnet neo-cli.dll
sleep 1
curl -d '{"jsonrpc": "2.0","method": "openwallet", "params": ["wallet.json","wallet"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep17balances",
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
                "asset":"0xf61eebf573ea36593fd43aa150c055ad7906ab83",
                "value":"1000",
                "address":"NNWAo5vdVJz1oyCuNiaTBA3amBHnWCF4Yk"
            },
            {
                "asset":"0xf61eebf573ea36593fd43aa150c055ad7906ab83",
                "value":"1000",
                "address":"NiwvMyWYeNghLG8tDyKkWwuZV3wS8CPrrV"
            },
            {
                "asset":"0xf61eebf573ea36593fd43aa150c055ad7906ab83",
                "value":"1000",
                "address":"NTWHAzB82LRGWNuuqjVyyzpGvF3WxbbPoG"
            },
            {
                "asset":"0xf61eebf573ea36593fd43aa150c055ad7906ab83",
                "value":"1000",
                "address":"NSyfwYL3LUNgjiiXDZBi9SDYh5eoe5DA71"
            },
            {
                "asset":"0xf61eebf573ea36593fd43aa150c055ad7906ab83",
                "value":"1000",
                "address":"NZcX6tJCGQreJbNZXewMC9TcKaa5LRsNJx"
            },
            {
                "asset":"0x70e2301955bf1e74cbb31d18c2f96972abadb328",
                "value":"1000",
                "address":"NNWAo5vdVJz1oyCuNiaTBA3amBHnWCF4Yk"
            },
            {
                "asset":"0x70e2301955bf1e74cbb31d18c2f96972abadb328",
                "value":"1000",
                "address":"NiwvMyWYeNghLG8tDyKkWwuZV3wS8CPrrV"
            },
            {
                "asset":"0x70e2301955bf1e74cbb31d18c2f96972abadb328",
                "value":"1000",
                "address":"NTWHAzB82LRGWNuuqjVyyzpGvF3WxbbPoG"
            },
            {
                "asset":"0x70e2301955bf1e74cbb31d18c2f96972abadb328",
                "value":"1000",
                "address":"NSyfwYL3LUNgjiiXDZBi9SDYh5eoe5DA71"
            },
            {
                "asset":"0x70e2301955bf1e74cbb31d18c2f96972abadb328",
                "value":"1000",
                "address":"NZcX6tJCGQreJbNZXewMC9TcKaa5LRsNJx"
            }
        ]],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332

echo "tx sent"
sleep 5
curl -d '
{
    "jsonrpc": "2.0",
    "method": "getnep17balances",
    "params": ["NNWAo5vdVJz1oyCuNiaTBA3amBHnWCF4Yk"],
    "id": 3}' -H 'Content-Type: application/json' http://localhost:20332

screen -S node -X quit
exit 0
