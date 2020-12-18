FROM mcr.microsoft.com/dotnet/runtime:3.1 AS Build

RUN apt-get update && apt-get install -y wget unzip
WORKDIR /opt/neo-cli
# TODO: replace with shell script for getting specified release tag
RUN wget -q -O cli.zip https://github.com/neo-project/neo-node/releases/download/v3.0.0-preview3/neo-cli-linux-x64.zip
RUN unzip -q -d /opt/neo-cli cli.zip && rm cli.zip

# For preview3, the release is inside an extra linux-x64/ folder...
RUN mv linux-x64/* . && rm -r linux-x64/ && ls

RUN wget -q -O rpcserver.zip https://github.com/neo-project/neo-modules/releases/download/v3.0.0-preview3-00/RpcServer.zip
RUN unzip -q -d /opt/neo-cli rpcserver.zip && rm rpcserver.zip

RUN wget -q -O nep5.zip https://github.com/neo-project/neo-modules/releases/download/v3.0.0-preview3-00/RpcNep5Tracker.zip
RUN unzip -q -d /opt/neo-cli nep5.zip && rm nep5.zip



FROM mcr.microsoft.com/dotnet/runtime:3.1 AS Assemble
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