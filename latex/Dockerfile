FROM debian:buster

# Install XeTeX
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get --no-install-recommends install -y \
        fonts-roboto \
        texlive-xetex \
        texlive-latex-recommended \
        texlive-latex-extra \
        lmodern && \
        \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*



WORKDIR /data
RUN mkdir -p /build
VOLUME /build

CMD ls /data && \
    xelatex -output-directory=/build ./oauth2.tex \
    xelatex -output-directory=/build ./oauth2.tex \
    && cp /build/oauth2.pdf /data/oauth2.pdf
