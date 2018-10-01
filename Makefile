REGISTRY=docker.io/
IMAGE=zdwiel/dat

BUILD_ARGUMENTS=
RUN_ARGUMENTS=
ifdef http_proxy
	BUILD_ARGUMENTS+=--build-arg http_proxy=$(http_proxy)
	RUN_ARGUMENTS+=--env http_proxy=$(http_proxy)
endif

ifdef https_proxy
	BUILD_ARGUMENTS+=--build-arg https_proxy=$(https_proxy)
	RUN_ARGUMENTS+=--env https_proxy=$(https_proxy)
endif

.PHONY: build tag

all: build tag

run: build
	docker run $(RUN_ARGUMENTS) --net host -v $(HOME):/host --rm -it $(IMAGE)

build:
	docker build $(BUILD_ARGUMENTS) -t $(IMAGE) .

tag:
	docker tag ${IMAGE} ${REGISTRY}${IMAGE}
