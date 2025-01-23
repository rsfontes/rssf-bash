#! /usr/bin/gawk -f
#
# cotahist.gawk -- Soma o volume diario do FII
#
# arquivo_entrada --  ARGV[1]
#
# argumentos  -- arquivo_entrada
#	formato - path/data_ticker
#
#
#	Esta calculando corretamente!
#
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
BEGIN {
}
#
# The braces avoid print each line
#
/^01/{ # ver pagina 186
	data_pregao = substr($0, 3,8)
	cd_bdi = substr($0,11,2)
	cd_negociacao = substr($0,13,12)
	tp_mercado = substr($0,25,3)
	nome = substr($0,28,12)
	especificacao = substr($0,40,10)
	prazo_termo = substr($0,50,3)
	moeda_referencia = substr($0,53,4)
	preco_abertura = substr($0,57,13)
	preco_maximo = substr($0,70,13)
	preco_minimo = substr($0,83,13)
	preco_medio = substr($0,96,13)
	preco_ultimo = substr($0,109,13)
	preco_melhor_compra = substr($0,122,13)
	preco_melhor_venda = substr($0,135,13)
	num_negocios = substr($0,148,5)
	qt_titulos = substr($0,153,18)
	volume = substr($0,171,18)
	preco_opcoes = substr($0,189,13)
	ind_correcao = substr($0,202,1)

	#printf("%s;","")
	printf("%s;",data_pregao)
	printf("%s;",cd_bdi)
	printf("%s;",rtrim(cd_negociacao))
	printf("%s;",tp_mercado)
	printf("%s;",rtrim(nome))
	printf("%s;",rtrim(especificacao))
	printf("%s;",prazo_termo)
	printf("%s;",rtrim(moeda_referencia))
	printf("%.2f;",preco_abertura/100)
	printf("%.2f;",preco_maximo/100)
	printf("%.2f;",preco_minimo/100)
	printf("%.2f;",preco_medio/100)
	printf("%.2f;",preco_ultimo/100)
	printf("%.2f;",preco_melhor_compra/100)
	printf("%.2f;",preco_melhor_venda/100)
	printf("%d;",num_negocios)
	printf("%d;",qt_titulos)
	printf("%.2f;",volume/100)
	printf("%.2f;",preco_opcoes)
	printf("%d\n",ind_correcao)
}
#
#
END {
}
