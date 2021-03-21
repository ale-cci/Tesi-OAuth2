FROM ubuntu:20.04

# Install XeTeX
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get --no-install-recommends install -y \
        fonts-roboto \
        rubber\
        texlive-xetex \
        texlive-fonts-recommended \
        texlive-latex-recommended \
        texlive-latex-extra \
        lmodern && \
        \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD rubber --pdf "$PDFNAME" && rubber --clean "$PDFNAME"
