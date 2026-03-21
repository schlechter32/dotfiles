FROM ubuntu:24.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      bubblewrap \
      build-essential \
      ca-certificates \
      curl \
      file \
      fzf \
      git \
      git-lfs \
      jq \
      less \
      libgmt-dev \
      neovim \
      pkg-config \
      procps \
      ripgrep \
      sudo \
      tmux \
      unzip \
      zsh \
    && rm -rf /var/lib/apt/lists/*

RUN usermod -l dev -d /home/dev -m ubuntu \
    && groupmod -n dev ubuntu \
    && echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/dev \
    && chmod 0440 /etc/sudoers.d/dev

USER dev
WORKDIR /workspace
