hyphendir = $(texmfdir)/tex/generic/$(PACKAGE)
hyphen_DATA = loadhyph-th.tex hyph-th.tex hyph-th-utf8.tex

TDICT_SRC = 				\
	$(srcdir)/tdict-common.txt	\
	$(srcdir)/tdict-collection.txt	\
	$(srcdir)/tdict-district.txt	\
	$(srcdir)/tdict-city.txt	\
	$(srcdir)/tdict-country.txt	\
	$(srcdir)/tdict-geo.txt		\
	$(srcdir)/tdict-history.txt	\
	$(srcdir)/tdict-ict.txt		\
	$(srcdir)/tdict-lang-ethnic.txt	\
	$(srcdir)/tdict-proper.txt	\
	$(srcdir)/tdict-science.txt	\
	$(srcdir)/tdict-spell.txt	\
	$(srcdir)/tdict-std.txt		\
	$(srcdir)/tdict-std-compound.txt

EXTRA_DIST = \
	README                  \
	loadhyph-th.tex         \
	hyph-th.tex.in          \
	hyph-th-utf8.tex.in     \
	thai.tra                \
	thai-exc.pat            \
	conv-utf8-hex.sed       \
	$(TDICT_SRC)

PATGEN_ANS = \
1 5 \n\
1 5 \n\
1 2 6 \n\
2 6 \n\
2 1 4 \n\
3 8 \n\
1 3 2 \n\
3 10 \n\
3 2 1 \n\
4 11 \n\
1 5 1 \n\
y

thai.dic:  $(TDICT_SRC)
	cat $(TDICT_SRC) | LC_ALL=C sort -u > $@

thai.out: thai.dic thai.tra thai-exc.pat
	rm -f thai.pat
	touch thai.pat
	printf "$(PATGEN_ANS)" \
	  | $(PATGEN) thai.dic thai.pat thai.out $(srcdir)/thai.tra
	cat $(srcdir)/thai-exc.pat >> $@

hyph-th-utf8.tex: thai.out hyph-th-utf8.tex.in
	$(AWK) "BEGIN {show=1} /@PATTERNS@/ {show=0} {if(show) print}" \
	  $(srcdir)/hyph-th-utf8.tex.in > $@
	cat thai.out >> $@
	$(AWK) "BEGIN {show=0;pat=0} /@PATTERNS@/ {pat=1} {if(show) print; if(pat) show=1}" \
	  $(srcdir)/hyph-th-utf8.tex.in >> $@

hyph-th.tex: thai.out conv-utf8-hex.sed hyph-th.tex.in
	$(AWK) "BEGIN {show=1} /@PATTERNS@/ {show=0} {if(show) print}" \
	  $(srcdir)/hyph-th.tex.in > $@
	$(SED) -f $(srcdir)/conv-utf8-hex.sed thai.out >> $@
	$(AWK) "BEGIN {show=0;pat=0} /@PATTERNS@/ {pat=1} {if(show) print; if(pat) show=1}" \
	  $(srcdir)/hyph-th.tex.in >> $@

CLEANFILES = thai.dic thai.pat pattmp.* thai.out hyph-th.tex hyph-th-utf8.tex

