#!/bin/bash

export OIDC_RP_IDP_SIGN_KEY=$(cat provider_rsa.key)
export OIDC_RP_CLIENT_ID='2'
export OIDC_RP_CLIENT_SECRET='a6b4dad2f215'
export OIDC_RP_SIGN_ALGO='RS256'
python manage.py migrate --noinput
python manage.py runserver 0.0.0.0:8081
