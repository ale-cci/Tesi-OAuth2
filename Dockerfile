FROM python:3-alpine

WORKDIR /app
COPY requirements.txt .

COPY server.py .
