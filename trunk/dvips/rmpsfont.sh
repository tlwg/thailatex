sed -e '/^dbtt/d;/^rnorasi/d' < $DVIPSDIR/psfonts.map > /tmp/tmp.$$
mv /tmp/tmp.$$ $DVIPSDIR/psfonts.map
