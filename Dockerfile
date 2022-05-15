FROM python:3.10-slim-buster

LABEL maintainer="Julien Alardot <alardotj.pro@@gmail.com>"

WORKDIR /usr/src/app/

RUN apt-get update && apt-get upgrade --no-install-recommends -y &&  \
    apt-get install --no-install-recommends apt-utils=1.8.2.3 sqlite3=3.27.2-3+deb10u1 -y && apt-get autoclean -y &&  \
    apt-get autoremove -y && rm -rf /var/lib/apt/lists/* && pip install --no-cache-dir pip==22.1

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN python -m compileall -f .

RUN python3 setup.py install & sqlite3 data/db.sqlite
CMD [ "python", "bot/__main__.py" ]
