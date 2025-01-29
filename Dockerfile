# FROM ghcr.io/void-linux/void-musl-full AS base
FROM neovim-base:0.1.8 AS base

# Set image locale.
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV TZ=Europe/Paris
ENV TERM=xterm-256color
ENV CC=tcc

RUN xbps-install -Syu

WORKDIR /root
RUN mkdir .config
RUN git clone -b docker https://github.com/uninhm/neovim-config.git ~/.config/nvim
RUN nvim --headless +PlugInstall +qa

RUN curl -L https://www.eclipse.org/downloads/download.php?file=/jdtls/snapshots/jdt-language-server-latest.tar.gz -o jdt.tar.gz
RUN mkdir -p .local/share/jdt
WORKDIR /root/.local/share/jdt
RUN tar xvf /root/jdt.tar.gz
WORKDIR /root
RUN rm /root/jdt.tar.gz

ENV PATH="$PATH:/usr/lib/jvm/default-jre/bin"
ENV PATH="$PATH:/root/.local/share/jdt/bin"
