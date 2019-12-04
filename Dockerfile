FROM apache/airflow:master-ci

COPY webserver_config.py /root/airflow

RUN apt-get update \
 && apt-get -y install libsasl2-dev python-dev libldap2-dev libssl-dev \
 && rm -rf /var/lib/apt/lists/*
RUN pip3 install python-ldap
