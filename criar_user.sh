#!/bin/bash

echo "Criando usuários do sistema...."

create_user() {
    local username=$1
    local description=$2
    local password=$3

    useradd $username -c "$description" -s /bin/bash -m -p $(openssl passwd -crypt $password)
    passwd $username -e
}

create_user guest10 "Usuário convidado" "Senha123"
create_user guest11 "Usuário convidado" "Senha123"
create_user guest12 "Usuário convidado" "Senha123"
create_user guest13 "Usuário convidado" "Senha123"

echo "Finalizado!!"
