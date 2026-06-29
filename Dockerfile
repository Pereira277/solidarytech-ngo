FROM python:3.11-slim

RUN groupadd -r app && useradd -r -g app -d /app app

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

USER app

EXPOSE 8081

CMD ["gunicorn", "--bind", "0.0.0.0:8081", "--workers", "2", "app:app"]
