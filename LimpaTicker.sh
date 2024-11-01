#!/bin/bash
#
# LimpaTicker.sh
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
# Print usage if requested.
if [[ $1 == "--help" || $1 == "-h" ]]
then
    echo "Usage: $0 [diretorio data_referencia classe-ticker]"
    exit 0
fi
	diretorio=$1
	dt_referencia=$2
	classe_ticker=$3

	rm -v $diretorio/${dt_referencia}_$classe_ticker* 

	exit 0
