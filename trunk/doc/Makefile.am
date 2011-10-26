DOC_FILES = orchid.tex utf-example.tex

examplesdir = $(docdir)/examples
examples_DATA = $(DOC_FILES)

EXTRA_DIST = $(DOC_FILES) $(check_SCRIPTS)

CLEANFILES = *.log *.aux *.ttex *.pdf

SUFFIXES = .tex .pdf

.tex.pdf: 
	if test "x$(SWATH)" != "xno" ; then \
	  $(SWATH) -f latex < $< > $@.ttex ; \
	elif test "x$(CTTEX)" != "xno" ; then \
	  $(CTTEX) -W < $< > $@.ttex ; \
	else \
	  cp $< $@.ttex ; \
	fi
	$(PDFLATEX) $@.ttex
	$(PDFLATEX) $@.ttex
	mv $@.pdf $@

