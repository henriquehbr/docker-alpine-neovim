build:
	DOCKER_BUILDKIT=1 docker build -t henriquehbr/neovim-alpine:0.8.0 .

run:
	docker run --rm -it henriquehbr/neovim-alpine:0.8.0
