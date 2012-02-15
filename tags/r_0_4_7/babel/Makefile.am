BABEL_COMMON = thswitch.sty lthenc.def tis620.def

BABEL_SRC = thai.dtx thai.ins $(BABEL_COMMON)
BABEL_INS = thai.ldf $(BABEL_COMMON)
BABEL_DOCS = thai.pdf

EXTRA_DIST = $(BABEL_SRC)
CLEANFILES = thai.log thai.aux thai.ldf thai.pdf

babeldir = $(texmfdir)/tex/generic/$(PACKAGE)
babel_DATA = $(BABEL_INS)

doc_DATA = $(BABEL_DOCS)

thai.ldf: thai.ins thai.dtx
	if [ ! -f thai.ins ]; then \
	  $(LN_S) $(srcdir)/thai.ins thai.ins; \
	fi
	if [ ! -f thai.dtx ]; then \
	  $(LN_S) $(srcdir)/thai.dtx thai.dtx; \
	fi
	rm -f thai.ldf
	$(LATEX) thai.ins

thai.pdf: thai.dtx
	if [ ! -f thai.dtx ]; then \
	  $(LN_S) $(srcdir)/thai.dtx thai.dtx; \
	fi
	$(PDFLATEX) thai.dtx
	$(PDFLATEX) thai.dtx

