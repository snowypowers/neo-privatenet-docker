FROM mcr.microsoft.com/dotnet/core/runtime:2.1

RUN apt-get -y update && apt-get install -y wget unzip libleveldb-dev sqlite3 libsqlite3-dev libunwind8-dev screen
WORKDIR /opt/neo-cli
# TODO: replace with shell script for getting specified release tag
RUN wget -q -O cli.zip https://github.com/neo-project/neo-node/releases/download/v3.0.0-preview2/neo-cli-linux-x64.zip
RUN unzip -q -d /opt/ cli.zip && rm cli.zip

RUN wget -q -O rpcserver.zip https://github.com/neo-project/neo-modules/releases/download/v3.0.0-preview2-00/RpcServer.zip
RUN unzip -q -d /opt/neo-cli rpcserver.zip && rm rpcserver.zip

RUN wget -q -O nep5.zip https://github.com/neo-project/neo-modules/releases/download/v3.0.0-preview2-00/RpcNep5Tracker.zip
RUN unzip -q -d /opt/neo-cli nep5.zip && rm nep5.zip

COPY ./src/ /opt/neo-cli/

EXPOSE 20332-20334

# Perform initial wallet setup
RUN /opt/neo-cli/setup.sh

# Run the cli on container startup
ENTRYPOINT ["screen","-DmS","node","dotnet","neo-cli.dll","-r"]
# TODO: Find out what is causing this cmd to always exit.
# ENTRYPOINT ["dotnet", "/opt/neo-cli/neo-cli.dll"]