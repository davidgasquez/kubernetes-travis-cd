IMAGE_TAG := 1.0.0
IMAGE_NAME := davidgasquez/cronjob:$(IMAGE_TAG)
RELEASE_NAME := custom-cronjob

.PHONY: all build run dev

all: run

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it --rm $(IMAGE_NAME)

push: build
	docker push $(IMAGE_NAME)

deploy:
	helm install cronjob \
        --set image.name=$(IMAGE_NAME),image.tag=$(IMAGE_TAG),schedule="* 0 * * *" \
        --name $(RELEASE_NAME)

upgrade:
	helm upgrade $(RELEASE_NAME) cronjob \
        --set image.name=$(IMAGE_NAME),image.tag=$(IMAGE_TAG),schedule="* 1 * * *" \

dev:
	docker run -it -v $(PWD):/app --rm $(IMAGE_NAME) bash
