PDF_NAME=oauth2.pdf
GARBAGE=./build

$(PDF_NAME): build oauth2.tex
	xelatex -q -output-directory=$(GARBAGE) oauth2.tex
	rm -f ./*.pdf
	cp $(GARBAGE)/oauth2.pdf ./$(PDF_NAME)

build:
	mkdir build
