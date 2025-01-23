#! /usr/bin/bash 
#
#
#
	grep ^01202401..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_01.TXT
	grep ^01202402..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_02.TXT
	grep ^01202403..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_03.TXT
	grep ^01202404..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_04.TXT
	grep ^01202405..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_05.TXT
	grep ^01202406..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_06.TXT
	grep ^01202407..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_07.TXT
	grep ^01202408..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_08.TXT
	grep ^01202409..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_09.TXT
	grep ^01202410..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_10.TXT
	grep ^01202411..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_11.TXT
	grep ^01202412..12[A-Z]* ~/dados/raw/COTAHIST_A2024.TXT > ~/dados/cleaned/COTAHIST_FII_2024_12.TXT
	exit 0
