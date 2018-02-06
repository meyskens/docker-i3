FROM debian:stretch

RUN apt-get update && apt-get -y upgrade
# Set up i3
RUN apt-get -y install i3 rofi feh compton xinput i3status i3blocks
# Add my stuff
RUN apt-get install -y curl bash sudo gnome-terminal lxterminal vim
# Add Docker, because docker
RUN curl https://get.docker.com | bash

RUN adduser maartje
RUN sudo gpasswd -a maartje docker

COPY ./.i3/ /home/maartje/.i3
COPY ./.fonts /home/maartje/.fonts

USER maartje

CMD i3
