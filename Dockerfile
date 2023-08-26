FROM ubuntu:22.04

RUN apt update && apt install -y \
  curl \
  pandoc \
  python3

WORKDIR /root
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


# Build and install patched pandoc
WORKDIR /root
ADD pandoc/ pandoc/
RUN curl -sSL https://get.haskellstack.org/ | sh \
  && cd pandoc \
  && stack setup \
  && stack install pandoc-cli
ENV PATH="$HOME/.local/bin:$PATH"

WORKDIR /root
ADD arxiv-reader/ arxiv-reader/

