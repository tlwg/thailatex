if [ -f $DVIPSDIR/psfonts.map ] ; then
  sed -e '/^dbtt/d;/^rnorasi/d' < $DVIPSDIR/psfonts.map > /tmp/tmp.$$
  mv /tmp/tmp.$$ $DVIPSDIR/psfonts.map
fi
sed -e 's/^X//' >> $DVIPSDIR/psfonts.map << END
Xdbtt   DBThaiText <dbtt.pfb "dbttEncoding ReEncodeFont" <dbttx.enc
Xdbttb  DBThaiTextBold <dbttb.pfb "dbttEncoding ReEncodeFont" <dbttx.enc
Xdbtti  DBThaiTextItalic <dbtti.pfb "dbttEncoding ReEncodeFont" <dbttx.enc
Xdbttbi DBThaiTextBoldItalic <dbttbi.pfb "dbttEncoding ReEncodeFont" <dbttx.enc
Xrnorasi_n  Norasi <norasi_n.pfb "TeXTISEncoding ReEncodeFont" <TeXTIS.enc
Xrnorasi_b  Norasi-Bold <norasi_b.pfb "TeXTISEncoding ReEncodeFont" <TeXTIS.enc
Xrnorasi_i  Norasi-Italic <norasi_i.pfb "TeXTISEncoding ReEncodeFont" <TeXTIS.enc
Xrnorasi_bi Norasi-BoldItalic <norasi_bi.pfb "TeXTISEncoding ReEncodeFont" <TeXTIS.enc
END
