FROM resin/raspberry-pi-alpine-python:3.7-slim

COPY dsmr_datalogger_api_client.py ./

RUN pip install --no-cache-dir pyserial==3.2.1 requests==2.12.4

CMD ["python", "./dsmr_datalogger_api_client.py"]
