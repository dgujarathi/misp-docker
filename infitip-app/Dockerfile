ARG DOCKER_HUB_PROXY=""

FROM "${DOCKER_HUB_PROXY}python:3.8-slim-bookworm" AS python-build
    ENV DEBIAN_FRONTEND noninteractive
    
    # Set environment variables for MySQL client build flags
    ENV MYSQLCLIENT_CFLAGS="-I/usr/include/mysql"
    ENV MYSQLCLIENT_LDFLAGS="-L/usr/lib/x86_64-linux-gnu -lmysqlclient"

    RUN apt-get update && apt-get install -y \
        gcc \
        build-essential \
        libssl-dev \
        libffi-dev \
        default-libmysqlclient-dev \
        pkg-config \
        python3-dev \
        nano \
        && apt-get clean

    #RUN pip install setuptools
    RUN pip install --upgrade pip setuptools wheel

    # copy your local files to your
    # docker container
    COPY app-revamp/ /var/www/infitip-app
    COPY app-revamp/requirements.txt /tmp/requirements.txt
    COPY db-sql/ /tmp/

    # update your environment to work
    # within the folder you copied your 
    # files above into
    RUN cd /var/www/infitip-app

    # /opt: reserved for the installation of add-on application software packages.
    # We'll use this to create & store our virtual environment

    # Create a virtual environment in /opt
    #RUN python3 -m venv /opt/venv

    # Install requirments to new virtual environment
    # requirements.txt must have gunicorn & django
    #RUN /opt/venv/bin/pip install --no-cache-dir -r /tmp/requirements.txt
    RUN pip install --no-cache-dir -r /tmp/requirements.txt

    #RUN /opt/venv/bin/pip install pip --upgrade && \
    #    /opt/venv/bin/pip install -r requirements.txt

    WORKDIR /var/www/infitip-app
    #RUN pip install Django==4.2.11

    # entrypoint.sh will be discussed later.
    #CMD [ "/infitip-app/entrypoint.sh" ]
    CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]


