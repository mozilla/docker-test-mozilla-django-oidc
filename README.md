docker-test-mozilla-django-oidc
============================================

The purpose of these docker images is to setup a local environment to develop and test
`mozilla-django-oidc`.

Docker images
---------------

* `testprovider`
    * Provides a docker setup for an OIDC OP with preconfigured OIDC client IDs and secrets
    * OIDC provider endpoint is exposed in port `8080`
    * Provides a Django management command for creating users
    * Uses `django-oidc-provider`
* `testrp-py{2,3}`
    * Test django project preconfigured to work with `testprovider`
    * Uses `mozilla-django-oidc` as an authentication backend
    * Test RP is exposed in port `8081`
    * Builds based in both python 2/3
    * Environment variables
        * `TEST_OIDC_ALGO={hs,rs}`
* `e2e-setup-py{2,3}`
    * Dockerized setup for e2e testing of mozilla-django-oidc

Build
------

We use `make` to automate the docker image workflow.
For more info run `make help`

Usage
------

In order for this setup to work `testprovider`, `testrp` hostnames should resolve to the
IP of the docker image (for local development it's `127.0.0.1`).

Example setup
---------------
### `docker-compose.yml`

```
version: '3'
services:
  testprovider:
    image: mozillaparsys/oidc_testprovider
    ports:
      - "8080:8080"
  testrp:
    image: mozillaparsys/oidc_testrp:py3
    ports:
      - "8081:8081"
    environment:
      - TEST_OIDC_ALGO=hs
```

Creating users
--------------

The `testprovider` image has a Django management command for creating users in
the OIDC provider. This lets you create users on the command line.

Usage: `/code/manage.py createuser USERNAME PASSWORD EMAIL`
