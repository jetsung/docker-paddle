FROM debian:11.4
LABEL maintainer="Jetsung Chan<jetsungchan@gmail.com>"
ARG PADDLE_VERSION=2.3.1
ARG PADDLEOCR_VERSION=2.0.1

RUN set -eux \
      ; \
    apt-get update -y ; \
    apt-get install -y curl python3.9 python3.9-dev python3.9-distutils python3.9-venv python-is-python3 libgomp1 libglib2.0-dev build-essential libgl1-mesa-dev mesa-common-dev; \
    python -m venv ~/.paddle_env ; \
    . ~/.paddle_env/bin/activate ; \
    curl -fSL https://bootstrap.pypa.io/get-pip.py | python ; \ 
    pip install paddlepaddle==${PADDLE_VERSION}; \
    pip install "paddleocr>=${PADDLEOCR_VERSION}" ; \
    echo ". ~/.paddle_env/bin/activate" >> ~/.bashrc ; \
    apt-get remove curl -y ; \
    apt-get autoremove -y ; \
    apt-get autoclean -y ; \
    apt-get clean -y ; \
    rm -rf /var/lib/apt/lists/* ; \
    find /var/log -type f -delete

WORKDIR /paddle
CMD /bin/bash -c "while true; do echo paddle; sleep 360; done"
