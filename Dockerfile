FROM python:3.10-slim

ENV TZ="America/Sao_Paulo"

RUN apt-get update && apt-get install -y build-essential && apt-get install -y libpq-dev python3-dev
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Install Firefox and GeckoDriver
RUN apt-get update && apt-get install -y firefox-esr

COPY requirements.txt /tmp/requirements.txt

WORKDIR /tmp
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /

WORKDIR /

CMD [ "python", "main.py" ]
