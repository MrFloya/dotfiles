#!/bin/bash

file=$1
printer=$2

cat $file | ssh wilkens@rzssh1.informatik.uni-hamburg.de lpr -P$printer
