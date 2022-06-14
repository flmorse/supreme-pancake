FROM ubuntu:20.04

WORKDIR /app
RUN apt-get update -y
RUN apt-get install wget -y

RUN cd /opt
RUN f=Jackett.Binaries.LinuxAMDx64.tar.gz
RUN release=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep "title>Release" | cut -d " " -f 4)
RUN wget -Nc https://github.com/Jackett/Jackett/releases/download/$release/Jackett.Binaries.LinuxAMDx64.tar.gz
RUN tar -xzf Jackett.Binaries.LinuxAMDx64.tar.gz
RUN rm -f Jackett.Binaries.LinuxAMDx64.tar.gz
RUN cd Jackett*
RUN ./install_service_systemd.sh
RUN systemctl status jackett.service
RUN cd -

CMD echo -e "\nVisit http://127.0.0.1:9117"
