AC_PREREQ(2.50)

AC_INIT(thailatex, 0.5.1svn, thep@linux.thai.net)
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

AC_CHECK_PROGS(LATEX,latex,no)
if test "x$LATEX" = "xno" ; then
  AC_MSG_ERROR([You need latex (from texlive distribution)])
fi
AC_CHECK_PROGS(PDFLATEX,pdflatex,no)
if test "x$PDFLATEX" = "xno" ; then
  AC_MSG_ERROR([You need pdflatex (from texlive distribution)])
fi
AC_CHECK_PROGS(PATGEN,patgen,no)
if test "x$PATGEN" = "xno" ; then
  AC_MSG_ERROR([You need patgen (from texlive distribution)])
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

AC_OUTPUT(Makefile
  babel/Makefile
  hyphen/Makefile
  scripts/Makefile
  doc/Makefile)

