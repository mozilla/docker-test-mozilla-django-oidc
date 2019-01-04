DEFAULT_GOAL := help

NS ?= mozillaparsys
IMAGES := testprovider testrunner testrp-py2 testrp-py3 e2e-setup-py2 e2e-setup-py3
BUILD := $(addprefix build-,${IMAGES})
PUSH := $(addprefix push-,$(IMAGES))
PULL := $(addprefix pull-,$(IMAGES))
TAG := $(addprefix tag-,$(IMAGES))
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
pull: $(PULL) ## Pull all images

.PHONY: release
release: ${BUILD} ${TAG} ${PUSH} ## Release new images (build/tag/push)

.PHONY: ${BUILD}
${BUILD}: build-%:
	docker build -t $* -f dockerfiles/$* .

.PHONY: ${TAG}
${TAG}: tag-%:
	docker tag $* ${NS}/$*

.PHONY: ${PUSH}
${PUSH}: push-%:
	docker push ${NS}/$*

.PHONY: ${PULL}
${PULL}: pull-%:
	docker pull ${NS}/$*
