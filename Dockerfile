FROM phusion/baseimage:master
#Update the BaseImage itself
LABEL Description="Container to run scdlbot in a Docker"

VOLUME /data
VOLUME /songs

#ENV DEEZER_ARL_COOCKIE="" \
ENV TG_BOT_TOKEN="" \
STORE_CHAT_ID=""\
AM_I_IN_A_DOCKER_CONTAINER=Yes

HEALTHCHECK --interval=1m CMD curl --fail http://ifconfig.io/ || exit 1
HEALTHCHECK --interval=1m CMD /etc/scripts/healthcheck.sh

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    git \
    ffmpeg \
    dnsutils \
    iputils-ping \
    python3.9* && \
    rm -rf /var/lib/apt/lists/*

# Generate enviorerment
#RUN mkdir /etc/service/bot && \
#    mkdir /data && \
#    mkdir /songs

# Set the deamon
ADD runbot.sh /etc/service/bot/run
#ADD importenv.sh /etc/my_init.d/
ADD scripts /etc/scripts/
ADD .env /data/

# Change python3 to python3.9
RUN cd /usr/bin && \
    rm -r python3 && \
    ln -s /usr/bin/python3.9 python3

# Install missing packages
#RUN pip3 install requests --upgrade && \
#    pip3 install urllib3 --upgrade && \
#    pip3 install six --upgrade && \
#    pip3 install git+https://github.com/kokarare1212/librespot-python
    
# Installing Bot
RUN pip3 install scdlbot
    
WORKDIR /data

# Compatability with https://hub.docker.com/r/willfarrell/autoheal/
LABEL autoheal=true

#use the remommended clean command
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
