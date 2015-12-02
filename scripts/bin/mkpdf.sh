#!/bin/bash

if [[ $1 == "-x" ]]; then
	latexDist="xelatex -interaction=batchmode" && filename=$2
else 
	latexDist="pdflatex -interaction=batchmode" && filename=$1
fi

# cut path
filename=$(basename $filename)
# extract extension
extension="${filename##*.}"
# extract filename -extension
file="${filename%.*}"

echo "mkpdf>> Running $latexDist $filename"
echo ""
$latexDist $filename
echo ""

echo "mkpdf>> Running biber $file"
echo ""
biber $file
echo ""

echo "mkpdf>> ReRunning $latexDist $filename twice"
echo ""
$latexDist $filename
$latexDist $filename

echo ""
echo "mkpdf>> Cleaning up.."
echo ""

rm $file.aux &> /dev/null

#rm $file.b* # Do not use this to prevent accidental deletion of .bib files
rm $file.bbl &> /dev/null
rm $file.bcf &> /dev/null
rm $file.blg &> /dev/null

rm $file.lof &> /dev/null
rm $file.lol &> /dev/null
rm $file.lot &> /dev/null

rm $file.out &> /dev/null

rm $file.run* &> /dev/null
rm -r "$file".t2d &> /dev/null # not needed for pdflatex

rm $file.toc &> /dev/null

rm texput.log &> /dev/null

echo "mkpdf>> Done! Wrote output to $file.pdf"