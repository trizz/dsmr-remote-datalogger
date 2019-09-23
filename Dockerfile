FROM python:3-alpine

COPY dsmr_datalogger_api_client.py ./
COPY requirements.txt ./

RUN mkdir -p /etc/dsmr_logs
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "./dsmr_datalogger_api_client.py"]
