BABEL_COMMON = thai.sty thswitch.sty lthenc.def \
	lthnorasi.fd lthgaruda.fd \
	lthttype.fd lthpurisa.fd \
	lthloma.fd

BABEL_SRC = thai.dtx.in thai.ins.in $(BABEL_COMMON)
BABEL_INS = thai.ldf $(BABEL_COMMON)
BABEL_DOCS = thai.pdf

EXTRA_DIST = $(BABEL_SRC)

babeldir = @texmfdir@/tex/generic/babel
babel_DATA = $(BABEL_INS)

pkgdocdir = $(docdir)/@PACKAGE@
pkgdoc_DATA = $(BABEL_DOCS)

thai.ldf: thai.ins thai.dtx
	latex $<

thai.pdf: thai.dtx
	pdflatex $<

