FROM emiketic/essentials:latest

RUN \
    apk add --no-cache --update \
        build-base \
        python2 py2-pip \
        php7 \
        nodejs npm \
 && pip install --upgrade pip \
 && npm -g install npm \
;

RUN \
    git clone --recursive git://github.com/apiaryio/drafter.git \
 && cd ./drafter \
 && ./configure \
 && make test \
 && make drafter \
 && make install \
 && cd .. \
 && rm -fr ./drafter \
;

RUN \
    pip install apiary2postman \
 && wget https://github.com/pixelfusion/blueman/releases/download/1.3.1/blueman.phar -O /usr/local/bin/blueman \
 && npm install -g --unsafe-perm aglio \
;

RUN rm -fr ~/.cache/pip && npm cache clean -f
