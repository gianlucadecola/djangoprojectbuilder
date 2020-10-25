FROM python3.8

COPY requirements.txt .
RUN python3.8 -m pip install -f requirements.txt


RUN django-admin startproject server
