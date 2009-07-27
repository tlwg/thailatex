DOC_FILES = orchid.tex teststd.tex utf-example.tex

examplesdir = $(docdir)/examples
examples_DATA = $(DOC_FILES)

TESTS = test-orchid.sh test-teststd.sh test-utf.sh

check_SCRIPTS = test-orchid.sh test-teststd.sh test-utf.sh

EXTRA_DIST = $(DOC_FILES) $(check_SCRIPTS)

CLEANFILES = *.log *.aux *.ttex *.dvi *.ps *.pdf

SUFFIXES = .tex .dvi .ps .pdf

.dvi.ps:
	$(DVIPS) $< -o $@

.ps.pdf:
	$(PS2PDF) $<

.tex.dvi:
	if (which $(SWATH) > /dev/null) ; then \
	  $(SWATH) -f latex < $< > $@.ttex ; \
	elif (which $(CTTEX) > /dev/null) ; then \
	  $(CTTEX) -W < $< > $@.ttex ; \
	fi
	$(LATEX) $@.ttex
	$(LATEX) $@.ttex
	mv $@.dvi $@

