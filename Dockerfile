# Maintain correct lables in the Dockerfile.
LABEL maintainer="louwersj@gmail.com"
LABEL version="0.1"
LABEL description="Flask example application serving a profile service"
LABEL source="https://github.com/louwersj/flask_Example_profileService"


# based the image on the Oracle Linux 7-slim base image.
FROM oraclelinux:7-slim


# Install a number of packages from the Oracle YUM repository.
RUN yum install -y oracle-epel-release-el7 oracle-release-el7 && \
    /usr/bin/ol_yum_configure.sh &&\
    yum update -y &&\
    yum install -y python36 &&\
    yum install -y python-setuptools


# Copy just the requirements.txt and change the working directory to
# /app to run the pip install for python requirements.
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt


# copy the content of ./application to /app
COPY ./application/* /app/


# set the ENTRYPOINT to the python command and start app.py
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]