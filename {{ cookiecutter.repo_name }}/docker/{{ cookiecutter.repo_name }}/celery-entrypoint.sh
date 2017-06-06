#!/bin/bash

# Read entrypoint parameters.
CELERY_COMMAND=${1:-worker}

# Define variables.
: ${{ '{' }}{{ cookiecutter.prefix|upper }}_{{ cookiecutter.repo_name|upper }}_CELERY_APP:-{{ cookiecutter.repo_name }}.celery}
: ${{ '{' }}{{ cookiecutter.prefix|upper }}_{{ cookiecutter.repo_name|upper }}_CELERY_LOG_LEVEL:-info}

# Start Celery command.
DATE=$(date -u +%Y%m%dT%H%M%S%Z)
su -m celery -c "celery ${CELERY_COMMAND} \
  -A ${{ '{' }}{{ cookiecutter.prefix|upper }}_{{ cookiecutter.repo_name|upper }}_CELERY_APP} \
  -l ${{ '{' }}{{ cookiecutter.prefix|upper }}_{{ cookiecutter.repo_name|upper }}_CELERY_LOG_LEVEL} \
  --pidfile=celery_${CELERY_COMMAND}-${DATE}.pid"
