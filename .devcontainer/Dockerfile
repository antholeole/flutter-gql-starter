FROM ubuntu:20.04

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Ensure apt is in non-interactive to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies.
RUN apt-get -y update --no-install-recommends \
    && apt-get -y install --no-install-recommends \
    curl \
    git \
    ca-certificates \
    && apt-get autoremove -y \
    && apt-get clean -y


# Node.js for postgraphile
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y update --no-install-recommends \
    && apt-get -y install --no-install-recommends nodejs \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && apt-get install unzip -y

# Create the user
RUN useradd -rm -d /home/$USERNAME -s /bin/bash -g root -G sudo -u $USER_UID $USERNAME
ENV DEBIAN_FRONTEND=dialog

USER $USERNAME

# set path of flutter
ENV PATH="/home/vscode/flutter/bin:${PATH}"