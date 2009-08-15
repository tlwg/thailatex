EXTRA_DIST = HISTORY COPYING.fonts thailatex.spec.in
SUBDIRS = babel emacs fonts scripts doc

DISTCLEANFILES = thailatex.spec

doc_DATA = README

#install-data-hook:
#	@TEXHASH@

#uninstall-hook:
#	@TEXHASH@

tdsdist = $(PACKAGE)-$(VERSION).tds.tar.gz
ctandist = $(PACKAGE)-$(VERSION).ctan.tar.gz

tdsdistdir = $(PACKAGE)-$(VERSION)-tds

dist-tds:
	rm -rf $(tdsdistdir)
	mkdir $(tdsdistdir)
	confdir=`cd $(top_srcdir) && pwd` \
	  && cd $(tdsdistdir) \
	  && $$confdir/configure --prefix=/usr \
	       --with-texmfdir=/ --docdir=/doc/latex/$(PACKAGE) \
	  && $(MAKE) $(AM_MAKEFLAGS) \
	  && $(MAKE) $(AM_MAKEFLAGS) DESTDIR=`pwd`/inst install \
	  && rm -rf inst/usr
	cd $(tdsdistdir)/inst \
	  && tar cf - * | gzip -9 -c > ../../$(tdsdist)
	rm -rf $(tdsdistdir)

dist-ctan: dist-tds distdir
	tar xzOf $(tdsdist) doc/latex/thailatex/thai.pdf \
	  > $(distdir)/doc/thai.pdf
	tar cf - $(tdsdist) $(distdir) | gzip -9 -c > $(ctandist)
	$(am__remove_distdir)

.PHONY: dist-ctan dist-tds
