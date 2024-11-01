#!/bin/bash

#################### SCRIPT PARA BACKUP MYSQL ####################
# Jeferson R. Costa <rc.jeferson@gmail.com>                      #
# Created Feb, 2013                                              #
# Update Feb, 2013                                               #

# Definindo parametros do MySQL
echo "  -- Definindo parametros do MySQL ..."
DB_NAME=$1 #parametro passado na linha de comando
DB_USER='sqladmin'
DB_PASS='sqladmin'
DB_PARAM='--add-drop-table --add-locks --extended-insert --single-transaction --quick --routines'

# Definindo parametros do sistema
echo "  -- Definindo parametros do sistema ..."
DATE=`date +%Y-%m-%d`
MYSQLDUMP=/usr/bin/mysqldump
BACKUP_DIR=~/bkp/
BACKUP_NAME=$DB_NAME-$DATE.sql
BACKUP_TAR=$DB_NAME-$DATE.tar

#Gerando arquivo sql
echo "  -- Gerando Backup da base de dados $DB_NAME em $BACKUP_DIR/$BACKUP_NAME ..."
$MYSQLDUMP $DB_NAME $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME

# Compactando arquivo em tar
echo "  -- Compactando arquivo em tar ..."
tar -cf $BACKUP_DIR/$BACKUP_TAR -C $BACKUP_DIR $BACKUP_NAME

# Compactando arquivo em bzip2
echo "  -- Compactando arquivo em bzip2 ..."
bzip2 $BACKUP_DIR/$BACKUP_TAR

# Excluindo arquivos desnecessarios
echo "  -- Excluindo arquivos desnecessarios ..."
rm -rf $BACKUP_DIR/$BACKUP_NAME

FTP_SERVER="192.168.0.4"
FTP_USERNAME="rsfontes"
FTP_PASSWORD="Nata$220"
FTP_UPLOAD_DIR="/rsfontes/backup/MySQL"

ftp -d << END_FTP
open $FTP_SERVER
cd $FTP_UPLOAD_DIR
lcd $BACKUP_DIR
put $BACKUP_TAR.bz2 
bye
END_FTP


if test $? = 0
then
    echo "Database successfully uploaded to the FTP Server!"
    #echo "Database successfully created and uploaded to the FTP Server!" | mail -s "Backup from $DATE" my.email@whereever.com

else
    echo "Error in database upload to Ftp Server" > $LOG_FILE
fi

# Excluindo arquivo ZIP
echo "  -- Excluindo arquivos zipados ..."
#rm $BACKUP_DIR/$BACKUP_TAR.bz2
