DEFAULT_GOAL := help

NS ?= mozilla/oidc-testprovider

IMAGES := oidc_testprovider
IMAGES += oidc_testrunner
IMAGES += oidc_testrp_py3
IMAGES += oidc_e2e_setup_py39
IMAGES += oidc_e2e_setup_py310
IMAGES += oidc_e2e_setup_py311
IMAGES += oidc_e2e_setup_py312
IMAGES += oidc_e2e_setup_py313
IMAGES += oidc_e2e_setup_py314

BUILD := $(addprefix build-,${IMAGES})
PULL := $(addprefix pull-,$(IMAGES))
CLEAN := $(addprefix clean-,$(IMAGES))

.PHONY: help
help:
	@echo "Commands:"
	@fgrep -h "##" Makefile | fgrep -v fgrep | sed 's/\(.*\):.*##/\1:/'
	@echo ""
	@echo "Images: ${IMAGES}"

.PHONY: build
build: ${BUILD} ## Build all images

.PHONY: pull
pull: ${PULL} ## Pull all -latest images

.PHONY: clean
clean: ${CLEAN} ## Clean images and other artifacts

.PHONY: ${BUILD}
${BUILD}: build-%:
	docker build -t $* -f dockerfiles/$* .

.PHONY: ${PULL}
${PULL}: pull-%:
	docker pull ${NS}:$*-latest

.PHONY: ${CLEAN}
${CLEAN}: clean-%:
	docker rmi ${NS}/$(subst _py,:py,$(*))
	docker rmi $(subst _py,:py,$(*))
