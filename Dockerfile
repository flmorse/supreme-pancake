FROM ubuntu:20.04

WORKDIR /app

RUN cd /opt
RUN f=Jackett.Binaries.LinuxAMDx64.tar.gz
RUN release=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep "title>Release" | cut -d " " -f 4)
RUN wget -Nc https://github.com/Jackett/Jackett/releases/download/$release/"$f"
RUN tar -xzf "$f"
RUN rm -f "$f"
RUN cd Jackett*
RUN ./install_service_systemd.sh
RUN systemctl status jackett.service
RUN cd -

CMD echo -e "\nVisit http://127.0.0.1:9117"
