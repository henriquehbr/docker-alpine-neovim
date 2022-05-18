build:
	DOCKER_BUILDKIT=1 docker build -t neovim-alpine:0.8.0 .

run:
	docker run --rm -it neovim-alpine:0.8.0
