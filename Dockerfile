FROM apache/airflow:master-python3.7-ci

RUN apt-get -y install libsasl2-dev python-dev libldap2-dev libssl-dev
RUN pip3 install python-ldap
