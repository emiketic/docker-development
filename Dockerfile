FROM emiketic/essentials:latest

RUN apk add --no-cache --update \
      python \
      python-dev \
      py-pip \
      build-base \
    ;

RUN \
      git clone --recursive git://github.com/apiaryio/drafter.git ; \
      cd ./drafter ; \
      ./configure ; \
      make test ; \
      make drafter ; \
      make install ; \
      cd .. ; \
      rm -fr ./drafter ;

RUN pip install apiary2postman
