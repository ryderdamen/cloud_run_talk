IMAGE_NAME=gcr.io/radical-sloth/cloud-run-talk
VERSION=1.0.2
LOCAL_PORT=5000

.PHONY: build
build:
	@docker build -t $(IMAGE_NAME):$(VERSION) .

.PHONY: run
run:
	@docker run -p $(LOCAL_PORT):$(LOCAL_PORT) -e PORT=$(LOCAL_PORT) $(IMAGE_NAME):$(VERSION)

.PHONY: push
push:
	@docker push $(IMAGE_NAME):$(VERSION)

.PHONY: deploy
deploy:
	gcloud beta run deploy cloud-run-talk --image $(IMAGE_NAME):$(VERSION) --region us-central1
