FROM python:3.6

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY cronjob.py /app/
WORKDIR /app

CMD ["python", "cronjob.py"]
