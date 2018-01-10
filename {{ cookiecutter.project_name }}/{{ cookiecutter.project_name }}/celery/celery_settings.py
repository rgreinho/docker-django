"""Configure Celery."""
import os

from celery.schedules import crontab
from json_tricks.nonp import dumps
from json_tricks.nonp import loads
from kombu.serialization import register

# Register json-tricks as json encoder
register('json_tricks.nonp', dumps, loads, content_type='application/x-json-tricks', content_encoding='utf-8')

# Global configuration.
accept_content = ['application/json', 'application/x-json-tricks']
imports = ('{{ cookiecutter.project_name }}.celery.tasks', )
timezone = 'America/Chicago'

# Beat configuration.
beat_max_loop_interval = 5

# Broker configuration.
broker_url = os.environ.get('CELERY_BROKER_URL', 'rpc://')

# Result configuration.
result_backend = os.environ.get('CELERY_RESULT_BACKEND', 'redis://')
result_serializer = 'json_tricks.nonp'

# Task configuration.
task_serializer = 'json_tricks.nonp'

# Worker condiguration.
worker_concurrency = 1
