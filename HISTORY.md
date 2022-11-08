HISTORY
=======

v0.10.6 (November 8, 2022)
-----------------------------

Bugs:

* replace url with re_path in testrp


v0.10.5 (November 8, 2022)
--------------------------

Bugs:

* add delete user view to testprovider
* add selenium3 to requirements
* bump geckodriver to version 0.32
* upgrade to bullseye


v0.10.4 (June 8, 2022)
----------------------

Bugs:

* add selenium to requirements for e2e images


v0.10.3 (June 6, 2022)
----------------------

Bugs:

* fix circleci job to push images (#45)


v0.10.2 (June 6, 2022)
----------------------

Bugs:

* create oidc_e2e_setup_py for each supported Python version (#43)
* update docs


v0.10.1 (March 28, 2022)
------------------------

Bugs:

* fix redirect in login and signup forms (#37)


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
