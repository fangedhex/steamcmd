FROM debian:stretch-slim
# SteamCMD installation
RUN apt-get update && apt-get install -y curl lib32gcc1 \
&& mkdir steam \
&& cd steam \
&& curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - \
&& apt-get remove -y curl && rm -rf /var/lib/apt/lists/* \
&& /steam/steamcmd.sh +exit
ADD boot.sh /
CMD ["/boot.sh"]
