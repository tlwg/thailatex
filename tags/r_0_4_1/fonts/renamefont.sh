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
$MMV -v "TlwgTypewriter*" "ttype#1"
$MMV -v "TlwgTypist*" "ttypist#1"
$MMV -v "Purisa*" "purisa#1"
$MMV -v "Loma*" "loma#1"
$MMV -v "Waree*" "waree#1"
$MMV -v "Umpush*" "umpush#1"
$MMV -v "Sawasdee*" "sawasdee#1"

#Oblique, Bold, BoldOblique, Italic, BoldItalic
$MMV -v "*-BoldOblique*" "#1_bo#2"
$MMV -v "*-BoldItalic*" "#1_bi#2"
$MMV -v "*-Bold*" "#1_b#2"
$MMV -v "*-Oblique*" "#1_o#2"
$MMV -v "*-Italic*" "#1_i#2"

# for Sawasdee, whose names don't include hyphen
$MMV -v "*BoldOblique*" "#1_bo#2"
$MMV -v "*Bold*" "#1_b#2"
$MMV -v "*Oblique*" "#1_o#2"
