#!/bin/bash

# Read entrypoint parameters.
CELERY_COMMAND=${1:-worker}

# Define variables.
: ${{ '{' }}{{ cookiecutter.organization|upper }}_{{ cookiecutter.project_name|upper }}_CELERY_APP:={{ cookiecutter.project_name }}.celery}
: ${{ '{' }}{{ cookiecutter.organization|upper }}_{{ cookiecutter.project_name|upper }}_CELERY_LOG_LEVEL:=info}

# Start Celery command.
DATE=$(date -u +%Y%m%dT%H%M%S%Z)
su -m celery -c "celery ${CELERY_COMMAND} \
  -A ${{ '{' }}{{ cookiecutter.organization|upper }}_{{ cookiecutter.project_name|upper }}_CELERY_APP} \
  -l ${{ '{' }}{{ cookiecutter.organization|upper }}_{{ cookiecutter.project_name|upper }}_CELERY_LOG_LEVEL} \
  --pidfile=celery_${CELERY_COMMAND}-${DATE}.pid"
