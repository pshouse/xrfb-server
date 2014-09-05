FROM ubuntu

RUN apt-get update
RUN apt-get -y install unzip wget gnome openoffice.org firefox vnc4server xvnc python

RUN adduser guest

WORKDIR /home/guest

RUN su guest

RUN wget http://boycenet.net/cobalt/XrfbFolder.zip

RUN unzip XrfbFolder.zip

RUN mv XrfbFolder/*

EXPOSE 5899

CMD ["nohup", "XrfbServer.py"]
