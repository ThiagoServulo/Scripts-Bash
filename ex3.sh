#!/bin/bash

# Loop de iteracao sobre parametros
while
	(($# > 0))
do
	echo "$1"
	shift
done
