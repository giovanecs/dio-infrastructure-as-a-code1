#!/bin/bash

echo "Criando diretórios..."

directories=("/publico" "/adm" "/ven" "/sec")

for dir in "${directories[@]}"
do
    mkdir -p "$dir"
done

echo "Criando grupos de usuários..."

groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")

for group in "${groups[@]}"
do
    groupadd "$group"
done

echo "Criando usuários..."

users=(
    "carlos:GRP_ADM"
    "maria:GRP_ADM"
    "joao:GRP_ADM"
    "debora:GRP_VEN"
    "sebastiana:GRP_VEN"
    "roberto:GRP_VEN"
    "josefina:GRP_SEC"
    "amanda:GRP_SEC"
    "rogerio:GRP_SEC"
)

for user in "${users[@]}"
do
    username="${user%%:*}"
    group="${user#*:}"
    useradd "$username" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G "$group"
done

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim....."

