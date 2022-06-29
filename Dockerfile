FROM ubuntu:18.04
MAINTAINER ybeee "ybeen22@gmail.com"

RUN apt-get -y update
RUN apt-get -y install python3.8
RUN apt-get -y install python3-pip build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1


RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN pip3 install -r requirements.txt

RUN export LC_ALL=C.UTF-8  && export LANG=C.UTF-8

EXPOSE 8660

CMD ["uvicorn", "main:application", "--host", "0.0.0.0", "--port", "8660"]