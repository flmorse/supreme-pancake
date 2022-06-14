FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update -y
RUN apt-get install wget -y
RUN apt-get install systemd -y

RUN wget -q https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxAMDx64.tar.gz

RUN tar -xvzf Jackett.Binaries.LinuxAMDx64.tar.gz

COPY install_service_systemd.sh Jackett/install_service_systemd.sh

RUN chmod +x Jackett/install_service_systemd.sh

RUN cd Jackett && ./install_service_systemd.sh
