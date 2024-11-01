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

	dir_entrada=$1
	dt_referencia=$2
	classe_ticker=$3
	arq_upload=${dir_entrada}/${dt_referencia}_${classe_ticker}.csv

	user="sqluser"

	load_stats=`mysql --defaults-extra-file=data-infile.ini -u ${user} -v -D FII -e "load data local infile '${arq_upload}' into table B3.volume fields terminated by ','(dt_referencia, ticker, qt_negociada, vol_total)"`

	echo "${load_stats}"

