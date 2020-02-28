MAINDOC = thesis
DOCS = $(wildcard *.tex)
DVIFILE = $(patsubst %,%.dvi,$(MAINDOC))
PSFILE = $(patsubst %,%.ps,$(MAINDOC))
PDFFILE = $(patsubst %,%.pdf,$(MAINDOC))
TEXCODE = $(patsubst code/%.cc, code/%.tex, $(wildcard code/*.cc))

all:  $(PDFFILE)

$(DVIFILE): $(TEXCODE) ${DOCS}
$(PDFFILE): $(TEXCODE) ${DOCS}

%.pdf: %.tex
	pdflatex --shell-escape $*
	bibtex $*
	pdflatex --shell-escape $*
	pdflatex --shell-escape $*

clean:
	@rm -f *.bbl *.blg *.dvi *~ *.ps *.aux *.log *.pdf *.bak *.toc *.lof *.lot *.out
