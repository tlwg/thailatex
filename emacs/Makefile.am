EXTRA_DIST = thai-latex-setup.el addmacro.sh rmmacro.sh

emacsdir = @emacsdir@
emacslispdir = /site-lisp

EMACS_TARGETS = thai-latex-setup.el

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(emacsdir)$(emacslispdir)
	for i in $(EMACS_TARGETS) ; do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(DESTDIR)$(emacsdir)$(emacslispdir) ; \
	done
	EMACSLISPDIR=$(DESTDIR)$(emacsdir)$(emacslispdir) $(srcdir)/addmacro.sh
 
uninstall-local:
	for i in $(EMACS_TARGETS) ; do \
	  $(RM) $(DESTDIR)$(emacsdir)$(emacslispdir)/$$i ; \
	done
	EMACSLISPDIR=$(DESTDIR)$(emacsdir)$(emacslispdir) $(srcdir)/rmmacro.sh
