LABEL maintainer="louwersj@gmail.com"
LABEL version="0.1"
LABEL description="Flask example application serving a profile service"
LABEL source="https://github.com/louwersj/flask_Example_profileService"


FROM oraclelinux:7-slim


RUN yum install -y oracle-epel-release-el7 oracle-release-el7 && \
    /usr/bin/ol_yum_configure.sh &&\
    yum update -y &&\
    yum install -y python36 &&\
    yum install -y python-setuptools

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./application/* /app/

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]