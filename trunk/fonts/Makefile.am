EXTRA_DIST = \
	lthuni.enc \
	dbtt.pfb \
	dbtt_b.pfb \
	dbtt_o.pfb \
	dbtt_bo.pfb \
	garuda.pfb \
	garuda_b.pfb \
	garuda_o.pfb \
	garuda_bo.pfb \
	norasi.pfb \
	norasi_b.pfb \
	norasi_o.pfb \
	norasi_i.pfb \
	norasi_bo.pfb \
	norasi_bi.pfb \
	kinnari.pfb \
	kinnari_b.pfb \
	kinnari_o.pfb \
	kinnari_i.pfb \
	kinnari_bo.pfb \
	kinnari_bi.pfb \
	ttype.pfb \
	ttype_b.pfb \
	ttype_o.pfb \
	ttype_bo.pfb \
	purisa.pfb \
	dbtt.afm \
	dbtt_b.afm \
	dbtt_o.afm \
	dbtt_bo.afm \
	garuda.afm \
	garuda_b.afm \
	garuda_o.afm \
	garuda_bo.afm \
	norasi.afm \
	norasi_b.afm \
	norasi_o.afm \
	norasi_i.afm \
	norasi_bo.afm \
	norasi_bi.afm \
	kinnari.afm \
	kinnari_b.afm \
	kinnari_o.afm \
	kinnari_i.afm \
	kinnari_bo.afm \
	kinnari_bi.afm \
	ttype.afm \
	ttype_b.afm \
	ttype_o.afm \
	ttype_bo.afm \
	purisa.afm

DISTCLEANFILES = thai.map

type1dir = @texmfdir@/fonts/type1/public/thai
afmdir = @texmfdir@/fonts/afm/public/thai
tfmdir = @texmfdir@/fonts/tfm/public/thai
vfdir  = @texmfdir@/fonts/vf/public/thai

dvipsbasedir = @texmfdir@/dvips/base
dvipsconfigdir = @texmfdir@/dvips/config

DVIPSCONFIG=$(DESTDIR)/@texmfdir@/dvips/config/config.ps
PDFTEXCONFIG=$(DESTDIR)/@texmfdir@/pdftex/config/pdftex.cfg
#UPDMAPCONFIG=$(DESTDIR)/@texmfdir@/web2c/updmap.cfg

dvipsbase_DATA = lthuni.enc

dvipsconfig_DATA = thai.map

type1_DATA = \
	dbtt.pfb \
	dbtt_b.pfb \
	dbtt_o.pfb \
	dbtt_bo.pfb \
	garuda.pfb \
	garuda_b.pfb \
	garuda_o.pfb \
	garuda_bo.pfb \
	norasi.pfb \
	norasi_b.pfb \
	norasi_o.pfb \
	norasi_i.pfb \
	norasi_bo.pfb \
	norasi_bi.pfb \
	kinnari.pfb \
	kinnari_b.pfb \
	kinnari_o.pfb \
	kinnari_i.pfb \
	kinnari_bo.pfb \
	kinnari_bi.pfb \
	ttype.pfb \
	ttype_b.pfb \
	ttype_o.pfb \
	ttype_bo.pfb \
	purisa.pfb



afm_DATA = \
	dbtt.afm \
	dbtt_b.afm \
	dbtt_o.afm \
	dbtt_bo.afm \
	garuda.afm \
	garuda_b.afm \
	garuda_o.afm \
	garuda_bo.afm \
	norasi.afm \
	norasi_b.afm \
	norasi_o.afm \
	norasi_i.afm \
	norasi_bo.afm \
	norasi_bi.afm \
	kinnari.afm \
	kinnari_b.afm \
	kinnari_o.afm \
	kinnari_i.afm \
	kinnari_bo.afm \
	kinnari_bi.afm \
	ttype.afm \
	ttype_b.afm \
	ttype_o.afm \
	ttype_bo.afm \
	purisa.afm



tfm_DATA = \
	dbtt.tfm \
	dbtt_b.tfm \
	dbtt_o.tfm \
	dbtt_bo.tfm \
	garuda.tfm \
	garuda_b.tfm \
	garuda_o.tfm \
	garuda_bo.tfm \
	norasi.tfm \
	norasi_b.tfm \
	norasi_o.tfm \
	norasi_i.tfm \
	norasi_bo.tfm \
	norasi_bi.tfm \
	kinnari.tfm \
	kinnari_b.tfm \
	kinnari_o.tfm \
	kinnari_i.tfm \
	kinnari_bo.tfm \
	kinnari_bi.tfm \
	ttype.tfm \
	ttype_b.tfm \
	ttype_o.tfm \
	ttype_bo.tfm \
	purisa.tfm \
	rdbtt.tfm \
	rdbtt_b.tfm \
	rdbtt_o.tfm \
	rdbtt_bo.tfm \
	rgaruda.tfm \
	rgaruda_b.tfm \
	rgaruda_o.tfm \
	rgaruda_bo.tfm \
	rnorasi.tfm \
	rnorasi_b.tfm \
	rnorasi_o.tfm \
	rnorasi_i.tfm \
	rnorasi_bo.tfm \
	rnorasi_bi.tfm \
	rkinnari.tfm \
	rkinnari_b.tfm \
	rkinnari_o.tfm \
	rkinnari_i.tfm \
	rkinnari_bo.tfm \
	rkinnari_bi.tfm \
	rttype.tfm \
	rttype_b.tfm \
	rttype_o.tfm \
	rttype_bo.tfm \
	rpurisa.tfm



