UBUNTU_VERSION="22.04"
TAG="r00ts/devcontainers-ubuntu-base" 

docker build  --build-arg="UBUNTU_VERSION=${UBUNTU_VERSION}" \
  --tag=${TAG}:${UBUNTU_VERSION} .

docker push ${TAG}:${UBUNTU_VERSION}