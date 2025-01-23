#!/bin/bash
#
# UploadTicker.sh
#               Procede upload para tabela mysql   
#
# parametro
#		arquivo upload
#
# Tratamento de 'data load local'
#		 opt_local_file=1 definido em ~/data-infile.ini (ver --defaults-extra-file)
# 		local_file=1 definido para o server atraves do workbench 
#
# Tratamento de password
#		/etc/my.cnf
#

	#dir_entrada=$1
	#dt_referencia=$2
	#classe_ticker=$3
	#arq_upload=${dir_entrada}/${dt_referencia}_${classe_ticker}.csv
	arq_upload=$1

	user="sqluser"

	load_stats=`mysql --defaults-extra-file=data-infile.ini -u ${user} -v -e "load data local infile '${arq_upload}' into table B3.cotahist fields terminated by ';'(dt_pregao, cd_bdi, ticker, tp_mercado, nm_resumido, especificacao, prazo_dias, moeda, vl_abertura, vl_maximo, vl_minimo, vl_medio, vl_ultimo, vl_oferta_compra, vl_oferta_venda,qt_negocios, qt_titulos, volume, vl_exercicio_opcoes, ind_correcao_precos)"`

	echo "${load_stats}"

