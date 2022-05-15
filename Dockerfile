FROM python:3.10-slim-buster

LABEL maintainer="Julien Alardot <alardotj.pro@@gmail.com>"

WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y
RUN apt-get install sqlite3 -y
RUN apt-get dist-upgrade -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN pip install --upgrade pip

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

RUN python3 setup.py install
RUN sqlite3 data/db.sqlite
CMD [ "python", "./__main__.py" ]
