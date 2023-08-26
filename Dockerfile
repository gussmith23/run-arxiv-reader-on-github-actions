FROM ubuntu:22.04

RUN apt update && apt install -y \
  pandoc \
  python3 \
  python3-pip \
  wget

WORKDIR /root
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


# Build and install patched pandoc
WORKDIR /root
ADD pandoc/ pandoc/
RUN mkdir -p "$HOME/.local/bin"
ENV PATH="$HOME/.local/bin:$PATH"
RUN wget https://github.com/commercialhaskell/stack/releases/download/v2.9.1/stack-2.9.1-linux-x86_64-bin -o "$HOME/.local/bin/stack"
RUN cd pandoc \
  && stack setup \
  && stack install pandoc-cli

WORKDIR /root
ADD arxiv-reader/ arxiv-reader/

