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

# thailatex CTAN distribution
#
# TDS Zip targets http://www.ctan.org/tex-archive/install/language/thai
# CTAN Zip targets http://www.ctan.org/tex-archive/language/thai/thailatex
#
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

# babel-thai CTAN distribution
#
# Targets:
#   http://www.ctan.org/tex-archive/macros/latex/required/babel/contrib/thai
#
BABEL_PKG = babel-thai
babel_thai_tgz = $(BABEL_PKG)-$(VERSION).tar.gz
babel_thai_zip = $(BABEL_PKG)-$(VERSION).zip

babel_thai_distdir = $(BABEL_PKG)-$(VERSION)
babel_thai_builddir = $(BABEL_PKG)-build

BABEL_SRC_FILES = \
	babel/thai.dtx \
	babel/thai.ins \
	babel/lthenc.def \
	babel/tis620.def \
	$(NULL)

BABEL_BUILT_FILES = \
	babel/thai.pdf \
	$(NULL)

inst-babel-thai:
	rm -rf $(babel_thai_distdir)
	mkdir $(babel_thai_distdir)
	for f in $(BABEL_SRC_FILES); do \
	  cp $(top_srcdir)/$$f $(babel_thai_distdir) ; \
	done
	rm -rf $(babel_thai_builddir)
	mkdir $(babel_thai_builddir)
	confdir=`cd $(top_srcdir) && pwd` \
	  && cd $(babel_thai_builddir) \
	  && $$confdir/configure \
	  && $(MAKE) $(AM_MAKEFLAGS)
	for f in $(BABEL_BUILT_FILES); do \
	  cp $(babel_thai_builddir)/$$f $(babel_thai_distdir) ; \
	done

dist-babel-thai-tgz: inst-babel-thai
	rm -f $(babel_thai_tgz)
	tar cf - $(babel_thai_distdir) | gzip -9 -c > $(babel_thai_tgz)
	rm -rf $(babel_thai_distdir)
	rm -rf $(babel_thai_builddir)

dist-babel-thai-zip: inst-babel-thai
	rm -f $(babel_thai_zip)
	zip -r $(babel_thai_zip) $(babel_thai_distdir)
	rm -rf $(babel_thai_distdir)
	rm -rf $(babel_thai_builddir)

dist-babel-thai: dist-babel-thai-zip

.PHONY: dist-ctan dist-ctan-tgz dist-ctan-zip dist-tds dist-tds-tgz dist-tds-zip inst-tds
.PHONY: dist-babel-thai dist-babel-thai-tgz dist-babel-thai-zip inst-babel-thai
