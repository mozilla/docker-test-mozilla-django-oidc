HISTORY
=======

v0.10.0 (March 28, 2022)
------------------------

Bugs:

* drop support for < Python 3.7 (#21) (#31)
* update to Django 3.2.12 (LTS) (#30)
* drop pinax-theme-bootstrap requirement
* switch from ci-docker-bases to cimg/python for CI (#29)


v0.9.4 (December 31, 2019)
--------------------------

Bugs:

* fix django version for testprovider
* fix backwards incompatible chagnes for Django 3.x
* improve README


v0.9.3 (October 23rd, 2019)
---------------------------

Bugs:

* fix docker push code


v0.9.2 (October 22nd, 2019)
---------------------------

No substantive changes. Doing a new tag so as to push images to dockerhub.


v0.9.1 (October 22nd, 2019)
---------------------------

Bugs:

* fix `build` and `pull` rules in Makefile to use the correct tags


v0.9.0 (October 22nd, 2019)
---------------------------

First tagged release.

Features:

* new `createuser` command in `oidc_testprovider` image
* redid how images are tagged and we're now pushing them to dockerhub
  in the `mozilla` user
