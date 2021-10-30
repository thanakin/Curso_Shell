#!/bin/bash
# Testar  igualdade de strings
nome=usuario
if [ $USER = $nome ]
then
echo "Ola $nome"
fi