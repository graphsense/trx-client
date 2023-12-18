RELEASE := 'v23.09'
RELEASESEM := 'v1.2.2'

all: build

build:
	docker-compose build

run:
	docker-compose up -d

tag-version:
	-git diff --exit-code && git diff --staged --exit-code && git tag -a $(RELEASESEM) -m 'Release $(RELEASE)' || (echo "Repo is dirty please commit first" && exit 1)
	git diff --exit-code && git diff --staged --exit-code && git tag -a $(RELEASE) -m 'Release $(RELEASE)' || (echo "Repo is dirty please commit first" && exit 1)

.PHONY: all build run tag-version