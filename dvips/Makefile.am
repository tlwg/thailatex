EXTRA_DIST = TeXTIS.enc dbttx.enc addpsfont.sh rmpsfont.sh

texmfdir = @texmfdir@
dvipsdir = /dvips/base

DVIPS_TARGETS = TeXTIS.enc dbttx.enc

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(texmfdir)$(dvipsdir)
	for i in $(DVIPS_TARGETS) ; do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(DESTDIR)$(texmfdir)$(dvipsdir) ; \
	done
	DVIPSDIR=$(DESTDIR)$(texmfdir)$(dvipsdir) $(srcdir)/addpsfont.sh
 
uninstall-local:
	for i in $(DVIPS_TARGETS) ; do \
	  $(RM) $(DESTDIR)$(texmfdir)$(dvipsdir)/$$i ; \
	done
	DVIPSDIR=$(DESTDIR)$(texmfdir)$(dvipsdir) $(srcdir)/rmpsfont.sh
