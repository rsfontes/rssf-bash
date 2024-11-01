#! /usr/bin/gawk -f
#
# VolFii.gawk -- Soma o volume diario do FII
#
# arquivo_entrada --  ARGV[1]
#	dt_referencia
#	ticker
#	num_negocios
#	financeiro
#
# argumentos  -- arquivo_entrada
#	formato - path/data_ticker
#
#
#	Esta calculando corretamente!
#
BEGIN {

	FS = ","
	OFS = ","

	# z contem o numero de elementos de parametro
	z=split(ARGV[1],parametro,/\//)
	split(parametro[z],nomearquivo,/_/)
	data=nomearquivo[1]
	classe_ticker=nomearquivo[2]

	num_negocios=0; financeiro=0

}
#
# The braces avoid print each line
#
{
	num_negocios=num_negocios+$3
	financeiro=financeiro+$4
	#printf("%s,%.4f\n", num_negocios, financeiro)
}
#
#
END {
	printf("%s,%s,%d,%.6f\n", data, classe_ticker, num_negocios, financeiro)
}
