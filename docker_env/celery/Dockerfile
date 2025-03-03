FROM python:3.10.9-slim

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
    bash \
    git \
    libjpeg-dev \
    libmariadb-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libpcre3-dev \
    libncurses5-dev \
    libreadline-dev \
    tk-dev \
    libpq-dev \
    pkg-config \
    default-libmysqlclient-dev  # Ensure MySQL client is installed

WORKDIR /backend

# Copy application code
COPY ./backend/ .

# List contents of the configuration directory
RUN ls ./conf/

# Copy example environment file to actual environment file
RUN awk 'BEGIN { cmd="cp -i ./conf/env.example.py ./conf/env.py "; print "n" |cmd; }'

# Update database host in the environment configuration
RUN sed -i "s|DATABASE_HOST = 'dvadmin3-mysql'|DATABASE_HOST = '177.10.0.1'|g" ./conf/env.py

# Update Redis host in the environment configuration
RUN sed -i "s|REDIS_HOST = 'dvadmin3-redis'|REDIS_HOST = '177.10.0.1'|g" ./conf/env.py

# Install Python dependencies
RUN python3 -m pip install -r requirements.txt

RUN adduser --disabled-password --gecos '' celeryuser
USER celeryuser

CMD ["celery", "-A", "application", "worker", "-B", "--loglevel=info"]
