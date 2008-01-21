BABEL_COMMON = thai.sty thswitch.sty lthenc.def \
	lthkinnari.fd lthgaruda.fd lthnorasi.fd \
	lthttype.fd lthttypist.fd \
	lthpurisa.fd lthloma.fd \
	lthwaree.fd lthumpush.fd
	lthsawasdee.fd

BABEL_SRC = thai.dtx thai.ins $(BABEL_COMMON)
BABEL_INS = thai.ldf $(BABEL_COMMON)
BABEL_DOCS = thai.pdf

EXTRA_DIST = $(BABEL_SRC)
CLEANFILES = thai.log thai.aux thai.ldf thai.pdf

babeldir = @texmfdir@/tex/generic/babel
babel_DATA = $(BABEL_INS)

pkgdocdir = $(docdir)/@PACKAGE@
pkgdoc_DATA = $(BABEL_DOCS)

thai.ldf: thai.ins thai.dtx
	if [ ! -f thai.ins ]; then \
	  $(LN_S) $(srcdir)/thai.ins thai.ins; \
	fi
	if [ ! -f thai.dtx ]; then \
	  $(LN_S) $(srcdir)/thai.dtx thai.dtx; \
	fi
	latex thai.ins

thai.pdf: thai.dtx
	if [ ! -f thai.dtx ]; then \
	  $(LN_S) $(srcdir)/thai.dtx thai.dtx; \
	fi
	pdflatex thai.dtx

