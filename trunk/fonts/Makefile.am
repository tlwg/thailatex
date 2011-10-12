EXTRA_DIST = \
	thaifont.mk.am \
	lthuni.enc \
	thailigs.enc \
	thai-dummy.afm

encdir = $(texmfdir)/fonts/enc/dvips/thai

enc_DATA = lthuni.enc

thailigs.vpl: thailigs.enc thai-dummy.afm
	if [ ! -f thai-dummy.afm ]; then \
	  $(LN_S) $(srcdir)/thai-dummy.afm thai-dummy.afm; \
	fi
	if [ ! -f thailigs.enc ]; then \
	  $(LN_S) $(srcdir)/thailigs.enc thailigs.enc; \
	fi
	$(AFM2TFM) thai-dummy.afm -v $@ -T thailigs.enc thailigs.tfm

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

MAP = thai.map

include $(srcdir)/thaifont.mk.am

