#!/bin/bash
# Teste de if-then aninhado
var1="usuario1"
var2="usuario2"

if ls /home/$var1
then
    echo "Diretório do usuário $var1 encontrado!"
elif ls /home/$var2
then
    echo "Diretório do usuário $var2 encontrado!"
else
    echo "Nenhum dos dois diretórios foi encontrado!"
fi
