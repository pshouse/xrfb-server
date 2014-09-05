FROM ubuntu

RUN add-apt-repository ppa:upubuntu-com/office 
RUN apt-get update
RUN apt-get -y install unzip wget python
RUN apt-get -y install gnome 
RUN apt-get -y install libxrandr2:i386 libxinerama1:i386
RUN apt-get -y install openoffice
RUN apt-get -y install firefox
RUN apt-get -y install vnc4server
RUN apt-get -y install xvnc

RUN adduser guest

WORKDIR /home/guest

RUN su guest

RUN wget http://boycenet.net/cobalt/XrfbFolder.zip

RUN unzip XrfbFolder.zip

RUN mv XrfbFolder/*

EXPOSE 5899

CMD ["nohup", "XrfbServer.py"]
