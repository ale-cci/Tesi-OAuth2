FROM python:3.8.6-buster

WORKDIR /notebook
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY OAuth2-presentation.ipynb /notebook/

ENV PORT=3333
CMD /usr/local/bin/jupyter-notebook --no-browser --allow-root --ip 0.0.0.0 --port $PORT OAuth2-presentation.ipynb
