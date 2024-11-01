#! /usr/bin/bash 
#
# SeparaTicker.sh
#		Le arquivo de entrada. 
#		Seleciona linha/registro e tem como criterio de match o ticker
#		Escreve a linha selecionada no arquivo de saida
#
# arquivo_entrada
#		Obtido do site da B3
#		Cada linha corresponde uma negociacoes a vista
#		Contem todas negociacoes ocorridas na data de referencia
#
# Argumentos
#		arquivo_entrada, lista de tickers, classe de tickers, diretorio_saida
#		
#

	# Argumentos 
	dir_entrada=$1
	dt_referencia=$2
	lista_tickers=$3
	classe_ticker=$4
	dir_saida=$5

	# arq_entrada
	ano=${dt_referencia:0:4}
	mes=${dt_referencia:5:2}
	dia=${dt_referencia:8:2}
	arq_entrada=${dir_entrada}/$dia-$mes-${ano}_NEGOCIOSAVISTA.txt
	echo $arq_entrada

	# arquivo de saida - temporario
	arq_saida_tmp=$dir_saida/${dt_referencia}_$classe_ticker
	#echo $arq_saida_tmp
#
	unzip $dir_entrada/$dt_referencia -d $dir_entrada
#
	for ticker in `cat ${lista_tickers}`
	do
  	   arquivo_saida=${arq_saida_tmp}_${ticker}
	   echo $arquivo_saida
	   # regex dinamico $0 ~ pat
	   awk -v pat=$ticker '$0 ~ pat {print $0}' $arq_entrada | sed 's|,|\.|g' > $arquivo_saida
	done
#
 	rm -v $arq_entrada
#
	exit 0
