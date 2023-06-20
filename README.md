# Script de Sincronização de Tabelas

Este script usa como base o **pgsync**. Este comando é disponibilizado através do instalador **gem** com o comando:

> gem install pgsync

Caso ocorra falha na instalação do pgsync, devem ser verificadas as dependências:

- Para distribuições compatíveis com Debian Linux, as dependências são: build-essentials,ruby-dev e libpq-dev
- Para distribuições compatíveis com Fedora Linux, as dependências são: libpq-devel, make, automake, gcc, gcc-c++, kernel-devel e ruby-devel

Uma vez instalado o script pode ser executado.

# Configuração

A configuração é feita pela definição de variáveis no arquivo _sincronizarTabelas.sh_.

Para devida execução do script, há 3 conjuntos de configurações:

1. Configurações dos servidor 1:
  - _SERVER1_: endereço de um dos servidores a serem sincronizados
  - _USER1_: nome do usuário no banco de dados do servidor 1
  - _PASS1_: senha do usuário no banco de dados do servidor 1
  - _PORT1_: porta de conexção com banco de dados no servidor 1
  - _DB1_: nome do banco de dados no servidor 1
  - _TABLES1_: lista de tabelas no banco de dados do servidor 1, cujos dados serão sincronizados no servidor 2. A lista é composta pelos nomes das tabelas, os nomes são entre aspas duplas e separados por um único espaço
2. Configurações dos servidor 1:
  - _SERVER2_: endereço do outro servidor a ser sincronizado
  - _USER2_: nome do usuário no banco de dados do servidor 2
  - _PASS2_: senha do usuário no banco de dados do servidor 2
  - _PORT2_: porta de conexção com banco de dados no servidor 2
  - _DB2_: nome do banco de dados no servidor 2
  - _TABLES2_: lista de tabelas no banco de dados do servidor 2, cujos dados serão sincronizados no servidor 1. A lista é composta pelos nomes das tabelas, os nomes são entre aspas duplas e separados por um único espaço (tal como a lista de tabelas do servidor 1
3. Nome do arquivo de log, onde serão gravados os logs de execução. O nome do arquivo pode ser definido com path absoluto ou apenas o nome (para gravar o log no diretório atual)

# Execução

Uma vez configurado, o script pode ser usado diretamente via prompt de comando ou adicionado a um serviço de agendamento, como a crontab.