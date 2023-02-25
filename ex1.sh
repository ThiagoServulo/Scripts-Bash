#!/bin/bash

#######################################
# Esse exercício realiza operações simples com dois números e escreve num arquivo de saída (ex1.log)
#######################################

# Função responsável por realizar a operação desejada
function Calcular
{
	case $3 in
		+)
			echo "$1+$2" | bc
			;;
		-)
			echo "$1-$2" | bc
			;;
		\*)
			echo "$1*$2" | bc
			;;
		/)
			if  (($2 == 0))
			then
				echo "Divisão Inválida"
			else
				echo "scale=2;$1/$2" | bc -l
			fi
			;;
		*)
			echo "Operação Inválida"
			;;
	esac
}

# Função resposnável por escrever a operação no arquivo de saída
function GerarArquivo
{
	if [[ $4 != "Operação Inválida" && $4 != "Divisão Inválida" ]]
	then
		echo "$1 $3 $2 = $4" >> ex1.log
	fi
}

# Main 
echo "Oprações" > ex1.log
loop="true"
while [[ $loop == "true" ]]
do
	read -p "Deseja realizar uma nova operação (s/n)? " opcao
	case $opcao in
		s|S)
			read -p "Digite o primeiro número: " num1
			read -p "Digite o segundo número: " num2
			read -p "Esolha a operação a ser ralizada (+ - * /): " operacao
			resultado=`Calcular $num1 $num2 $operacao`
			GerarArquivo "$num1" "$num2" "$operacao" "$resultado"
			;;
		n|N)
			loop="false"
			;;
		*)
			echo "Opção inválida"
			;;
	esac
	echo ""
done