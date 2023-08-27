FROM ubuntu:22.04

RUN apt update && apt install -y \
  pandoc \
  python3 \
  python3-pip

WORKDIR /root
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /root
ADD arxiv-reader/ arxiv-reader/

