FROM python:3.7-alpine
WORKDIR /code
COPY ./src/requirements.txt /code/requirements.txt
RUN pip install -r requirements.txt
COPY ./src .
CMD ["sh", "-c", "gunicorn -b 0.0.0.0:$PORT wsgi"]
