#!/bin/bash

# Este exercício trata do comando grep, além de usar a leitura de arquivos de arquivos válidos

read -p "Digite o nome do arquivo de entrada: " file_input
if [[ -s $file_input && -r $file_input ]]
then
	for word in $(<"$file_input")
	do
		files=$(egrep -R -l "\b$word\b" *)
		echo -n $word
		echo -n ": "
		for file in $files
		do
			if [[ $file != $file_input ]]
			then
				echo -n $file
				echo -n " "
			fi
		done
		echo ""
	done
else
	echo "Arquivo inválido"
fi