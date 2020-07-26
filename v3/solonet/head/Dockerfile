FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS Build

RUN apt-get -y update && apt-get install -y git
WORKDIR /opt/mono
COPY ./.config/ ./switcher.json ./
RUN git clone https://github.com/neo-project/neo-vm.git
RUN git clone -b preview3 https://github.com/neo-project/neo.git
RUN git clone https://github.com/neo-project/neo-modules.git
RUN git clone https://github.com/neo-project/neo-node.git

RUN dotnet tool restore
RUN dotnet new sln
RUN dotnet sln add ./neo/src/neo/neo.csproj ./neo-vm/src/neo-vm/neo-vm.csproj ./neo-node/neo-cli/neo-cli.csproj ./neo-modules/src/RpcNep5Tracker/RpcNep5Tracker.csproj ./neo-modules/src/RpcServer/RpcServer.csproj
RUN dotnet --info
RUN dotnet dnt switch-to-projects switcher.json

RUN dotnet publish -c Release ./neo-node/neo-cli/neo-cli.csproj -o ./app
RUN dotnet publish -c Release ./neo-modules/src/RpcNep5Tracker/RpcNep5Tracker.csproj -o ./tmp

RUN mkdir ./app/Plugins
RUN cp -r ./tmp/RpcServer ./tmp/RpcServer.dll ./tmp/RpcNep5Tracker ./tmp/RpcNep5Tracker.dll ./tmp/LevelDBStore ./tmp/LevelDBStore.dll ./app/Plugins
RUN cp -r ./app /opt/neo-cli

FROM mcr.microsoft.com/dotnet/core/runtime:3.1 AS Assemble

RUN apt-get -y update && apt-get install -y libleveldb-dev sqlite3 libsqlite3-dev libunwind8-dev screen

WORKDIR /opt/neo-cli
COPY --from=Build /opt/neo-cli .
COPY ./src/ .
EXPOSE 20332-20334

FROM Assemble AS Final
WORKDIR /opt/neo-cli
# Perform initial wallet setup
RUN /opt/neo-cli/setup.sh

# Run the cli on container startup
ENTRYPOINT ["screen","-DmS","node","dotnet","neo-cli.dll","-r"]