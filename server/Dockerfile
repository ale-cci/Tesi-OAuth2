FROM python:3.8.6-buster

WORKDIR /server
COPY requirements.txt .
RUN pip install -r requirements.txt

ENV FLASK_APP=main.py
ENV FLASK_ENV=development

COPY ./app ./app
COPY main.py .

CMD python -m flask run --host=0.0.0.0 --port=$PORT
