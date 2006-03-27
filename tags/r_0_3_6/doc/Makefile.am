DOC_FILES = orchid.tex teststd.tex

docdir = @docdir@

pkgdocdir = $(docdir)/@PACKAGE@/examples
pkgdoc_DATA = $(DOC_FILES)
# pkgdoc_DATA = orchid.tex orchid.ps orchid.pdf

TESTS = test-orchid.sh test-teststd.sh

check_SCRIPTS = test-orchid.sh test-teststd.sh

EXTRA_DIST = $(DOC_FILES) $(check_SCRIPTS)

clean-local:
	$(RM) *.log *.aux *.ttex *.dvi

distclean-local: clean
	$(RM) *.ps *.pdf

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

