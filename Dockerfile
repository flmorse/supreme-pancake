FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update -y
RUN apt-get install wget -y

RUN wget -q https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxAMDx64.tar.gz

RUN tar -xvzf Jackett.Binaries.LinuxAMDx64.tar.gz && cd Jackett

RUN ls && ls && ls && ls && ls

RUN ./install_service_systemd.sh
