type1dir = $(texmfdir)/fonts/type1/public/thai
afmdir = $(texmfdir)/fonts/afm/public/thai
tfmdir = $(texmfdir)/fonts/tfm/public/thai
vfdir  = $(texmfdir)/fonts/vf/public/thai

encdir = $(texmfdir)/fonts/enc/dvips/thai
mapdir = $(texmfdir)/fonts/map/dvips/thai

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
	purisa_b \
	purisa_o \
	purisa_bo \
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

PFBFILES = $(FONTS:%=%.pfb)
AFMFILES = $(FONTS:%=%.afm)
TFMFILES = $(FONTS:%=%.tfm)
RTFMFILES = $(FONTS:%=r%.tfm)
VFFILES = $(FONTS:%=%.vf)

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
	  $(TEXHASH) ;                                                        \
	  $(UPDMAP) --disable thai.map --nohash --nomkmap ;                   \
	  $(UPDMAP) --enable Map thai.map ;                                   \
	else                                                                  \
	  echo "***" ;                                                        \
	  echo "*** Warning: tetex config files not patched" ;                \
	  echo "***" ;                                                        \
	  echo "*** update these files on the target system" ;                \
	  echo "*** using sync-thailatex script" ;                            \
	  echo "***" ;                                                        \
	fi
 
uninstall-hook:
	$(TEXHASH)
	$(UPDMAP) --disable thai.map

CLEANFILES = *.vpl *.vf *.tfm thai.map

