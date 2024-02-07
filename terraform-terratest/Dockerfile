ARG UBUNTU_VERSION=latest
FROM r00ts/devcontainers-ubuntu-base:$UBUNTU_VERSION

USER root

ARG TERRAFORM_VERSION
ARG TERRAFORM_VERSION_SHA256SUM
ARG TERRAGRUNT_VERSION
ARG TERRAGRUNT_VERSION_SHA256SUM
ARG GOLANG_VERSION
ARG GOLANG_SHA256SUM
ARG TFDOCS_VERSION
ARG TFSEC_VERSION

ENV TERRAFORM_VERSION="${TERRAFORM_VERSION}"
ENV TERRAFORM_VERSION_SHA256SUM="${TERRAFORM_VERSION_SHA256SUM}"
ENV TERRAGRUNT_VERSION="${TERRAGRUNT_VERSION}"
ENV TERRAGRUNT_VERSION_SHA256SUM="${TERRAGRUNT_VERSION_SHA256SUM}"
ENV GOLANG_VERSION="${GOLANG_VERSION}"
ENV GOLANG_SHA256SUM="${GOLANG_SHA256SUM}"
ENV TFDOCS_VERSION="${TFDOCS_VERSION}"
ENV TFSEC_VERSION="${TFSEC_VERSION}"

# Install Terraform
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform_linux_amd64.zip
RUN echo "${TERRAFORM_VERSION_SHA256SUM} terraform_linux_amd64.zip" > terraform_SHA256SUMS
RUN sha256sum -c terraform_SHA256SUMS --status
RUN unzip terraform_linux_amd64.zip -d /usr/bin
RUN chmod +x /usr/bin/terraform
RUN rm  terraform_SHA256SUMS  terraform_linux_amd64.zip

#Install Terragrunt
RUN wget -q https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -O terragrunt_linux_amd64
RUN echo "${TERRAGRUNT_VERSION_SHA256SUM} terragrunt_linux_amd64" > terragrunt_SHA256SUMS
RUN sha256sum -c terragrunt_SHA256SUMS --status
RUN mv terragrunt_linux_amd64 /usr/bin/terragrunt
RUN chmod +x /usr/bin/terragrunt
RUN rm terragrunt_SHA256SUMS

# Install Go
RUN curl -O -L https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN echo "${GOLANG_SHA256SUM} go${GOLANG_VERSION}.linux-amd64.tar.gz" > go_SHA256SUMS
RUN sha256sum -c go_SHA256SUMS --status
RUN tar -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz -C /usr/bin
RUN rm go_SHA256SUMS go${GOLANG_VERSION}.linux-amd64.tar.gz

# Install terraform-docs
RUN wget https://github.com/terraform-docs/terraform-docs/releases/download/v${TFDOCS_VERSION}/terraform-docs-v${TFDOCS_VERSION}-linux-amd64.tar.gz -O terraform-docs-v${TFDOCS_VERSION}-linux-amd64.tar.gz
RUN tar -xvf terraform-docs-v${TFDOCS_VERSION}-linux-amd64.tar.gz
RUN sudo mv terraform-docs /usr/bin

# Install tfsec
RUN wget https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 -O tfsec
RUN chmod +x tfsec
RUN sudo mv tfsec /usr/bin
