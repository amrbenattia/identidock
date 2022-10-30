FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi 
RUN pip3 install Flask==0.10.1 uwsgi requests redis

WORKDIR /app

COPY app /app
COPY cmd.sh /cmd.sh

EXPOSE 9090 9191
USER uwsgi

CMD [ "/cmd.sh" ]