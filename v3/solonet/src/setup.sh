#! /bin/bash

screen -d -m -S node dotnet neo-cli.dll
sleep 1
curl -d '{"jsonrpc": "2.0","method": "openwallet", "params": ["wallet.json","wallet"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
curl -d '{"jsonrpc": "2.0","method": "sendmany", "params": ["NePKgynuBvFdRYAiiY1nt7q7gnn8st7E4b",[{"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NPAMBaHW6RU9Kn3PhGg7WxjMEJNdpukdUo"},{"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NMPAXGtMfZ8s8rcfP9JhrYrNeZHG4xSVmd"},{"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NRC6oteucWYXq7aASD6YWe5rNeXAw1ehye"}, {"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NTFAwXLGoiWwSMP5vJyZp8K4cBFwrzUs8m"}]],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
echo "tx sent"
sleep 5
curl -d '{"jsonrpc": "2.0","method": "getnep5balances", "params": ["NPAMBaHW6RU9Kn3PhGg7WxjMEJNdpukdUo"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
screen -S node -X quit
exit 0
