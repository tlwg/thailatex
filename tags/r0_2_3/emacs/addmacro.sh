# add Emacs macro for activating Thai LaTeX filter
if [ -f $EMACSLISPDIR/site-start.el ] ; then
  cd $EMACSLISPDIR
  sed -e '/thai-latex-setup/d' < site-start.el > /tmp/tmp.$$
  mv /tmp/tmp.$$ site-start.el
fi
echo '(load-library "thai-latex-setup")' \
  >> $EMACSLISPDIR/site-start.el
