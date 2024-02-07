TERRAFORM_VERSION="1.3.10"
TERRAGRUNT_VERSION='0.45.4'
TAG="r00ts/devcontainers-aws-terraform" 

docker build  --build-arg="IMAGE_VERSION=${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}" \
  --tag=${TAG}:${TERRAFORM_VERSION} .

docker push ${TAG}:${TERRAFORM_VERSION}