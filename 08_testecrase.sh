#!/bin/bash
# Copiar a listagem de um diretório para arquivos, de acordo com daa e hora.
 arq=`date +%d%m%y-%H%M%S`
 ls -la /home/$USER > $arq.log