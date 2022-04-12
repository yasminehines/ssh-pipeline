FROM python:3.8.3-slim-buster

LABEL "maintainer"="Scott Ng <thuongnht@gmail.com>"
LABEL "repository"="https://github.com/cross-the-world/ssh-pipeline"
LABEL "version"="v1.1.0"

LABEL "com.github.actions.name"="ssh-pipeline"
LABEL "com.github.actions.description"="Pipeline: ssh"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"

RUN apt-get upgrade -y && \
  apt-get install -y ca-certificates

COPY requirements.txt /requirements.txt
RUN py3-pip install -r /requirements.txt

RUN mkdir -p /opt/tools

COPY entrypoint.sh /opt/tools/entrypoint.sh
RUN chmod +x /opt/tools/entrypoint.sh

COPY app.py /opt/tools/app.py
RUN chmod +x /opt/tools/app.py

ENTRYPOINT ["/opt/tools/entrypoint.sh"]
