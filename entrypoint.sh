#!/bin/sh

until cd /code
do
    echo "Waiting for server volume..."
done


until python manage.py migrate
do
    echo "Waiting for db to be ready..."
    sleep 2
done


gunicorn --bind :5500 --workers 2 djproject.wsgi
