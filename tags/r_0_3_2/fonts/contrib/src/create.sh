#! /bin/sh

# hand edited files
cp dostretch.mtx.in dostretch.mtx
cp thai.mtx.in thai.mtx
cp resetscale.mtx.in resetscale.mtx
cp t1fnt.fd.in t1fnt.fd
cp ts1fnt.fd.in ts1fnt.fd
cp t1fgh.fd.in t1fgh.fd
cp ts1fgh.fd.in ts1fgh.fd

# for current thai afm
cp ../../norasi*.afm .
cp ../../garuda*.afm .

./getpl.sh

# for norasi-times family and garuda-helvetica family
tex drv-fnt
tex drv-fgh

# for norasi-computer modern family and garuda computer modern family
tex drv-fnc
tex drv-fgc

for i in *.pl; do pltotf $i; done
for i in *.vpl; do vptovf $i; done

# make
[ -d ../tfm ] || mkdir ../tfm
[ -d ../vf ] || mkdir ../vf
[ -d ../tex ] || mkdir ../tex

# clean
rm -f ../tfm/*
rm -f ../vf/*
rm -f ../tex/*

# copy
cp f*.tfm ../tfm
cp f*.vf ../vf
cp *.fd ../tex
cp *.def ../tex
cp *.sty ../tex

# copy to home
cp ../tex/* ~/texmf/tex
cp ../tfm/* ~/texmf/fonts/tfm
cp ../vf/* ~/texmf/fonts/vf

# clean up
rm -f *.tfm *.vf *.fd *.vpl *.mtx *.pl *.log *.dvi
