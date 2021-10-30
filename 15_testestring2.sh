#!/bin/bash
# Testar não-igualdade de strings
fruta=laranja
if [ $fruta != laranja ]
then
echo "A fruta não é laranja, é $fruta"
else
echo "A fruta é $fruta"
fi