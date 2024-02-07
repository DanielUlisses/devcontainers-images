ARG IMAGE_VERSION=latest
FROM r00ts/devcontainers-terraform-terratest:$IMAGE_VERSION

USER root

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

# Install aws-sso-creds
RUN wget https://github.com/jaxxstorm/aws-sso-creds/releases/download/v1.5.0/aws-sso-creds-v1.5.0-linux-amd64.tar.gz -O aws-sso-creds-v1.5.0-linux-amd64.tar.gz
RUN tar -xvf aws-sso-creds-v1.5.0-linux-amd64.tar.gz
RUN sudo mv aws-sso-creds /usr/bin
