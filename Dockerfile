FROM python:3.10-alpine
LABEL MAINTAINER="Fazendaaa <lucas.carotta@outlook.com>"
ENV PS1="\[\e[0;33m\]|> hashnode <| \[\e[1;35m\]\W\[\e[0m\] \[\e[0m\]# "

WORKDIR /src
COPY . /src
RUN pip install --no-cache-dir -r requirements.txt \
    && python setup.py install
WORKDIR /
ENTRYPOINT ["hashnode"]
