PDFLATEX=pdflatex
LATEX=latex
FILE=blog



all: from_dvi

from_dvi:
	$(LATEX) $(FILE)
	$(LATEX) $(FILE)
	dvipdfmx $(FILE).dvi

pdf_latex:
	$(PDFLATEX) $(FILE)
	$(PDFLATEX) $(FILE)

html:
	python3 ./latex2wp/latex2wp/main.py $(FILE).tex