EXTRA_DIST = LICENSE thailatex.spec.in autogen.sh
SUBDIRS = babel dvips emacs fonts scripts debian doc

DISTCLEANFILES = thailatex.spec

docdir = @docdir@

pkgdocdir = $(docdir)/@PACKAGE@
pkgdoc_DATA = LICENSE README

install-data-local:
	texhash

uninstall-local:
	texhash

