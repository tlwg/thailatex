EXTRA_DIST = thai-latex-setup.el

emacslispdir = @emacsdir@/site-lisp
emacslisp_DATA = thai-latex-setup.el

EMACS_SITE_START=$(DESTDIR)$(emacslispdir)/site-start.el

install-data-hook:
	@if test -z "$(DESTDIR)" ; then                                       \
	  if [ -f $(EMACS_SITE_START) ] ; then                                \
	    sed -e '/thai-latex-setup/d' $(EMACS_SITE_START)                  \
	      > /tmp/tmp.$$$$ ;                                               \
	    mv /tmp/tmp.$$$$ $(EMACS_SITE_START) ;                            \
	  fi ;                                                                \
	  echo '(load-library "thai-latex-setup")' >> $(EMACS_SITE_START) ;   \
	else                                                                  \
	  echo "***" ;                                                        \
	  echo "*** Warning: Emacs site-start.el not patched" ;               \
	  echo "***" ;                                                        \
	  echo "*** update the file on the target system" ;                   \
	  echo "*** using 'sync-thailatex install'" ;                         \
	  echo "***" ;                                                        \
	fi


uninstall-hook:
	if [ -f $(EMACS_SITE_START) ] ; then \
	  sed -e '/thai-latex-setup/d' $(EMACS_SITE_START) \
	    > /tmp/tmp.$$$$ ; \
	  mv /tmp/tmp.$$$$ $(EMACS_SITE_START) ; \
	fi

