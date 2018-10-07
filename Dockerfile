FROM arm32v7/ubuntu:latest

MAINTAINER Prashant Gupta <prashantgupta2609@gmail.com>

RUN apt update

RUN apt install -y syncthing
RUN useradd -m -b /home syncthing

RUN mkdir /home/syncthing/syncthing_data
ADD ./config.xml /home/syncthing/.config/syncthing/config.xml

RUN chown -Rv syncthing /home/syncthing

USER syncthing

ENTRYPOINT ["syncthing"]
