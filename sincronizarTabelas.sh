#!/bin/bash

## Configurações do servidor 1
### IP
SERVER1=172.18.0.40
### Usuário
USER1=postgres
### Senha
PASS1=docker
### Porta
PORT1=5432
### Banco
DB1=postgres
### Lista de Tabelas a serem sincronizadas para o servidor 2
TABLES1=("tabela2" "tabela3")

## Configurações do servidor 2
### IP
SERVER2=172.18.0.50
### Usuário
USER2=postgres
### Senha
PASS2=docker
### Porta
PORT2=5432
### Banco
DB2=postgres
### Lista de Tabelas a serem sincronizadas para o servidor 1
TABLES2=("tabela1" "tabela4")

## LOG
LOG_FILE="execucao.log"


echo "--------------------------------------" >> $LOG_FILE
date >> $LOG_FILE
echo "--------------------------------------" >> $LOG_FILE

## Sincronização dos dados do servidor 1 para o servidor 2
### Loop sobre as tabelas
for tbl1 in ${TABLES1[@]}; do
### Sincronização tabela a tabela
	echo "-- $tbl1" >> $LOG_FILE
	pgsync --to-safe --from "postgres://$USER1:$PASS1@$SERVER1/$DB1" --to "postgres://$USER2:$PASS2@$SERVER2/$DB2" $tbl1 &>> $LOG_FILE
	echo "" >> $LOG_FILE
done


## Sincronização dos dados do servidor 2 para o servidor 1
### Loop sobre as tabelas
for tbl2 in ${TABLES2[@]}; do
### Sincronização tabela a tabela
	echo "-- $tbl2" >> $LOG_FILE
	pgsync --to-safe --from "postgres://$USER2:$PASS2@$SERVER2/$DB2" --to "postgres://$USER1:$PASS1@$SERVER1/$DB1" $tbl2 &>> $LOG_FILE
	echo "" >> $LOG_FILE
done

echo "" >> $LOG_FILE
echo "" >> $LOG_FILE
echo "" >> $LOG_FILE