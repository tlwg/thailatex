hyphendir = $(texmfdir)/tex/generic/$(PACKAGE)
hyphen_DATA =			\
	loadhyph-th.tex		\
	hyph-th.tex		\
	hyph-th-utf8.tex	\
	hyph-th.pat.txt		\
	$(NULL)

TDICT_SRC = 				\
	$(srcdir)/tdict-common.txt	\
	$(srcdir)/tdict-collection.txt	\
	$(srcdir)/tdict-currency.txt	\
	$(srcdir)/tdict-district.txt	\
	$(srcdir)/tdict-city.txt	\
	$(srcdir)/tdict-country.txt	\
	$(srcdir)/tdict-geo.txt		\
	$(srcdir)/tdict-history.txt	\
	$(srcdir)/tdict-ict.txt		\
	$(srcdir)/tdict-lang-ethnic.txt	\
	$(srcdir)/tdict-proper.txt	\
	$(srcdir)/tdict-science.txt	\
	$(srcdir)/tdict-slang.txt	\
	$(srcdir)/tdict-spell.txt	\
	$(srcdir)/tdict-std.txt		\
	$(srcdir)/tdict-std-compound.txt

EXTRA_DIST = \
	README                  \
	loadhyph-th.tex         \
	hyph-th.tex.in          \
	hyph-th-utf8.tex.in     \
	thai.tra                \
	thai-fixup.sed		\
	thai-exc.pat            \
	conv-utf8-hex.sed       \
	test-hyphen.sh		\
	diff-dicts.sh		\
	$(TDICT_SRC)

PATGEN_ANS = \
1 5 \n\
2 5 \n\
1 2 10 \n\
1 6 \n\
2 1 8 \n\
3 8 \n\
1 4 5 \n\
3 10 \n\
3 2 1 \n\
4 11 \n\
1 10 1 \n\
y

thai.dic:  $(TDICT_SRC)
	cat $(TDICT_SRC) | LC_ALL=C sort -u > $@

thai.out: thai.dic thai.tra thai-fixup.sed
	rm -f thai.pat
	touch thai.pat
	printf "$(PATGEN_ANS)" \
	  | $(PATGEN) thai.dic thai.pat thai.out $(srcdir)/thai.tra
	sed -f $(srcdir)/thai-fixup.sed -i thai.out

thai-comb.pat: thai.out thai-exc.pat
	cat thai.out $(srcdir)/thai-exc.pat > $@

hyph-th.pat.txt: thai-comb.pat
	$(SED) -e '/^%/d' $< > $@

hyph-th-utf8.tex: thai-comb.pat hyph-th-utf8.tex.in
	$(AWK) "BEGIN {show=1} /@PATTERNS@/ {show=0} {if(show) print}" \
	  $(srcdir)/hyph-th-utf8.tex.in > $@
	cat thai-comb.pat >> $@
	$(AWK) "BEGIN {show=0;pat=0} /@PATTERNS@/ {pat=1} {if(show) print; if(pat) show=1}" \
	  $(srcdir)/hyph-th-utf8.tex.in >> $@

hyph-th.tex: thai-comb.pat conv-utf8-hex.sed hyph-th.tex.in
	$(AWK) "BEGIN {show=1} /@PATTERNS@/ {show=0} {if(show) print}" \
	  $(srcdir)/hyph-th.tex.in > $@
	$(SED) -f $(srcdir)/conv-utf8-hex.sed thai-comb.pat >> $@
	$(AWK) "BEGIN {show=0;pat=0} /@PATTERNS@/ {pat=1} {if(show) print; if(pat) show=1}" \
	  $(srcdir)/hyph-th.tex.in >> $@

CLEANFILES = \
	thai.dic thai.pat pattmp.* thai.out thai-comb.pat \
	hyph-th.tex hyph-th-utf8.tex hyph-th.pat.txt

