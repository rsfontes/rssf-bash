#!/bin/bash
#
# UploadTicker.sh
#               Procede upload para tabela mysql   
#
# parametro
#		arq_uload
#

	user="sqluser"
	#PASSWORD="sqluser"
	arq_upload=$1

#
# load data local - any directory
#
# password definida em /etc/my.cnf
# opt_local_file=1 definido em ~/data-infile.ini (ver --defaults-extra-file)
# local_file=1 definido atraves do workbench 
#

	load_stats=`mysql --defaults-extra-file=data-infile.ini -u ${user} -v -D FII -e "load data local infile '${arq_upload}' into table indices.b3_composicao fields terminated by ','(indice, ticker, carteira)"`

	echo "${load_stats}"

