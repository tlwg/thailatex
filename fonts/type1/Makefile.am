EXTRA_DIST = dbtt.pfb dbttb.pfb dbttbi.pfb dbtti.pfb norasi_b.pfb norasi_bi.pfb norasi_i.pfb norasi_n.pfb

texmfdir = @texmfdir@
type1dir = /fonts/type1/public/thai

TYPE1_TARGETS = dbtt.pfb dbttb.pfb dbttbi.pfb dbtti.pfb norasi_b.pfb norasi_bi.pfb norasi_i.pfb norasi_n.pfb                                         
install-data-local:
	$(INSTALL) -d $(DESTDIR)$(texmfdir)$(type1dir)
	for i in $(TYPE1_TARGETS) ; do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(DESTDIR)$(texmfdir)$(type1dir) ; \
	done
 
uninstall-local:
	for i in $(TYPE1_TARGETS) ; do \
	  $(RM) $(DESTDIR)$(texmfdir)$(type1dir)/$$i ; \
	done

