FROM mcr.microsoft.com/dotnet/runtime:6.0

WORKDIR /tshock

COPY scripts scripts
RUN chmod +x scripts/start_tshock.sh

RUN apt-get update && apt-get install -y wget unzip

RUN wget -O tshock.zip https://github.com/Pryaxis/TShock/releases/download/v5.2.0/TShock-5.2-for-Terraria-1.4.4.9-linux-arm64-Release.zip
RUN unzip tshock.zip
RUN tar xvf TShock-Beta-linux-arm64-Release.tar
RUN rm -f tshock.zip TShock-Beta-linux-arm64-Release.tar

EXPOSE $PORT

ENTRYPOINT [ "./scripts/start_tshock.sh" ]