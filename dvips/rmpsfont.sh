sed -e '/^dbtt/d' < $DVIPSDIR/psfonts.map \
  | sed -e '/^rnorasi/d' > /tmp/tmp.$$
mv /tmp/tmp.$$ $DVIPSDIR/psfonts.map