vf_DATA = \
	dbtt.vf \
	dbtt_b.vf \
	dbtt_o.vf \
	dbtt_bo.vf \
	garuda.vf \
	garuda_b.vf \
	garuda_o.vf \
	garuda_bo.vf \
	norasi.vf \
	norasi_b.vf \
	norasi_o.vf \
	norasi_i.vf \
	norasi_bo.vf \
	norasi_bi.vf \
	kinnari.vf \
	kinnari_b.vf \
	kinnari_o.vf \
	kinnari_i.vf \
	kinnari_bo.vf \
	kinnari_bi.vf \
	ttype.vf \
	ttype_b.vf \
	ttype_o.vf \
	ttype_bo.vf \
	purisa.vf



# Local Rules

r%.tfm: %.afm lthuni.enc
%.vpl: %.afm lthuni.enc
	if [ ! -f $*.afm ]; then \
	  $(LN_S) $(srcdir)/$*.afm $*.afm; \
	fi
	if [ ! -f lthuni.enc ]; then \
	  $(LN_S) $(srcdir)/lthuni.enc lthuni.enc; \
	fi
	$(AFM2TFM) $*.afm -v $*.vpl -T lthuni.enc r$*.tfm \
	| $(SED) "s/$$/ <$*.pfb/" >> thai.map

%.tfm: %.vpl
	$(VPTOVF) $*

thai.map: $(tfm_DATA)
	LC_COLLATE=C sort $@ | uniq > /tmp/tmp.$$$$; mv /tmp/tmp.$$$$ $@

# For tetex > 1.0.7 only
# 
# install-data-hook:
# 	$(UPDMAP) --enable Map thai.map
#  
# uninstall-hook:
# 	$(UPDMAP) --disable thai.map

install-data-hook:
	@TEXHASH@
	@if test -z "$(DESTDIR)" ; then                                       \
	  if test "$(UPDMAP_VER)" == "2"; then                                \
	    $(UPDMAP) --disable thai.map --nohash --nomkmap ;                 \
	    $(UPDMAP) --enable Map thai.map ;                                 \
	  else                                                                \
	    mkdir -p `dirname $(DVIPSCONFIG)` ;                               \
	    if test -f $(DVIPSCONFIG); then                                   \
	      sed -e '/thailatex/d;/thai.map/d' $(DVIPSCONFIG) > /tmp/tmp.$$$$; \
	      mv -f /tmp/tmp.$$$$ $(DVIPSCONFIG) ;                            \
	    fi ;                                                              \
	    echo "% thailatex" >> $(DVIPSCONFIG) ;                            \
	    echo "p +thai.map" >> $(DVIPSCONFIG) ;                            \
	    mkdir -p `dirname $(PDFTEXCONFIG)` ;                              \
	    if test -f $(PDFTEXCONFIG); then                                  \
	      sed -e '/thailatex/d;/thai.map/d' $(PDFTEXCONFIG) > /tmp/tmp.$$$$;\
	      mv -f /tmp/tmp.$$$$ $(PDFTEXCONFIG) ;                           \
	    fi ;                                                              \
	    echo "% thailatex"   >> $(PDFTEXCONFIG) ;                         \
	    echo "map +thai.map" >> $(PDFTEXCONFIG) ;                         \
	  fi ;                                                                \
	else                                                                  \
	  echo "***" ;                                                        \
	  echo "*** Warning: tetex config files not patched" ;                \
	  echo "***" ;                                                        \
	  echo "*** update these files on the target system" ;                \
	  echo "*** using sync-thailatex script" ;                            \
	  echo "***" ;                                                        \
	fi
 
uninstall-hook:
	if test "$(UPDMAP_VER)" == "2"; then                                  \
	  $(UPDMAP) --disable thai.map ;                                      \
	else                                                                  \
	  if test -f $(DVIPSCONFIG); then                                     \
	    sed -e '/thailatex/d;/thai.map/d' $(DVIPSCONFIG) > /tmp/tmp.$$$$ ; \
	    mv -f /tmp/tmp.$$$$ $(DVIPSCONFIG) ;                              \
	  fi ;                                                                \
	  if test -f $(PDFTEXCONFIG); then                                    \
	    sed -e '/thailatex/d;/thai.map/d' $(PDFTEXCONFIG) > /tmp/tmp.$$$$ ; \
	    mv -f /tmp/tmp.$$$$ $(PDFTEXCONFIG) ;                             \
	  fi ;                                                                \
	fi

clean-local:
	$(RM) *.vpl

distclean-local:
	$(RM) *.vf *.tfm

