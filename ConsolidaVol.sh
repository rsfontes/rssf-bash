#!/bin/bash
#
# ConsolidaVol.sh
#               X
#
# Argumentos
#               diretorio de entrada, dt_referencia, classe de tickers, arquivo(s) de saida
#
#

	dir_entrada=$1
	dt_referencia=$2
	classe_ticker=$3
	dir_saida=$4
	contador=0
#
	arq_saida=${dir_saida}/${dt_referencia}_${classe_ticker}.csv

#
	for arquivo in ${dir_entrada}/${dt_referencia}_${classe_ticker}*
	do
		./VolTicker.gawk $arquivo >> $arq_saida
		let "contador +=1"
	done
#
	echo 'Foram consolidados ' $contador 'registros.'
	exit 0
