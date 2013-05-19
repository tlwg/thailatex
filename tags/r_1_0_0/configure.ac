AC_PREREQ(2.50)

AC_INIT(thailatex, 1.0.0, thep@linux.thai.net)
AC_CONFIG_SRCDIR([babel/thai.dtx])

AM_INIT_AUTOMAKE(dist-xz no-dist-gzip)

AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_SED

AC_ARG_ENABLE(hooks,
              [AC_HELP_STRING([--disable-hooks],
                              [disable installation hook scripts])],
              , enable_hooks="yes")
AM_CONDITIONAL(ENABLE_HOOKS,test $enable_hooks = "yes")

AC_ARG_ENABLE(hyphenation,
              [AC_HELP_STRING([--enable-hyphenation],
                              [include hyphenation patterns and source (for VCS build only)])],
              , enable_hyphenation="no")
if test "x$enable_hyphenation" = "xyes" && ! test -f $srcdir/hyphen/Makefile.am
then
  AC_MSG_ERROR([No hyphenation source in this distribution. Cannot enable hyphenation.])
fi
AM_CONDITIONAL(ENABLE_HYPHENATION,test $enable_hyphenation = "yes")

AC_CHECK_PROGS(LATEX,latex,no)
if test "x$LATEX" = "xno" ; then
  AC_MSG_ERROR([You need latex (from texlive distribution)])
fi
AC_CHECK_PROGS(PDFLATEX,pdflatex,no)
if test "x$PDFLATEX" = "xno" ; then
  AC_MSG_ERROR([You need pdflatex (from texlive distribution)])
fi
if test "x$enable_hyphenation" = "xyes"; then
  AC_CHECK_PROGS(PATGEN,patgen,no)
  if test "x$PATGEN" = "xno" ; then
    AC_MSG_ERROR([You need patgen (from texlive distribution)])
  fi
fi
AC_CHECK_PROGS(SWATH,swath,no)
AC_CHECK_PROGS(CTTEX,cttex,no)

AC_ARG_WITH(texmfdir,
  [AC_HELP_STRING([--with-texmfdir=DIR],
                  [texmf directory in DIR [PREFIX/share/texmf]])],
  [texmfdir="$withval"], [texmfdir=${datarootdir}/texmf])
AC_MSG_CHECKING(--with-texmfdir)
AC_MSG_RESULT("$texmfdir")                                                                                                           
AC_SUBST(texmfdir)

if test "x$enable_hooks" = "xyes"; then
  AC_PATH_PROG(TEXHASH,[mktexlsr texhash],no)
  if test "x$TEXHASH" = "xno" ; then
    AC_MSG_ERROR([You need mktexlsr or texhash (from texlive distribution)])
  fi

  AC_PATH_PROG(FMTUTIL,[fmtutil-sys fmtutil],no)
  if test "x$FMTUTIL" = "xno" ; then
    AC_MSG_ERROR([You need fmtutil(-sys) (from texlive distribution)])
  fi
fi

AC_CONFIG_FILES(
  Makefile
  babel/Makefile
  scripts/Makefile
  doc/Makefile)

if test "x$enable_hyphenation" = "xyes"; then
  AC_CONFIG_FILES(hyphen/Makefile)
fi

AC_OUTPUT

