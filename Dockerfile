FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y python3.12-venv
RUN mkdir /opt/web && cd /opt/web/ && python3 -m venv .venv && . .venv/bin/activate && pip install Flask
COPY app.py /opt/web/app.py
ENTRYPOINT FLASK_APP=/opt/web/app.py flask run --host=0.0.0.0
