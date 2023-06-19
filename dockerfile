FROM python:3.11.4-slim-bullseye

WORKDIR /app

LABEL version="1.0"
LABEL description="Flask app returns timestamp and hostname"

COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 9090


ENV NAME=TimeHostService

CMD ["python", "sampleapp.py"]


