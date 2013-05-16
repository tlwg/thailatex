EXTRA_DIST = HISTORY
SUBDIRS = babel scripts doc

if ENABLE_HYPHENATION
EXTRA_DIST += README.hyphen
SUBDIRS += hyphen
endif

DIST_SUBDIRS = $(SUBDIRS)

DISTCLEANFILES = thailatex.spec \
	$(tdsdist_tgz) $(ctandist_tgz) \
	$(tdsdist_zip) $(ctandist_zip)

DISTCHECK_CONFIGURE_FLAGS = --disable-hooks

doc_DATA = README

if ENABLE_HOOKS

install-data-hook:
	@if test -z "$(DESTDIR)" ; then                                       \
	  $(TEXHASH) ;                                                        \
	else                                                                  \
	  echo "***" ;                                                        \
	  echo "*** Warning: TeX index not updated" ;                         \
	  echo "***" ;                                                        \
	  echo "*** update it on the target system" ;                         \
	  echo "*** using $(TEXHASH) command" ;          \
	  echo "***" ;                                                        \
	fi
	@echo "***"
	@echo "Almost done. See README.hyphen for further steps to"
	@echo "set up the hyphenation pattern."
	@echo "***"
 
uninstall-hook:
	$(TEXHASH)
	$(FMTUTIL) --all

endif # ENABLE_HOOKS

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
	rm -f $(tdsdist_tgz)
	cd $(tdsdistdir)/inst \
	  && tar cf - * | gzip -9 -c > ../../$(tdsdist_tgz)
	rm -rf $(tdsdistdir)

dist-tds-zip: inst-tds
	rm -f $(tdsdist_zip)
	cd $(tdsdistdir)/inst \
	  && zip -r ../../$(tdsdist_zip) *
	rm -rf $(tdsdistdir)

dist-tds: dist-tds-zip

dist-ctan-tgz: dist-tds-tgz distdir
	tar xzOf $(tdsdist_tgz) doc/latex/thailatex/thai.pdf \
	  > $(distdir)/doc/thai.pdf
	rm -f $(ctandist_tgz)
	tar cf - $(tdsdist_tgz) $(distdir) | gzip -9 -c > $(ctandist_tgz)
	$(am__remove_distdir)

dist-ctan-zip: dist-tds-zip distdir
	unzip -p $(tdsdist_zip) doc/latex/thailatex/thai.pdf \
	  > $(distdir)/doc/thai.pdf
	rm -f $(ctandist_zip)
	zip -r $(ctandist_zip) $(tdsdist_zip) $(distdir)
	$(am__remove_distdir)

dist-ctan: dist-ctan-zip

.PHONY: dist-ctan dist-ctan-tgz dist-ctan-zip dist-tds dist-tds-tgz dist-tds-zip inst-tds
