EXTRA_DIST = thai.ldf thai.sty thswitch.sty lthenc.def lthdbttx.fd lthnorasi.fd

texmfdir = @texmfdir@
babeldir = /tex/generic/babel

BABEL_TARGETS = thai.ldf thai.sty thswitch.sty lthenc.def lthdbttx.fd lthnorasi.fd

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(texmfdir)$(babeldir)
	for i in $(BABEL_TARGETS) ; do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(DESTDIR)$(texmfdir)$(babeldir) ; \
	done	

uninstall-local:
	for i in $(BABEL_TARGETS) ; do \
	  $(RM) $(DESTDIR)$(texmfdir)$(babeldir)/$$i ; \
	done
