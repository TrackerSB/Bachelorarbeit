FILENAME=ClassicThesis

$(FILENAME).pdf: $(FILENAME).tex
	latexmk -pdf $(FILENAME).tex

.PHONY: clean
clean:
	rm -f *.toc *.aux *.out *.nav *.log *.snm *.pdf *.bbl *.blg *.bcf *.run.xml *.fls *.fdb_latexmk

.PHONY: show
show: $(FILENAME).pdf
	okular $(FILENAME).pdf

.PHONY: present
present: $(FILENAME).pdf
	pdfpc $(FILENAME).pdf
