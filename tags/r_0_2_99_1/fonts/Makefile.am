EXTRA_DIST = \
	lthuni.enc \
	dbtt.pfb \
	dbtt_b.pfb \
	dbtt_i.pfb \
	dbtt_bi.pfb \
	garuda.pfb \
	garuda_b.pfb \
	garuda_i.pfb \
	garuda_bi.pfb \
	norasi.pfb \
	norasi_b.pfb \
	norasi_i.pfb \
	norasi_bi.pfb

type1dir = @texmfdir@/fonts/type1/public/thai
afmdir = @texmfdir@/fonts/afm/public/thai
tfmdir = @texmfdir@/fonts/tfm/public/thai
vfdir  = @texmfdir@/fonts/vf/public/thai

dvipsbasedir = @texmfdir@/dvips/base
dvipsconfigdir = @texmfdir@/dvips/config

#DVIPSCONFIG=$(DESTDIR)/@texmfdir@/dvips/config/config.ps
#PDFTEXCONFIG=$(DESTDIR)/@texmfdir@/pdftex/config/pdftex.cfg
#UPDMAPCONFIG=$(DESTDIR)/@texmfdir@/web2c/updmap.cfg

dvipsbase_DATA = lthuni.enc

dvipsconfig_DATA = thai.map

type1_DATA = \
	dbtt.pfb \
	dbtt_b.pfb \
	dbtt_i.pfb \
	dbtt_bi.pfb \
	garuda.pfb \
	garuda_b.pfb \
	garuda_i.pfb \
	garuda_bi.pfb \
	norasi.pfb \
	norasi_b.pfb \
	norasi_i.pfb \
	norasi_bi.pfb

afm_DATA = \
	dbtt.afm \
	dbtt_b.afm \
	dbtt_i.afm \
	dbtt_bi.afm \
	garuda.afm \
	garuda_b.afm \
	garuda_i.afm \
	garuda_bi.afm \
	norasi.afm \
	norasi_b.afm \
	norasi_i.afm \
	norasi_bi.afm

tfm_DATA = \
	dbtt.tfm \
	dbtt_b.tfm \
	dbtt_i.tfm \
	dbtt_bi.tfm \
	garuda.tfm \
	garuda_b.tfm \
	garuda_i.tfm \
	garuda_bi.tfm \
	norasi.tfm \
	norasi_b.tfm \
	norasi_i.tfm \
	norasi_bi.tfm \
	rdbtt.tfm \
	rdbtt_b.tfm \
	rdbtt_i.tfm \
	rdbtt_bi.tfm \
	rgaruda.tfm \
	rgaruda_b.tfm \
	rgaruda_i.tfm \
	rgaruda_bi.tfm \
	rnorasi.tfm \
	rnorasi_b.tfm \
	rnorasi_i.tfm \
	rnorasi_bi.tfm

vf_DATA = \
	dbtt.vf \
	dbtt_b.vf \
	dbtt_i.vf \
	dbtt_bi.vf \
	garuda.vf \
	garuda_b.vf \
	garuda_i.vf \
	garuda_bi.vf \
	norasi.vf \
	norasi_b.vf \
	norasi_i.vf \
	norasi_bi.vf

# Local Rules

%.afm: %.pfb
	if [ ! -f $*.pfb ]; then \
	  $(LN_S) $(srcdir)/$*.pfb $*.pfb; \
	fi
	$(PF2AFM) $*

r%.tfm: %.afm lthuni.enc
%.vpl: %.afm lthuni.enc
	if [ ! -f $*.pfb ]; then \
	  $(LN_S) $(srcdir)/lthuni.enc lthuni.enc; \
	fi
	$(AFM2TFM) $*.afm -v $*.vpl -T lthuni.enc r$*.tfm \
	| $(SED) "s/$$/ <$*.pfb/" >> thai.map

%.tfm: %.vpl
	$(VPTOVF) $*

thai.map: $(tfm_DATA)
	LC_COLLATE=C sort $@ | uniq > /tmp/tmp.$$$$; mv /tmp/tmp.$$$$ $@

install-data-hook:
	$(UPDMAP) --enable Map thai.map
#	mkdir -p `dirname $(UPDMAPCONFIG)`
#	if test -f $(UPDMAPCONFIG); then \
#	  sed -e '/thailatex/d;/thai.map/d' $(UPDMAPCONFIG) > /tmp/tmp.$$$$ ; \
#	  mv -f /tmp/tmp.$$$$ $(UPDMAPCONFIG) ; \
#	fi
#	echo "% thailatex" >> $(UPDMAPCONFIG)
#	echo "Map thai.map" >> $(UPDMAPCONFIG)
#	mkdir -p `dirname $(UPDMAPCONFIG)`
#	$(UPDMAP)
#	if test -f $(DVIPSCONFIG); then \
#	  sed -e '/thailatex/d;/thai.map/d' $(DVIPSCONFIG) > /tmp/tmp.$$$$ ; \
#	  mv -f /tmp/tmp.$$$$ $(DVIPSCONFIG) ; \
#	fi
#	echo "% thailatex" >> $(DVIPSCONFIG)
#	echo "p +thai.map" >> $(DVIPSCONFIG)
#	mkdir -p `dirname $(PDFTEXCONFIG)`
#	if test -f $(PDFTEXCONFIG); then \
#	  sed -e '/thailatex/d;/thai.map/d' $(PDFTEXCONFIG) > /tmp/tmp.$$$$ ; \
#	  mv -f /tmp/tmp.$$$$ $(PDFTEXCONFIG) ; \
#	fi
#	echo "% thailatex"   >> $(PDFTEXCONFIG)
#	echo "map +thai.map" >> $(PDFTEXCONFIG)
 
uninstall-hook:
	$(UPDMAP) --disable thai.map
#	if test -f $(UPDMAPCONFIG); then \
#	  sed -e '/thailatex/d;/thai.map/d' $(UPDMAPCONFIG) > /tmp/tmp.$$$$ ; \
#	  mv -f /tmp/tmp.$$$$ $(UPDMAPCONFIG) ; \
#	fi
#	$(UPDMAP)
#	if test -f $(DVIPSCONFIG); then \
#	  sed -e '/thailatex/d;/thai.map/d' $(DVIPSCONFIG) > /tmp/tmp.$$$$ ; \
#	  mv -f /tmp/tmp.$$$$ $(DVIPSCONFIG) ; \
#	fi
#	if test -f $(PDFTEXCONFIG); then \
#	  sed -e '/thailatex/d;/thai.map/d' $(PDFTEXCONFIG) > /tmp/tmp.$$$$ ; \
#	  mv -f /tmp/tmp.$$$$ $(PDFTEXCONFIG) ; \
#	fi

clean-local:
	$(RM) *.vpl

distclean-local:
	$(RM) *.vf *.tfm *.enc
