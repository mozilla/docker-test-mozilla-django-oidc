#!/bin/bash

export OIDC_RP_CLIENT_ID='1'
export OIDC_RP_CLIENT_SECRET='bd01adf93cfb'
python manage.py migrate --noinput
python manage.py runserver 0.0.0.0:8081
