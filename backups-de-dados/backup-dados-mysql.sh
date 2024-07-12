#!/bin/bash

CAMINHO_HOME=/home/galcastro
cd $CAMINHO_HOME

if [ ! -d backup ];
then
    mkdir backup
fi

if [ -z $1 ];
then
    while [ -z $nome_do_banco ];
    do
        read -p "Você esqueceu de colocar o parâmetro (nome do banco para o backup): " nome_do_banco
    done

else
	 nome_do_banco="$1"
fi

if [ -n '$nome_do_banco' ];
then
	mysqldump -u root $nome_do_banco > $CAMINHO_HOME/backup/$nome_do_banco.sql

	if [ $? -eq 0 ]
	then
    		echo "Backup foi realizado com sucesso"
	else
    		echo "Houve um problema backup não realizado!"
	fi
fi
