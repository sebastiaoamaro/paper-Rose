PAPER = main
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard Figures/*.pdf Figures/*.png Figures/*.eps)

.PHONY: all clean

all: out/$(PAPER).pdf

out/$(PAPER).pdf: $(TEX) $(BIB)
	mkdir -p out
	echo $(FIGS)
	pdflatex -output-directory=out $(PAPER)
	bibtex out/$(PAPER)
	pdflatex -output-directory=out $(PAPER)
	pdflatex -output-directory=out $(PAPER)

clean:
	rm -f out/*
