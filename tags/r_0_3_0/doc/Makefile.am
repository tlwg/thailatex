DOC_FILES = orchid.tex teststd.tex

EXTRA_DIST = $(DOC_FILES)

docdir = @docdir@

pkgdocdir = $(docdir)/@PACKAGE@/examples
pkgdoc_DATA = $(DOC_FILES)
# pkgdoc_DATA = orchid.tex orchid.ps orchid.pdf

clean-local:
	$(RM) *.log *.aux *.dvi

distclean-local: clean
	$(RM) *.ps *.pdf *.ttex

orchid.ps: orchid.dvi
	$(DVIPS) orchid.dvi -o orchid.ps

orchid.pdf: orchid.ps
	$(PS2PDF) orchid.ps

orchid.dvi: orchid.ttex
	$(LATEX) orchid.ttex
	$(LATEX) orchid.ttex
	$(LATEX) orchid.ttex
	$(LATEX) orchid.ttex

orchid.ttex: orchid.tex
	if (which $(SWATH) > /dev/null) ; then \
	  $(SWATH) -f latex < orchid.tex > orchid.ttex ; \
	elif (which $(CTTEX) > /dev/null) ; then \
	  $(CTTEX) -W < orchid.tex > orchid.ttex ; \
	fi
