UBUNTU_VERSION="22.04"
TERRAFORM_VERSION="1.3.10"
TERRAFORM_VERSION_SHA256SUM="2e3931c3db6999cdd4c7e55227cb877c6946d1f52923d7d057036d2827311402"
TERRAGRUNT_VERSION='0.45.4'
TERRAGRUNT_VERSION_SHA256SUM='06682d303d1b7560cebd80d88e4863fa333aa776e7da4560a152dc8ee5d69e0d'
GOLANG_VERSION="1.19.4"
GOLANG_SHA256SUM="c9c08f783325c4cf840a94333159cc937f05f75d36a8b307951d5bd959cf2ab8"
TFDOCS_VERSION="0.17.0"
TFSEC_VERSION="1.28.5"
TAG="r00ts/devcontainers-terraform-terratest" 

docker build --build-arg="TERRAFORM_VERSION=${TERRAFORM_VERSION}" \
  --build-arg="TERRAFORM_VERSION_SHA256SUM=${TERRAFORM_VERSION_SHA256SUM}" \
  --build-arg="TERRAGRUNT_VERSION=${TERRAGRUNT_VERSION}" \
  --build-arg="TERRAGRUNT_VERSION_SHA256SUM=${TERRAGRUNT_VERSION_SHA256SUM}" \
  --build-arg="GOLANG_VERSION=${GOLANG_VERSION}" \
  --build-arg="GOLANG_SHA256SUM=${GOLANG_SHA256SUM}" \
  --build-arg="TFDOCS_VERSION=${TFDOCS_VERSION}" \
  --build-arg="TFSEC_VERSION=${TFSEC_VERSION}" \
  --build-arg="UBUNTU_VERSION=${UBUNTU_VERSION}" \
  --tag=${TAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION} .

docker push ${TAG}:${TERRAFORM_VERSION}-${TERRAGRUNT_VERSION}