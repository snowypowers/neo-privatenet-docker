FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

RUN apt-get update && apt-get install -y wget unzip

WORKDIR /opt/projects

RUN git clone https://github.com/neo-project/neo-node.git
RUN dotnet publish -c Release ./neo-node/neo-cli -o /opt/app

RUN git clone https://github.com/neo-project/neo-modules.git
RUN dotnet publish -c Release ./neo-modules/src/RpcServer -o /opt/app/Plugins

# Publish all plugins
RUN for i in ./neo-modules/src/*/; do dotnet publish -c Release $i -o /opt/app/Plugins; done

# Assemble
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS assemble
RUN apt-get -y update && apt-get install -y libleveldb-dev sqlite3 libsqlite3-dev libunwind8-dev screen curl jq
WORKDIR /opt/app
COPY --from=build /opt/app .
COPY ./src/ .

FROM assemble AS final
WORKDIR /opt/app
# Perform initial wallet setup
RUN /opt/app/setup.sh
EXPOSE 20332-20334

# Run the cli on container startup
ENTRYPOINT ["screen","-DmS","node","dotnet","neo-cli.dll","-r"]
