EXTRA_DIST = TeXTIS.enc dbttx.enc thai.map

texmfdir = @texmfdir@

dvipsbasedir = @texmfdir@/dvips/base
dvipsbase_DATA = TeXTIS.enc dbttx.enc

dvipsconfigdir = @texmfdir@/dvips/config
dvipsconfig_DATA = thai.map

DVIPSCONFIG=$(DESTDIR)/@texmfdir@/dvips/config/config.ps
PDFTEXCONFIG=$(DESTDIR)/@texmfdir@/pdftex/config/pdftex.cfg

install-data-local:
	mkdir -p `dirname $(DVIPSCONFIG)`
	if test -f $(DVIPSCONFIG); then \
	  sed -e '/thailatex/d;/thai.map/d' $(DVIPSCONFIG) > /tmp/tmp.$$ ; \
	  mv -f /tmp/tmp.$$ $(DVIPSCONFIG) ; \
	fi
	echo "% thailatex" >> $(DVIPSCONFIG)
	echo "p +thai.map" >> $(DVIPSCONFIG)
	mkdir -p `dirname $(PDFTEXCONFIG)`
	if test -f $(PDFTEXCONFIG); then \
	  sed -e '/thailatex/d;/thai.map/d' $(PDFTEXCONFIG) > /tmp/tmp.$$ ; \
	  mv -f /tmp/tmp.$$ $(PDFTEXCONFIG) ; \
	fi
	echo "% thailatex"   >> $(PDFTEXCONFIG)
	echo "map +thai.map" >> $(PDFTEXCONFIG)
 
uninstall-local:
	if test -f $(DVIPSCONFIG); then \
	  sed -e '/thailatex/d;/thai.map/d' $(DVIPSCONFIG) > /tmp/tmp.$$ ; \
	  mv -f /tmp/tmp.$$ $(DVIPSCONFIG) ; \
	fi
	if test -f $(PDFTEXCONFIG); then \
	  sed -e '/thailatex/d;/thai.map/d' $(PDFTEXCONFIG) > /tmp/tmp.$$ ; \
	  mv -f /tmp/tmp.$$ $(PDFTEXCONFIG) ; \
	fi
