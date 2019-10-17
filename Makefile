DEFAULT_GOAL := help

NS ?= mozilla
IMAGES := oidc_testprovider oidc_testrunner oidc_testrp_py2 oidc_testrp_py3 oidc_e2e_setup_py2 oidc_e2e_setup_py3
BUILD := $(addprefix build-,${IMAGES})
PULL := $(addprefix pull-,$(IMAGES))
CLEAN := $(addprefix clean-,$(IMAGES))

.PHONY: help
help:
	@fgrep -h "##" Makefile | fgrep -v fgrep | sed 's/\(.*\):.*##/\1:/'

.PHONY: build
build: ${BUILD} ## Build all images

.PHONY: pull
pull: ${PULL} ## Pull all images

.PHONY: clean
clean: ${CLEAN} ## Clean images and other artifacts

.PHONY: ${BUILD}
${BUILD}: build-%:
	docker build -t $(subst _py,:py,$(*)) -f dockerfiles/$* .

.PHONY: ${PULL}
${PULL}: pull-%:
	docker pull ${NS}/$(subst _py,:py,$(*))

.PHONY: ${CLEAN}
${CLEAN}: clean-%:
	docker rmi ${NS}/$(subst _py,:py,$(*))
	docker rmi $(subst _py,:py,$(*))
