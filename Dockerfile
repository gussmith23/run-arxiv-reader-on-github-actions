FROM ubuntu:22.04

RUN apt update && apt install -y \
  pandoc \
  python3 \
  python3-pip

# Install pip dependencies. Install torch CPU specifically, and remove
# unnecessary GPU stuff (decreases Docker size immensely!)
# If this errors out, you likely need more cases in the if statement.
WORKDIR /root
ADD requirements.txt requirements.txt
RUN if [ "$(uname -m)" = "x86_64" ] ; then \
  pip3 install -y http://download.pytorch.org/whl/cpu/torch-2.0.1%2Bcpu-cp310-cp310-linux_x86_64.whl ; \
  else \
  exit 1; \
  fi \
  && install -r requirements.txt \
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

