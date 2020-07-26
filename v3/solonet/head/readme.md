
# Build
```sh
docker build -t v3-solonet:head .
docker create --name solonet_head -p 20332-20334:20332-20334 v3-solonet:head
docker start solonet_head
```
# Operation

Port 20332 is the RpcServer. Go ham.

RpcServer and RpcNep5Tracker is installed and will be your main way of interacting with the server.

Blocktime has been reduced to 2s to speed up testing.

## Bootstrap commands
This set of commands bootstraps a few addresses with neo.
```
 curl -d '{"jsonrpc": "2.0","method": "openwallet", "params": ["wallet.json","wallet"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
curl -d '{"jsonrpc": "2.0", "method": "sendmany", "params": ["NePKgynuBvFdRYAiiY1nt7q7gnn8st7E4b", [{"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NPAMBaHW6RU9Kn3PhGg7WxjMEJNdpukdUo"}, {"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NMPAXGtMfZ8s8rcfP9JhrYrNeZHG4xSVmd"}, {"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NRC6oteucWYXq7aASD6YWe5rNeXAw1ehye"}, {"asset":"0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789", "value":"1000", "address":"NTFAwXLGoiWwSMP5vJyZp8K4cBFwrzUs8m"}, {"asset":"0x8c23f196d8a1bfd103a9dcb1f9ccf0c611377d3b", "value":"1000", "address":"NPAMBaHW6RU9Kn3PhGg7WxjMEJNdpukdUo"}, {"asset":"0x8c23f196d8a1bfd103a9dcb1f9ccf0c611377d3b", "value":"1000", "address":"NMPAXGtMfZ8s8rcfP9JhrYrNeZHG4xSVmd"}, {"asset":"0x8c23f196d8a1bfd103a9dcb1f9ccf0c611377d3b", "value":"1000", "address":"NRC6oteucWYXq7aASD6YWe5rNeXAw1ehye"}, {"asset":"0x8c23f196d8a1bfd103a9dcb1f9ccf0c611377d3b", "value":"1000", "address":"NTFAwXLGoiWwSMP5vJyZp8K4cBFwrzUs8m"}] ],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332

```

Take a look:
```
 curl -d '{"jsonrpc": "2.0","method": "getnep5balances", "params": ["NePKgynuBvFdRYAiiY1nt7q7gnn8st7E4b"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
```

neo: 0x9bde8f209c88dd0e7ca3bf0af0f476cdd8207789
gas: 0x8c23f196d8a1bfd103a9dcb1f9ccf0c611377d3b

# Debug
To manually go into the docker container and see what is inside:
```
docker exec -it solonet_head /bin/bash
screen -r node
```