#! /bin/sh

size="0500 0600 0700 0800 0900 1000 1095 1200 1440 1728 2074 2488 2986 3583"

kpsewhich=/usr/bin/kpsewhich

logfile=./fonts.log

rofamily="rm cc sl ti bx xc bl bi"

ssofamily="ss si sx so"

function getpl () {
curfam=$1

echo "# Converting .tfm to .pl" >> $logfile

for f in ${curfam}; do 
    for s in ${size}; do 
 	if [ -z `${kpsewhich} tfm ec${f}${s}.tfm` ] ; then 
 	   echo "Making ec${f}${s}.tfm" >> ${logfile}
	   echo -n "ec${f}${s}.tfm "
	   mktextfm ec${f}${s}
	fi
 	if [ `${kpsewhich} tfm ec${f}${s}.tfm` ] ; then 
 	   tftopl `${kpsewhich} tfm ec${f}${s}.tfm` ./ec${f}${s}.pl &>/dev/null;
 	   echo "ec${f}${s}.tfm -> ec${f}${s}.pl" >> ${logfile}
	   echo -n "ec${f}${s}.pl "
 	else
 	   echo "! tfm file ec${f}${s}.tfm not found." >> ${logfile} 
	   echo "! ec${f}${s}.tfm not found."
 	fi
 	if [ -z `${kpsewhich} tfm tc${f}${s}.tfm` ] ; then 
 	   echo "Making tc${f}${s}.tfm" >> ${logfile}
	   echo -n "tc${f}${s}.tfm "
	   mktextfm tc${f}${s}
	fi
 	if [ `${kpsewhich} tfm tc${f}${s}.tfm` ] ; then 
 	   tftopl `${kpsewhich} tfm tc${f}${s}.tfm` ./tc${f}${s}.pl &> /dev/null;
 	   echo "tc${f}${s}.tfm -> tc${f}${s}.pl" >> ${logfile}
	   echo -n "tc${f}${s}.pl "
 	else
 	   echo "! tfm file tc${f}${s}.tfm not found" >> ${logfile}
	   echo "! tc${f}${s}.tfm not found."
 	fi
    done
done

echo
}

getpl "$rofamily"

getpl "$ssofamily"

exit 0
