#! /bin/sh

MMV=`which mmv`

if [ x$MMV == x ]
then
	echo "I need mmv. Please apt-get install mmv"
	exit 1
fi

#Norasi, Garuda, and DBThaiText

$MMV -v "Norasi*" "norasi#1"
$MMV -v "Garuda*" "garuda#1"
$MMV -v "DBThaiText*" "dbtt#1"
$MMV -v "Kinnari*" "kinnari#1"
$MMV -v "PseudoMono*" "pmono#1"
$MMV -v "Purisa*" "purisa#1"

#Oblique, Bold, BoldOblique, Italic, BoldItalic
$MMV -v "*-BoldOblique*" "#1_bo#2"
$MMV -v "*-BoldItalic*" "#1_bi#2"
$MMV -v "*-Bold*" "#1_b#2"
$MMV -v "*-Oblique*" "#1_o#2"
$MMV -v "*-Italic*" "#1_i#2"
