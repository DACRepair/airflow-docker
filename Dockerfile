FROM python:3.7-alpine
ENV AIRFLOW_PKGS "async,celery,crypto,kubernetes,ldap,password,postgres,redis"

RUN pip3 install --upgrade setuptools pip \
    && apk --no-cache --virtual .build-deps add \
        build-base gcc \
        linux-headers libffi-dev libc-dev \
        musl-dev \
        openssl-dev \
        postgresql-dev python3-dev \
    && pip install apache-airflow \
    && pip install apache-airflow[${AIRFLOW_PKGS}] \
    && apk del .build-deps \
    && apk --no-cache add postgresql-libs postgresql-client git
    
# Add my custom DAG Repo manager plugin
RUN pip install git+https://github.com/DACRepair/airflow-repoman.git

ENTRYPOINT ["/usr/local/bin/airflow"]
CMD ["shell"]
