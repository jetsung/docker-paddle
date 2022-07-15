FROM debian:11.4
LABEL maintainer="Jetsung Chan<jetsungchan@gmail.com>"
ARG PADDLE_VERSION=2.3.1
ARG PADDLEOCR_VERSION=2.0.1

RUN set -eux \
      ; \
    apt-get update -y ; \
    apt-get install -y curl python3.9 python3.9-dev python3.9-distutils python3.9-venv python-is-python3 \
    libgomp1 libglib2.0-dev build-essential libgl1-mesa-dev mesa-common-dev libsndfile1 ; \
    python -m venv ~/.paddle_env ; \
    curl -fSL https://bootstrap.pypa.io/get-pip.py | python ; \ 
    apt-get remove curl -y ; \
    apt-get autoremove -y ; \
    apt-get autoclean -y ; \
    apt-get clean -y ; \
    rm -rf /var/lib/apt/lists/* ; \
    find /var/log -type f -delete \
      ; \
    echo ". ~/.paddle_env/bin/activate" >> ~/.bashrc ; \
    . ~/.paddle_env/bin/activate ; \
    pip install "paddlepaddle==${PADDLE_VERSION}" ; \
    pip install "paddleocr>=${PADDLEOCR_VERSION}" ; \
    pip install pytest-runner ; \
    pip install paddlespeech ; \
    mkdir /app ; \
    printf '#!/usr/bin/env bash \n\n \
if [ -z "${1}" ] ; then \n \
  /bin/bash \n \
elif [ "${1}" = "-D" ] ; then \n \
  /bin/bash -c "while true; do echo; sleep 360; done" \n \
else \n \
  exec -- "$@" \n \
fi \n'\
> /app/entry.sh ; \
chmod +x /app/entry.sh

WORKDIR /paddle

COPY mirror.sh /app/

ENTRYPOINT [ "/app/entry.sh" ]
CMD [ "-D" ]
