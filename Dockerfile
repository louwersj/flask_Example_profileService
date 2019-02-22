FROM oraclelinux:7-slim


RUN yum install -y oracle-epel-release-el7 oracle-release-el7 && \
    yum install -y python37

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./application/* /app/

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]