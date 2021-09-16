.PHONY: build
build:
	docker build --progress=plain --no-cache -t docker-gam .
pull:
	docker build --progress=plain --no-cache -t docker-gam .