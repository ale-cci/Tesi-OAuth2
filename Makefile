PDF_NAME=res/oauth2.pdf
GARBAGE=./build

$(PDF_NAME): build oauth2.tex
	xelatex -q -output-directory=$(GARBAGE) oauth2.tex
	rm -f ./*.pdf
	mkdir -p res
	cp $(GARBAGE)/oauth2.pdf ./$(PDF_NAME)

build:
	mkdir build
