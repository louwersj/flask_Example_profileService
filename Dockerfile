FROM oraclelinux:7-slim


# Maintain correct lables in the Dockerfile.
LABEL maintainer="louwersj@gmail.com" \
      version="0.1" \
      description="Flask example application serving a profile service" \
      source="https://github.com/louwersj/flask_Example_profileService"


# Install a number of packages from the Oracle YUM repository.
RUN yum install -y oracle-epel-release-el7 oracle-release-el7 && \
    /usr/bin/ol_yum_configure.sh &&\
    yum update -y &&\
    yum install -y python36 &&\
    yum install -y python-setuptools &&\
    yum install -y python-pip &&\
    yum install -y python-wheel


# make sure we do clean up all the yum cache to keep size down
RUN yum clean all

# Ensure we have the latest version of pip installed
RUN pip install --upgrade pip

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