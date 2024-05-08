#!/bin/bash

GOLANG_VERSION="1.19.4"
TERRAFORM_VERSION="1.3.10"
TERRAGRUNT_VERSION='0.45.4'
TFDOCS_VERSION="0.17.0"
TFSEC_VERSION="1.28.5"

# Build azure based images
AZTAG="r00ts/alpine-devcontainers-az"
docker build --tag=${AZTAG}:latest . -f Dockerfile.az

#build tf on top
TFTAG="r00ts/alpine-devcontainers-az-tf"
docker build --build-arg="BASE_IMAGE=${AZTAG}:latest"\
  --build-arg="TERRAFORM_VERSION=${TERRAFORM_VERSION}" \
  --build-arg="TERRAGRUNT_VERSION=${TERRAGRUNT_VERSION}" \
  --build-arg="GOLANG_VERSION=${GOLANG_VERSION}" \
  --build-arg="TFDOCS_VERSION=${TFDOCS_VERSION}" \
  --build-arg="TFSEC_VERSION=${TFSEC_VERSION}" \
  --tag=${TFTAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION} . -f Dockerfile.tf

#build dev environment on top
DEVENV="r00ts/alpine-devcontainers-az-tf-dev"
docker build --build-arg="BASE_IMAGE=${TFTAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}" \
  --build-arg="UNAME=$(id -u -n)" \
  --build-arg="UID=$(id -u)" \
  --build-arg="GID=$(id -g)" \
  --tag=${DEVENV}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION} . -f Dockerfile.dev


docker push ${AZTAG}:latest
docker push ${TFTAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}
docker push ${DEVENV}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}