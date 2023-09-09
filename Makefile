ENV :=dev
SHELL := /bin/bash

CWD:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKER_REPO ?=
DOCKER_PASSWORD ?=
IMAGE_TAG ?= latest

.PHONY: docker-login
docker-login:
	echo $(DOCKER_PASSWORD) | docker login -u $(DOCKER_REPO) --password-stdin

.PHONY: skaffold-build-local
skaffold-build-local:
	skaffold build  --platform linux/amd64 --default-repo=$(DOCKER_REPO)

.PHONY: skaffold-build
skaffold-build:
	skaffold build  --platform linux/amd64 --default-repo=$(DOCKER_REPO) --push

.PHONY: build-backend
build-backend:
	docker build backend -t $(DOCKER_REPO)/api:$(IMAGE_TAG) -f containers/Dockerfile.api
	docker push $(DOCKER_REPO)/api:$(IMAGE_TAG)

.PHONY: build-frontend
build-frontend:
	docker build frontend -t $(DOCKER_REPO)/web:$(IMAGE_TAG) -f containers/Dockerfile.web
	docker push "$(DOCKER_REPO)/web:$(IMAGE_TAG)"