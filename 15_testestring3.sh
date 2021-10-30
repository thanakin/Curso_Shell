#!/bin/bash
# testar se variável possui conteúdo

var1=abacate
var2=''

if [ -n $var2 ]
then
echo "Variável não está vazia, contém o valor $var1"
else
echo "Variável está vazia"
fi

if [ -z $var2 ]
then
echo "Variável está vazia"
else 
echo "Variável não está vazia"
fi