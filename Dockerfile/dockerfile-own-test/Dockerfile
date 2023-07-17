FROM ubuntu:mantic

COPY . /home

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y gnupg

WORKDIR /home

CMD ["./cmd"]
