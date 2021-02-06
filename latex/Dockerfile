FROM debian:buster

# Install XeTeX
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get --no-install-recommends install -y \
        fonts-roboto \
        rubber\
        texlive-xetex \
        texlive-latex-recommended \
        texlive-latex-extra \
        lmodern && \
        \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD rubber --pdf oauth2 && rubber --clean oauth2
