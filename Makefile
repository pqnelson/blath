TEX=pdflatex
FILE=blog

all:
	$(TEX) $(FILE)
	$(TEX) $(FILE)

html:
	python3 ./latex2wp/latex2wp/main.py $(FILE).tex