FROM debian:buster

# Install XeTeX
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install -y \
        fonts-roboto \
        texlive-xetex \
        texlive-latex-recommended \
        texlive-latex-extra \
	lmodern && \
    \
    echo "===> Clean up" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



WORKDIR /latex
RUN mkdir -p ./build
COPY ./style.cls .
COPY ./img ./img
COPY ./oauth2.tex .

CMD xelatex -output-directory=./build ./oauth2.tex && cp ./build/oauth2.pdf /res/oauth2.pdf
