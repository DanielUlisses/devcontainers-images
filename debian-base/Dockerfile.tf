ARG BASE_IMAGE
FROM ${BASE_IMAGE} as tf

ARG GOLANG_VERSION
ARG TERRAFORM_VERSION
ARG TERRAGRUNT_VERSION
ARG TFDOCS_VERSION
ARG TFSEC_VERSION

# Install Golang
RUN curl -O -L https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN tar -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz -C /usr/local
RUN rm go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin

# Terratest Config
ARG GOPROJECTPATH=/go/src/app
RUN GO111MODULE=on

# Install Terraform
RUN curl -O -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin
RUN chmod +x /usr/bin/terraform
RUN rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install Terragrunt
RUN curl -O -L https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64
RUN mv terragrunt_linux_amd64 /usr/bin/terragrunt
RUN chmod +x /usr/bin/terragrunt

# Install terraform-docs
RUN curl -O -L https://github.com/terraform-docs/terraform-docs/releases/download/v${TFDOCS_VERSION}/terraform-docs-v${TFDOCS_VERSION}-linux-amd64.tar.gz
RUN tar -xvf terraform-docs-v${TFDOCS_VERSION}-linux-amd64.tar.gz
RUN sudo mv terraform-docs /usr/bin

# Install tfsec
RUN curl -O -L https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64
RUN chmod +x tfsec-linux-amd64
RUN sudo mv tfsec-linux-amd64 /usr/bin/tfsec
