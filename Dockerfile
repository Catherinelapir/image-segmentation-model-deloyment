# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /flask-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn

COPY . .

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0", "app:app"]
