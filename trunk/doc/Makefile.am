EXTRA_DIST = orchid.tex

docdir = @docdir@

pkgdocdir = $(docdir)/@PACKAGE@

install-data-local: orchid.ps orchid.pdf
	$(INSTALL) -d $(DESTDIR)$(pkgdocdir)
	$(INSTALL_DATA) $(srcdir)/orchid.tex $(DESTDIR)$(pkgdocdir)
	$(INSTALL_DATA) orchid.ps $(DESTDIR)$(pkgdocdir)
	$(INSTALL_DATA) orchid.pdf $(DESTDIR)$(pkgdocdir)

uninstall-local:
	$(RM) $(DESTDIR)$(pkgdocdir)/orchid.tex
	$(RM) $(DESTDIR)$(pkgdocdir)/orchid.ps
	$(RM) $(DESTDIR)$(pkgdocdir)/orchid.pdf

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
	$(SWATH) -f latex < $(srcdir)/orchid.tex > orchid.ttex
