FILENAME=main
$(FILENAME).pdf: $(FILENAME).tex references.bib
	pdflatex $(FILENAME).tex
	biber $(FILENAME).bcf
	pdflatex $(FILENAME).tex
	pdflatex $(FILENAME).tex


.PHONY: clean
clean:
	rm *.toc *.aux *.out *.nav *.log *.snm *.pdf *.bbl *.blg *.bcf *.run.xml

.PHONY: show
show: $(FILENAME).pdf
	okular $(FILENAME).pdf

.PHONY: present
present: $(FILENAME).pdf
	pdfpc $(FILENAME).pdf
