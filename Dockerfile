FROM linuxserver/baseimage

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>

ENV BASE_APTLIST="build-essential git-core libssl-dev nodejs"

# install packages
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
apt-get install $BASE_APTLIST -qy && \
npm install -g npm@latest && \

# cleanup 
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD 21.update_npm.sh /etc/my_init.d/
RUN chmod +x -v /etc/my_init.d/*.sh
