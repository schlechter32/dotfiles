FROM ubuntu:24.04

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000

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

RUN groupadd -f --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /usr/bin/zsh ${USERNAME} 2>/dev/null \
    || usermod -s /usr/bin/zsh -d /home/${USERNAME} ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

USER ${USERNAME}
WORKDIR /workspace
