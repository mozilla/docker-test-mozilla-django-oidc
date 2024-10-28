#!/bin/sh

python manage.py migrate --noinput
python manage.py loaddata fixtures.json
exec python manage.py runserver 0.0.0.0:8080
