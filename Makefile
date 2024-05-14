build-debian-dev:
	@echo "build debian base image"
	@cd debian-base && chmod +x ./build.sh && ./build.sh

build-alpine-dev:
	@echo "build alpine dev image"
	@cd alpine-base && chmod +x ./build.sh && ./build.sh

build-chelan-debian-project:
	@echo "build chelan debian project image"
	@cd debian-base && chmod +x ./build.sh && ./build.sh -g 1.22.2 -tf 1.6.6 -tg 0.53.8

# Example usage localy with nvim
#	docker run --name devcontainer --entrypoint nvim -w /home/daniel/workspace -v $(pwd):/home/daniel/workspace -ti r00ts/devcontainers-az-tf-dev:1.3.10-0.45.4
