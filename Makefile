.PHONY: build
buildx:
	docker buildx build --platform linux/amd64 --progress=plain --no-cache -t docker-gam .
build:
	docker build --progress=plain --no-cache -t docker-gam .
pull:
	docker build --progress=plain --no-cache -t docker-gam .