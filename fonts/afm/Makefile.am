EXTRA_DIST = dbtt.afm \
	dbttb.afm \
	dbttbi.afm \
	dbtti.afm \
	norasi_b.afm \
	norasi_bi.afm \
	norasi_i.afm \
	norasi_n.afm

texmfdir = @texmfdir@
afmdir = /fonts/afm/public/thai
tfmdir = /fonts/tfm/public/thai
vfdir  = /fonts/vf/public/thai

TFMS = \
	dbttx.tfm \
	dbttxi.tfm \
	dbttxb.tfm \
	dbttxbi.tfm \
	norasi_b.tfm \
	norasi_bi.tfm \
	norasi_i.tfm \
	norasi_n.tfm

VFS= \
	dbttx.vf \
	dbttxi.vf \
	dbttxb.vf \
	dbttxbi.vf \
	norasi_b.vf \
	norasi_bi.vf \
	norasi_i.vf \
	norasi_n.vf

AFM_TARGETS = dbtt.afm \
	dbttb.afm \
	dbttbi.afm \
	dbtti.afm \
	norasi_b.afm \
	norasi_bi.afm \
	norasi_i.afm \
	norasi_n.afm

TFM_TARGETS = dbtt.tfm \
	dbttb.tfm \
	dbttbi.tfm \
	dbtti.tfm \
	dbttx.tfm \
	dbttxb.tfm \
	dbttxbi.tfm \
	dbttxi.tfm \
	norasi_b.tfm \
	norasi_bi.tfm \
	norasi_i.tfm \
	norasi_n.tfm \
	rnorasi_b.tfm \
	rnorasi_bi.tfm \
	rnorasi_i.tfm \
	rnorasi_n.tfm

VF_TARGETS = dbttx.vf \
	dbttxb.vf \
	dbttxbi.vf \
	dbttxi.vf \
	norasi_b.vf \
	norasi_bi.vf \
	norasi_i.vf \
	norasi_n.vf

all-local: $(TFMS) $(VFS) TeXTIS.enc dbttx.enc

TeXTIS.enc:
	$(RM) $@
	$(LN_S) $(top_srcdir)/dvips/TeXTIS.enc $@

dbttx.enc:
	$(RM) $@
	$(LN_S) $(top_srcdir)/dvips/dbttx.enc $@ 

dbttx.vpl: dbtt.afm dbttx.enc
	$(AFM2TFM) $(srcdir)/dbtt.afm -v dbttx.vpl -T dbttx.enc dbtt.tfm

dbttx.tfm: dbttx.vpl
	$(VPTOVF) dbttx

dbttxb.vpl: dbttb.afm dbttx.enc
	$(AFM2TFM) $(srcdir)/dbttb.afm -v dbttxb.vpl -T dbttx.enc dbttb.tfm

dbttxb.tfm: dbttxb.vpl
	$(VPTOVF) dbttxb

dbttxbi.vpl: dbttbi.afm dbttx.enc
	$(AFM2TFM) $(srcdir)/dbttbi.afm -v dbttxbi.vpl -T dbttx.enc dbttbi.tfm

dbttxbi.tfm: dbttxbi.vpl
	$(VPTOVF) dbttxbi

dbttxi.vpl: dbtti.afm dbttx.enc
	$(AFM2TFM) $(srcdir)/dbtti.afm -v dbttxi.vpl -T dbttx.enc dbtti.tfm

dbttxi.tfm: dbttxi.vpl
	$(VPTOVF) dbttxi

norasi_b.vpl: norasi_b.afm TeXTIS.enc
	$(AFM2TFM) $(srcdir)/norasi_b.afm -v norasi_b.vpl -T TeXTIS.enc rnorasi_b.tfm

norasi_b.tfm: norasi_b.vpl
	$(VPTOVF) norasi_b

norasi_bi.vpl: norasi_bi.afm TeXTIS.enc
	$(AFM2TFM) $(srcdir)/norasi_bi.afm -v norasi_bi.vpl -T TeXTIS.enc rnorasi_bi.tfm

norasi_bi.tfm: norasi_bi.vpl
	$(VPTOVF) norasi_bi

norasi_i.vpl: norasi_i.afm TeXTIS.enc
	$(AFM2TFM) $(srcdir)/norasi_i.afm -v norasi_i.vpl -T TeXTIS.enc rnorasi_i.tfm

norasi_i.tfm: norasi_i.vpl
	$(VPTOVF) norasi_i

norasi_n.vpl: norasi_n.afm TeXTIS.enc
	$(AFM2TFM) $(srcdir)/norasi_n.afm -v norasi_n.vpl -T TeXTIS.enc rnorasi_n.tfm

norasi_n.tfm: norasi_n.vpl
	$(VPTOVF) norasi_n

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(texmfdir)$(afmdir)
	for i in $(AFM_TARGETS) ; do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(DESTDIR)$(texmfdir)$(afmdir) ; \
	done
	$(INSTALL) -d $(DESTDIR)$(texmfdir)$(tfmdir)
	for i in $(TFM_TARGETS) ; do \
	  $(INSTALL_DATA) $$i $(DESTDIR)$(texmfdir)$(tfmdir) ; \
	done
	$(INSTALL) -d $(DESTDIR)$(texmfdir)$(vfdir)
	for i in $(VF_TARGETS) ; do \
	  $(INSTALL_DATA) $$i $(DESTDIR)$(texmfdir)$(vfdir) ; \
	done
 
uninstall-local:
	for i in $(AFM_TARGETS) ; do \
	  $(RM) $(DESTDIR)$(texmfdir)$(afmdir)/$$i ; \
	done
	$(RMDIR) $(DESTDIR)$(texmfdir)$(afmdir)
	for i in $(TFM_TARGETS) ; do \
	  $(RM) $(DESTDIR)$(texmfdir)$(tfmdir)/$$i ; \
	done
	$(RMDIR) $(DESTDIR)$(texmfdir)$(tfmdir)
	for i in $(VF_TARGETS) ; do \
	  $(RM) $(DESTDIR)$(texmfdir)$(vfdir)/$$i ; \
	done
	$(RMDIR) $(DESTDIR)$(texmfdir)$(vfdir)

clean-local:
	$(RM) *.vpl

distclean-local:
	$(RM) *.vf *.tfm TeXTIS.enc dbttx.enc
