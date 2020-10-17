PDF_NAME=res/oauth2.pdf
GARBAGE=./build
SRC=./latex

$(PDF_NAME): build ./$(SRC)/oauth2.tex
	xelatex -q -output-directory=$(GARBAGE) ./$(SRC)/oauth2.tex
	rm -f ./*.pdf
	mkdir -p res
	cp $(GARBAGE)/oauth2.pdf ./$(PDF_NAME)
	git add ./$(PDF_NAME)

build:
	mkdir build
