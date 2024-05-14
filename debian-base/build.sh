#!/bin/bash

set -e

function exit_with_msg {
  echo "${1}"
  exit 1
}

while [ $# -gt 0 ]; do
  case "${1}" in
    -g|--go-version)
      GO_VERSION="${2}"
      shift 2
      ;;
    -h|--help)
      echo "Usage:"
      echo "$0 \\"
      echo "  [-g|--go-version <go_version>]"
      echo "  [-h|--help]"
      echo "  [-tf|--terraform-version <terraform_version>]"
      echo "  [-tg|--terragrunt-version <terragrunt_version>]"
      exit 0
      ;;
    -tf|--terraform-version)
      TF_VERSION="${2}"
      shift 2
      ;;
    -tg|--terragrunt-version)
      TG_VERSION="${2}"
      shift 2
      ;;
    *)
      echo "Error: Invalid argument '${1}'."
      shift
  esac
done


[[ -z ${GO_VERSION} ]] && GOLANG_VERSION='1.19.4' || GOLANG_VERSION="${GO_VERSION}"
[[ -z ${TF_VERSION} ]] && TERRAFORM_VERSION='1.3.10' || TERRAFORM_VERSION="${TF_VERSION}"
[[ -z ${TG_VERSION} ]] && TERRAGRUNT_VERSION='0.45.4' || TERRAGRUNT_VERSION="${TG_VERSION}"

TFDOCS_VERSION="0.17.0"
TFSEC_VERSION="1.28.5"

# Build azure based images
AZTAG="r00ts/devcontainers-az"
docker build --tag=${AZTAG}:latest . -f Dockerfile.az

#build tf on top
TFTAG="r00ts/devcontainers-az-tf"
docker build --build-arg="BASE_IMAGE=${AZTAG}:latest" \
	--build-arg="TERRAFORM_VERSION=${TERRAFORM_VERSION}" \
	--build-arg="TERRAGRUNT_VERSION=${TERRAGRUNT_VERSION}" \
	--build-arg="GOLANG_VERSION=${GOLANG_VERSION}" \
	--build-arg="TFDOCS_VERSION=${TFDOCS_VERSION}" \
	--build-arg="TFSEC_VERSION=${TFSEC_VERSION}" \
	--tag=${TFTAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION} . -f Dockerfile.tf

#build dev environment on top
DEVENV="r00ts/devcontainers-az-tf-dev"
docker build --no-cache --build-arg="BASE_IMAGE=${TFTAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}" \
	--build-arg="UNAME=$(id -u -n)" \
	--build-arg="UID=$(id -u)" \
	--build-arg="GID=$(id -g)" \
	--tag=${DEVENV}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION} . -f Dockerfile.dev

docker push ${AZTAG}:latest
docker push ${TFTAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}
docker push ${DEVENV}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}

