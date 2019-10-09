DEFAULT_GOAL := help

NS ?= mozillaparsys
IMAGES := oidc_testprovider oidc_testrunner oidc_testrp_py2 oidc_testrp_py3 oidc_e2e_setup_py2 oidc_e2e_setup_py3
BUILD := $(addprefix build-,${IMAGES})
PUSH := $(addprefix push-,$(IMAGES))
PULL := $(addprefix pull-,$(IMAGES))
TAG := $(addprefix tag-,$(IMAGES))
CLEAN := $(addprefix clean-,$(IMAGES))
RELEASE := $(addprefix release-,$(IMAGES))

.PHONY: help
help:
	@fgrep -h "##" Makefile | fgrep -v fgrep | sed 's/\(.*\):.*##/\1:/'

.PHONY: build
build: ${BUILD} ## Build all images

.PHONY: tag
tag: ${TAG} ## Tag all images

.PHONY: push
push: ${PUSH} ## Push all images

.PHONY: pull
pull: ${PULL} ## Pull all images

.PHONY: release
release: ${BUILD} ${TAG} ${PUSH} ## Release new images (build/tag/push)

.PHONY: clean
clean: ${CLEAN}

.PHONY: ${BUILD}
${BUILD}: build-%:
	docker build -t $(subst _py,:py,$(*)) -f dockerfiles/$* .

.PHONY: ${TAG}
${TAG}: tag-%:
	docker tag $(subst _py,:py,$(*)) ${NS}/$(subst _py,:py,$(*))

.PHONY: ${PUSH}
${PUSH}: push-%:
	docker push ${NS}/$(subst _py,:py,$(*))

.PHONY: ${PULL}
${PULL}: pull-%:
	docker pull ${NS}/$(subst _py,:py,$(*))

.PHONY: ${CLEAN}
${CLEAN}: clean-%:
	docker rmi ${NS}/$(subst _py,:py,$(*))
	docker rmi $(subst _py,:py,$(*))
