type1dir = @texmfdir@/fonts/type1/public/thai
afmdir = @texmfdir@/fonts/afm/public/thai
tfmdir = @texmfdir@/fonts/tfm/public/thai
vfdir  = @texmfdir@/fonts/vf/public/thai

if NEW_TDS
encdir = @texmfdir@/fonts/enc/dvips/thai
mapdir = @texmfdir@/fonts/map/dvips/thai
else
encdir = @texmfdir@/dvips/base
mapdir = @texmfdir@/dvips/config
endif

DVIPSCONFIG=$(DESTDIR)/@texmfdir@/dvips/config/config.ps
PDFTEXCONFIG=$(DESTDIR)/@texmfdir@/pdftex/config/pdftex.cfg
#UPDMAPCONFIG=$(DESTDIR)/@texmfdir@/web2c/updmap.cfg

enc_DATA = lthuni.enc

map_DATA = thai.map

FONTS = \
	kinnari \
	kinnari_b \
	kinnari_o \
	kinnari_i \
	kinnari_bo \
	kinnari_bi \
	garuda \
	garuda_b \
	garuda_o \
	garuda_bo \
	norasi \
	norasi_b \
	norasi_o \
	norasi_i \
	norasi_bo \
	norasi_bi \
	ttype \
	ttype_b \
	ttype_o \
	ttype_bo \
	ttypist \
	ttypist_b \
	ttypist_o \
	ttypist_bo \
	purisa \
	loma \
	loma_b \
	loma_o \
	loma_bo \
	waree \
	waree_b \
	waree_o \
	waree_bo \
	umpush \
	umpush_b \
	umpush_o \
	umpush_bo \
	sawasdee \
	sawasdee_b \
	sawasdee_o \
	sawasdee_bo

PFBFILES = $(shell echo $(FONTS) | sed 's/[^ ]*/&.pfb/g')
AFMFILES = $(shell echo $(FONTS) | sed 's/[^ ]*/&.afm/g')
TFMFILES = $(shell echo $(FONTS) | sed 's/[^ ]*/&.tfm/g')
RTFMFILES = $(shell echo $(FONTS) | sed 's/[^ ]*/r&.tfm/g')
VFFILES = $(shell echo $(FONTS) | sed 's/[^ ]*/&.vf/g')

type1_DATA = $(PFBFILES)

afm_DATA = $(AFMFILES)

tfm_DATA = $(TFMFILES) $(RTFMFILES)

vf_DATA = $(VFFILES)

EXTRA_DIST = \
	lthuni.enc \
	thailigs.enc \
	thai-dummy.afm \
	$(PFBFILES) \
	$(AFMFILES)

# Local Rules

thailigs.vpl: thailigs.enc thai-dummy.afm
	if [ ! -f thai-dummy.afm ]; then \
	  $(LN_S) $(srcdir)/thai-dummy.afm thai-dummy.afm; \
	fi
	if [ ! -f thailigs.enc ]; then \
	  $(LN_S) $(srcdir)/thailigs.enc thailigs.enc; \
	fi
	$(AFM2TFM) thai-dummy.afm -v $@ -T thailigs.enc thailigs.tfm

r%.tfm: %.afm lthuni.enc
%.vpl: %.afm lthuni.enc thailigs.vpl
	if [ ! -f $*.afm ]; then \
	  $(LN_S) $(srcdir)/$*.afm $*.afm; \
	fi
	if [ ! -f lthuni.enc ]; then \
	  $(LN_S) $(srcdir)/lthuni.enc lthuni.enc; \
	fi
	$(AFM2TFM) $*.afm -v $*.vpl -T lthuni.enc r$*.tfm \
	| $(SED) "s/$$/ <$*.pfb/" >> thai.map
	TMPFILE=`mktemp /tmp/tltx.XXXXXXXXX` && \
	$(AWK) "BEGIN {show=1} /LIGTABLE/ {show=0} {if(show) print}" $*.vpl > $$TMPFILE && \
	$(AWK) "BEGIN {show=0} /LIGTABLE/ {show=1} /CHARACTER/ {show=0} {if(show) print}" thailigs.vpl >> $$TMPFILE && \
	$(AWK) "BEGIN {show=0} /CHARACTER/ {show=1} {if(show) print}" $*.vpl >> $$TMPFILE && \
	mv $$TMPFILE $*.vpl

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
	@if test -z "$(DESTDIR)" ; then                                       \
	  if test "$(UPDMAP_VER)" = "2"; then                                 \
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
	  @TEXHASH@ ;                                                         \
	else                                                                  \
	  echo "***" ;                                                        \
	  echo "*** Warning: tetex config files not patched" ;                \
	  echo "***" ;                                                        \
	  echo "*** update these files on the target system" ;                \
	  echo "*** using sync-thailatex script" ;                            \
	  echo "***" ;                                                        \
	fi
 
uninstall-hook:
	if test "$(UPDMAP_VER)" = "2"; then                                   \
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
	fi ;                                                                  \
	@TEXHASH@

CLEANFILES = *.vpl *.vf *.tfm thai.map

