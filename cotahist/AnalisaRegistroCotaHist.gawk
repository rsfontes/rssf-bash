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
BEGIN {

}
#
# The braces avoid print each line
#
/^012025012012CPLG11/{ # ver pagina 186
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
}
#
#
END {
	printf("%-20s\t%s\n","data_do_pregao",data_pregao)
	printf("%-20s\t%s\n","codigo_bdi",cd_bdi)
	printf("%-20s\t%s\n","codigo_negociacao",cd_negociacao)
	printf("%-20s\t%s\n","tipo_mercado",tp_mercado)
	printf("%-20s\t%s\n","nome_resumido",nome)
	printf("%-20s\t%s\n","especificacao_papel",especificacao)
	printf("%-20s\t%s\n","prazo_dias_termo",prazo_termo)
	printf("%-20s\t%s\n","moeda_referencia", moeda_referencia)
	printf("%-20s\t%.2f\n","preco_abertura",preco_abertura/100)
	printf("%-20s\t%.2f\n","preco_maximo",preco_maximo/100)
	printf("%-20s\t%.2f\n","preco_minimo",preco_minimo/100)
	printf("%-20s\t%.2f\n","preco_medio",preco_medio/100)
	printf("%-20s\t%.2f\n","preco_ultimo",preco_ultimo/100)
	printf("%-20s\t%.2f\n","preco_melhor_compra",preco_melhor_compra/100)
	printf("%-20s\t%.2f\n","preco_melhor_venda",preco_melhor_venda/100)
	printf("%-20s\t%d\n","numero_negocios",num_negocios)
	printf("%-20s\t%d\n","quantidade_titulos",qt_titulos)
	printf("%-20s\t%.2f\n","volume_total",volume/100)
	printf("%-20s\t%.2f\n","preco_exercicio_opcoes",preco_opcoes)
	printf("%-20s\t%d\n","indicador_correcao_precos",ind_correcao)
}
