EXTRA_DIST = LICENSE thailatex.spec.in autogen.sh
SUBDIRS = babel dvips emacs fonts scripts debian doc

DISTCLEANFILES = thailatex.spec

docdir = @docdir@

pkgdocdir = $(docdir)/@PACKAGE@

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(pkgdocdir)
	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(pkgdocdir)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(pkgdocdir)

uninstall-local:
	$(RM) $(DESTDIR)$(pkgdocdir)/LICENSE
	$(RM) $(DESTDIR)$(pkgdocdir)/README
	$(RMDIR) $(DESTDIR)$(pkgdocdir)	
