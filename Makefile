IMAGE_TAG := 1.0.0
IMAGE_NAME := davidgasquez/cronjob:$(IMAGE_TAG)

.PHONY: all build run dev

all: run

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it --rm $(IMAGE_NAME)

push: build
	docker push $(IMAGE_NAME)

dev:
	docker run -it -v $(PWD):/app --rm $(IMAGE_NAME) bash
