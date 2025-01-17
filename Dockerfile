FROM ubuntu:18.04

RUN mkdir -p /tmp/build
COPY . /tmp/build

RUN mkdir -p /tmp/freetype && cd /tmp/freetype
RUN wget https://bigsearcher.com/mirrors/nongnu/freetype/freetype-2.10.1.tar.gz && \
    tar -xzf freetype-2.10.1.tar.gz && \
    cd freetype-2.10.1 \
    ./configure && make -j4 && make install

RUN apt-get install -y python
RUN  apt-get update && \
     apt-get install -y libmp3lame-dev libx264-dev libfdk-aac-dev mpv