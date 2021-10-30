#!/bin/bash
# Teste de condicional composto
if ls /home/usuario/teste
then
    echo "Diretório teste encontrado!"
else
    echo "Diretório teste não encontrado!"
fi
