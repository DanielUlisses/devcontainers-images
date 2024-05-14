FROM mcr.microsoft.com/devcontainers/base:bookworm

# Install additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt install -y \
    automake \
    autoconf \
    cmake \
    clang \
    fzf \
    gettext \
    gzip \
    htop \
    jq \
    nodejs \
    python3-pip \
    pre-commit \
    python3-neovim \
    python3-pep8 \
    ripgrep \
    tree \
    tmux \
    zsh

RUN curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -C /opt -xzf nvim-linux64.tar.gz
RUN ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/nvim

ARG UNAME=vscode
# ARG UID=1000
# ARG GID=1000
# RUN groupadd -g $GID -o $UNAME
# RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
ENV SHELL /bin/zsh

RUN mkdir -p ~/.local/share/zsh/plugins
RUN ln -s /usr/share/zsh/plugins/powerlevel10k ~/.local/share/zsh/plugins/
