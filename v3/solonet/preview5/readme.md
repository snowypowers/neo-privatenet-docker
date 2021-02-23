
# Build
```sh
docker build -t v3-solonet:preview5 .
docker create --name solonet_p5 -p 20332-20334:20332-20334 v3-solonet:preview4
docker start solonet_p5
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

neo: 0xf61eebf573ea36593fd43aa150c055ad7906ab83
gas: 0x70e2301955bf1e74cbb31d18c2f96972abadb328

# Debug
To manually go into the docker container and see what is inside:
```
docker exec -it solonet_p5 /bin/bash
screen -r node
```