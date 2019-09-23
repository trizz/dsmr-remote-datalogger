FROM python:3-alpine

COPY dsmr_datalogger_api_client.py ./

RUN mkdir -p /etc/dsmr_logs
RUN pip install --no-cache-dir pyserial==3.2.1 requests==2.12.4

CMD ["python", "./dsmr_datalogger_api_client.py"]
