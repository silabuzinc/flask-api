FROM python:3.9.5-slim

WORKDIR /app

ENV FLASK_APP=app.py

ENV FLASK_RUN_HOST=0.0.0.0

RUN apt-get update \
    && apt-get -y install libpq-dev gcc

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["flask", "run"]