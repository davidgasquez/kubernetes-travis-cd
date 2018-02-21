IMAGE_TAG := beta
IMAGE_NAME := davidgasquez/cronjob:$(IMAGE_TAG)

.PHONY: all build run dev

all: run

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run -it --rm $(IMAGE_NAME)

push:
	docker push $(IMAGE_NAME)

dev: build
	docker run -it -v $(PWD):/app --rm $(IMAGE_NAME) bash
