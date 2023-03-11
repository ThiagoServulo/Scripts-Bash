#!/bin/bash

quantidade=$#
soma=0
while
	(($# > 0))
do
	((soma=soma+$1))
	shift
done
echo "Soma = $soma"
echo -n "Media = "
echo "$soma/$quantidade" | bc -l
