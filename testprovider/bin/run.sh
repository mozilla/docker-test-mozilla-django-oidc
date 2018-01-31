#!/bin/sh

python manage.py migrate --noinput
python manage.py loaddata fixtures.json
python manage.py loaddata keys.json
python manage.py runserver 0.0.0.0:8080
