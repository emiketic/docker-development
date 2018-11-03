FROM emiketic/essentials:latest

RUN apk add --no-cache --update python python-dev py-pip build-base

RUN pip install apiary2postman
