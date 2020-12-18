
# Build
```sh
docker build -t v3-solonet:preview4 .
docker create --name solonet_p4 -p 20332-20334:20332-20334 v3-solonet:preview4
docker start solonet_p4
```

# Operation

Port 20332 is the RpcServer. Go ham.

RpcServer and RpcNep5Tracker is installed and will be your main way of interacting with the server.

Blocktime has been reduced to 2s to speed up testing.

## Bootstrap commands
See `src/setup.sh` for the commands to setup the node.

Take a look:
```
 curl -d '{"jsonrpc": "2.0","method": "getnep17balances", "params": ["NePKgynuBvFdRYAiiY1nt7q7gnn8st7E4b"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
```

neo: 0xde5f57d430d3dece511cf975a8d37848cb9e0525
gas: 0x668e0c1f9d7b70a99dd9e06eadd4c784d641afbc

# Debug
To manually go into the docker container and see what is inside:
```
docker exec -it solonet_p3 /bin/bash
screen -r node
```