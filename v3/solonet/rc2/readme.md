
# Build
```sh
docker build -t v3-solonet:rc2 .
docker create --name solonet_rc2 -p 20332-20334:20332-20334 v3-solonet:rc2
docker start solonet_rc1
```

# Operation

Port 20332 is the RpcServer. Go ham.

RpcServer and RpcNep5Tracker is installed and will be your main way of interacting with the server.

Blocktime has been reduced to 1s to speed up testing.

## Bootstrap commands
See `src/setup.sh` for the commands to setup the node.

Take a look:
```
 curl -d '{"jsonrpc": "2.0","method": "getnep17balances", "params": ["NPTmAHDxo6Pkyic8Nvu3kwyXoYJCvcCB6i"],"id": 3}' -H 'Content-Type: application/json' http://localhost:20332
```

neo: 0xef4073a0f2b305a38ec4050e4d3d28bc40ea63f5
gas: 0xd2a4cff31913016155e38e474a2c06d08be276cf


# Debug
To manually go into the docker container and see what is inside:
```
docker exec -it solonet_rc1 /bin/bash
screen -r node
```