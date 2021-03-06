FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN yes | unminimize
RUN apt install -y      \
    sudo                \
    tmux                \
    vim                 \
    wget                \
    binutils            \
    file                \
    build-essential     \
    cmake               \
    ninja-build         \
    python              \
    python3             \
    python3-pip         \
    git                 \
    flex                \
    bison               \
    gcc                 \
    gdb                 \
    htop

RUN useradd -m dev && echo "dev:dev" | chpasswd && adduser dev sudo

USER dev
WORKDIR /home/dev
RUN  cp /etc/skel/.bashrc ~

RUN git config --global user.name "Bernardo Covas"
RUN git config --global user.email "bernardo.covas@outlook.com"
