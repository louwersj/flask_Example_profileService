FROM oraclelinux:7-slim


# Maintain correct lables in the Dockerfile.
LABEL maintainer="louwersj@gmail.com" \
      version="0.1" \
      description="Flask example application serving a profile service" \
      source="https://github.com/louwersj/flask_Example_profileService"


# Install a number of packages from the Oracle YUM repository and clean the YUM cache.
# Additionally; upgrade pip and install requirements based upon requirements.txt
RUN yum install -y oracle-epel-release-el7 oracle-release-el7 && \
    /usr/bin/ol_yum_configure.sh &&\
    yum update -y &&\
    yum install -y python36 python-setuptools python-pip python-wheel &&\
    yum clean all

# Copy the ./application into the /app directory and move to the /app workdir. Than
# ensure we have the latest version of pip installed and  install requirements based
# upon the information in the requirements.txt file.
COPY ./application/* /app/
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install --upgrade pip &&\
    pip install -r /app/requirements.txt


# set the ENTRYPOINT to the python command and start app.py
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]