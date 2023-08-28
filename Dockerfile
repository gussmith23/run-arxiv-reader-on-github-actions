FROM ubuntu:22.04

RUN apt update && apt install -y \
  pandoc \
  python3 \
  python3-pip \
  wget

# Install pip dependencies. Install torch CPU specifically, as it avoids
# unnecessary GPU stuff (decreases Docker size immensely!)
WORKDIR /root
ADD requirements.txt requirements.txt
RUN if [ "$(uname -m)" = "x86_64" ] ; then \
  pip3 install --no-input http://download.pytorch.org/whl/cpu/torch-2.0.1%2Bcpu-cp310-cp310-linux_x86_64.whl ; \
  else \
  exit 1; \
  fi \
  && pip install -r requirements.txt

WORKDIR /root
ADD arxiv-reader/ arxiv-reader/

