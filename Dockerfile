FROM emiketic/essentials:latest

RUN \
    apk add --no-cache --update \
        build-base \
        python2 py2-pip \
        php7 \
        nodejs npm \
        go \
 && pip install --upgrade pip \
 && npm -g install npm \
;

RUN \
    git clone git://github.com/apiaryio/drafter.git \
 && cd ./drafter \
 && git checkout v0.1.9 \
 && git submodule update --init --recursive \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm -fr ./drafter \
;

RUN \
    wget https://github.com/pixelfusion/blueman/releases/download/1.3.1/blueman.phar -O /usr/local/bin/blueman \
 && chmod u+x /usr/local/bin/blueman \
;

RUN pip install apiary2postman

RUN \
    wget https://github.com/bukalapak/snowboard/releases/download/v1.7.0/snowboard-v1.7.0.linux-amd64.tar.gz -O snowboard.tar.gz \
 && tar -zxvf snowboard.tar.gz \
 && cp ./snowboard /usr/local/bin/snowboard \
 && rm -f snowboard* \
;

RUN npm install -g --unsafe-perm aglio

RUN rm -fr ~/.cache/pip && npm cache clean -f
