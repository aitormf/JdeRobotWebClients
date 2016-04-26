LATEX=pdflatex

all: *.tex
	${LATEX} memoria
	bibtex memoria
	${LATEX} memoria
	
ps: memoria.tex
	dvips memoria.dvi
	gv memoria.ps

pdf: memoria.tex
	xpdf memoria.pdf

#biblio-memoria.bib: memoria.aux biblio-memoria.bib
#	bibtex memoria

#memoria.aux: memoria.tex
#	pdflatex memoria

clean: 
	rm -f *.aux *.log *.lot *.lof *.out memoria.pdf
release: 
	tar -zcvf newrelease.tgz *.tex img/ Makefile named.sty biblio-memoria.bib named.bst
