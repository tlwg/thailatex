EXTRA_DIST = thai-latex-setup.el

emacslispdir = @emacsdir@/site-lisp
emacslisp_DATA = thai-latex-setup.el

install-data-local:
# add Emacs macro for activating Thai LaTeX filter
	if [ -f $(DESTDIR)$(emacslispdir)/site-start.el ] ; then \
	  sed -e '/thai-latex-setup/d' $(DESTDIR)$(emacslispdir)/site-start.el \
	    > /tmp/tmp.$$ ; \
	  mv /tmp/tmp.$$ $(DESTDIR)$(emacslispdir)/site-start.el ; \
	fi
	echo '(load-library "thai-latex-setup")' \
	  >> $(DESTDIR)$(emacslispdir)/site-start.el

uninstall-local:
# add Emacs macro for activating Thai LaTeX filter
	if [ -f $(DESTDIR)$(emacslispdir)/site-start.el ] ; then \
	  sed -e '/thai-latex-setup/d' $(DESTDIR)$(emacslispdir)/site-start.el \
	    > /tmp/tmp.$$ ; \
	  mv /tmp/tmp.$$ $(DESTDIR)$(emacslispdir)/site-start.el ; \
	fi

