ARG UBUNTU_VERSION=latest
FROM mcr.microsoft.com/devcontainers/base:ubuntu-$UBUNTU_VERSION

RUN echo "UTC" > /etc/timezone

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt install -y \
  pre-commit \
  vim \
  sudo \
  htop \
  tree \
  make \
  nodejs \
  neovim \
  ripgrep \
  jq

USER vscode

# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
  -p colored-man-pages \
  -p git \
  -p https://github.com/zsh-users/zsh-completions \
  -p https://github.com/zsh-users/zsh-autosuggestions

RUN git clone https://github.com/NvChad/NvChad ~/.config/nvim

ENV SHELL /usr/bin/zsh
