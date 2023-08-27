FROM ubuntu:22.04

RUN apt update && apt install -y \
  pandoc \
  python3 \
  python3-pip

# Install pip dependencies and remove unnecessary GPU stuff (decreases Docker
# size immensely!)
WORKDIR /root
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt \
  && pip uninstall -y \
  nvidia-cublas-cu11 \
  nvidia-cuda-cupti-cu11 \
  nvidia-cuda-nvrtc-cu11 \
  nvidia-cuda-runtime-cu11 \
  nvidia-cudnn-cu11 \
  nvidia-cufft-cu11 \
  nvidia-curand-cu11 \
  nvidia-cusolver-cu11 \
  nvidia-cusparse-cu11 \
  nvidia-nccl-cu11 \
  nvidia-nvtx-cu11

WORKDIR /root
ADD arxiv-reader/ arxiv-reader/

