#!/bin/bash
python manage.py makemigrations
python manage.py migrate
python manage.py init_area
python manage.py init -y
uvicorn application.asgi:application --port 8001 --host 0.0.0.0 --workers 4
