#! /usr/bin/gawk -f
#
# VolFii.gawk -- Soma o volume diario do FII
#
# arquivo_entrada -- 
#	DataReferencia;
#	CodigoInstrumento;
#	AcaoAtualizacao;
# $4	PrecoNegocio;
# $5	QuantidadeNegociada;
#	HoraFechamento;
#	CodigoIdentificadorNegocio;
#	TipoSessaoPregao;
#	DataNegocio;
#	CodigoParticipanteComprador;
#	CodigoParticipanteVendedor
#
# argumentos  -- arquivo_entrada
#	formato - path/dt_referencia_ticker
BEGIN {

	FS = ";"
	OFS = ","

	# z contem o numero de elementos de parametro
	z=split(ARGV[1],parametro,/\//)
	split(parametro[z],nomearquivo,/_/)
	dt_referencia=nomearquivo[1]
	ticker=nomearquivo[3]

	compra=0; financeiro=0

}
#
# The braces avoid print each line
#
{
	compra=compra+$5
	financeiro=financeiro+($4*$5)
	#printf("%s,%s,%s,%.4f\n", $1,$4, $5, financeiro)
}
#
#
END {
	printf("%s,%s,%d,%.6f\n", dt_referencia, ticker, compra, financeiro)
	#print dt_referencia,ticker,$compra,$financeiro
}
