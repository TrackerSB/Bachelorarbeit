FILENAME=ClassicThesis

$(FILENAME).pdf: $(FILENAME).tex
	latexmk -pdf $(FILENAME).tex

.PHONY: clean
clean:
	rm -f *.aux *.toc *.out *.nav *.log *.snm *.pdf *.bbl *.blg *.bcf *.run.xml *.fls *.fdb_latexmk *.lot *.lof *-blx.bib *.lol
	rm -rf */*.aux

.PHONY: show
show: $(FILENAME).pdf
	okular $(FILENAME).pdf

.PHONY: present
present: $(FILENAME).pdf
	pdfpc $(FILENAME).pdf
