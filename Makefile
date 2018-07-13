.PHONY: build tag

all: build tag

run: build tag
	@docker run --net host -v /Users/zdwiel:/host --rm -it zdwiel/dat

build:
	@docker build -t dat .

tag:
	@docker tag dat zdwiel/dat
