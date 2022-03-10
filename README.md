# docker-test-mozilla-django-oidc

The purpose of these docker images is to setup a local environment to develop and test
`mozilla-django-oidc`.


## oidc-testprovider

https://hub.docker.com/r/mozilla/oidc-testprovider/tags?name=testprovider

* Provides a docker image for an OIDC OP with preconfigured OIDC client IDs and secrets
* OIDC provider endpoint is exposed in port `8080`
* Provides a Django management command for creating users
* Uses `django-oidc-provider`


### Usage

In order for this setup to work `testprovider`, `testrp` hostnames should resolve to the
IP of the docker image (for local development it's `127.0.0.1`).

You can add the resolution to your `/etc/hosts` file.

You can also use [nip.io](http://nip.io/). For example, if you name the service
"oidcprovider", then you could have these three variables:

```
OIDC_OP_AUTHORIZATION_ENDPOINT=http://oidcprovider.127.0.0.1.nip.io:8080/openid/authorize
OIDC_OP_TOKEN_ENDPOINT=http://oidcprovider.127.0.0.1.nip.io:8080/openid/token
OIDC_OP_USER_ENDPOINT=http://oidcprovider.127.0.0.1.nip.io:8080/openid/userinfo
```

### Example setup

`docker-compose.yml`

```
version: '3'
services:
  testprovider:
    image: mozilla/oidc-testprovider:oidc_testprovider-v0.9.3
    ports:
      - "8080:8080"
```


### Creating users in the container

The `testprovider` image has a Django management command for creating users in
the OIDC provider. This lets you create users on the command line.

With an already running `testprovider` container run:

```
docker-compose exec testprovider manage.py createuser USERNAME PASSWORD EMAIL
```


## Other images

All images are pushed to: https://hub.docker.com/r/mozilla/oidc-testprovider

* `oidc_testprovider` (See above)
* `oidc_testrunner`
* `oidc_testrp_py3`
    * Test django project preconfigured to work with `testprovider`
    * Uses `mozilla-django-oidc` as an authentication backend
    * Test RP is exposed in port `8081`
    * Environment variables
        * `TEST_OIDC_ALGO={hs,rs}`
* `oidc_e2e_setup_py3`
    * Dockerized setup for e2e testing of mozilla-django-oidc


### Example setup for oidc_testrp

`docker-compose.yml`

```
version: '3'
services:
  testrp:
    image: mozilla/oidc-testprovider:oidc_testrp_py3-v0.9.3
    ports:
      - "8081:8081"
    environment:
      - TEST_OIDC_ALGO=hs
```

## Development

We use `make` to automate the docker image workflow.

For more info run `make help`.

Pushing a tag to GitHub will trigger building images and uploading them
to Dockerhub.
