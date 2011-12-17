EXTRA_DIST = HISTORY
SUBDIRS = babel emacs fonts scripts doc

DISTCLEANFILES = thailatex.spec \
	$(tdsdist_tgz) $(ctandist_tgz) \
	$(tdsdist_zip) $(ctandist_zip)

doc_DATA = README

install-data-hook:
	@if test -z "$(DESTDIR)" ; then                                       \
	  $(TEXHASH) ;                                                        \
	else                                                                  \
	  echo "***" ;                                                        \
	  echo "*** Warning: TeX index not updated" ;                         \
	  echo "***" ;                                                        \
	  echo "*** update it on the target system" ;                         \
	  echo "*** using $(TEXHASH) command" ;                               \
	  echo "***" ;                                                        \
	fi
 
uninstall-hook:
	$(TEXHASH)

tdsdist_tgz = $(PACKAGE)-$(VERSION).tds.tar.gz
ctandist_tgz = $(PACKAGE)-$(VERSION).ctan.tar.gz

tdsdist_zip = $(PACKAGE)-$(VERSION).tds.zip
ctandist_zip = $(PACKAGE)-$(VERSION).ctan.zip

tdsdistdir = $(PACKAGE)-$(VERSION)-tds

inst-tds:
	rm -rf $(tdsdistdir)
	mkdir $(tdsdistdir)
	confdir=`cd $(top_srcdir) && pwd` \
	  && cd $(tdsdistdir) \
	  && $$confdir/configure --prefix=/usr \
	       --with-texmfdir=/ --docdir=/doc/latex/$(PACKAGE) \
	  && $(MAKE) $(AM_MAKEFLAGS) \
	  && $(MAKE) $(AM_MAKEFLAGS) DESTDIR=`pwd`/inst install \
	  && rm -rf inst/usr \
	  && mkdir -p inst/source/latex/$(PACKAGE) \
	  && make distdir distdir=inst/source/latex/$(PACKAGE)

dist-tds-tgz: inst-tds
	cd $(tdsdistdir)/inst \
	  && tar cf - * | gzip -9 -c > ../../$(tdsdist_tgz)
	rm -rf $(tdsdistdir)

dist-tds-zip: inst-tds
	cd $(tdsdistdir)/inst \
	  && zip -r ../../$(tdsdist_zip) *
	rm -rf $(tdsdistdir)

dist-tds: dist-tds-zip

dist-ctan-tgz: dist-tds-tgz distdir
	tar xzOf $(tdsdist_tgz) doc/latex/thailatex/thai.pdf \
	  > $(distdir)/doc/thai.pdf
	tar cf - $(tdsdist_tgz) $(distdir) | gzip -9 -c > $(ctandist_tgz)
	$(am__remove_distdir)

dist-ctan-zip: dist-tds-zip distdir
	unzip -p $(tdsdist_zip) doc/latex/thailatex/thai.pdf \
	  > $(distdir)/doc/thai.pdf
	zip -r $(ctandist_zip) $(tdsdist_zip) $(distdir)
	$(am__remove_distdir)

dist-ctan: dist-ctan-zip

.PHONY: dist-ctan dist-ctan-tgz dist-ctan-zip dist-tds dist-tds-tgz dist-tds-zip inst-tds
