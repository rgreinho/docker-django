#!/bin/bash
set -euo pipefail

# Define variables.
: ${{ '{' }}{{ cookiecutter.organization|upper }}_{{ cookiecutter.project_name|upper }}_API_PORT:=8000}

# Ensure the DB is up and running before starting Django.
>&2 echo -n "Waiting for DB to be up and running."
until psql -h "{{ cookiecutter.organization|lower }}-{{ cookiecutter.project_name|lower }}-db" -U "postgres" -c '\l'; do
  sleep 1
  >&2 echo -n .
done

# Migrate db, so we have the latest db schema.
python manage.py migrate

# Start development server on public ip interface, on port 8000.
exec gunicorn --reload -b 0.0.0.0:${{ '{' }}{{ cookiecutter.organization|upper }}_{{ cookiecutter.project_name|upper }}_API_PORT} {{ cookiecutter.project_name }}.wsgi
