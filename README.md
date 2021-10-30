# Curso Shell Script Bóson Treinamentos
Curso oferecido no Youtube pela https://www.youtube.com/playlist?list=PLucm8g_ezqNrYgjXC8_CgbvHbvI7dDfhs

## Variáveis de Ambiente (Aula 2)

Comandos `env` e `printenv` mostram as variáveis de ambiente.  
PATH - Lista de diretórios de programas executáveis.  
USERNAME - Nome do usuário logado.  
TERM - Tipo de terminal ou janela do terminal em uso.  
HOME - Diretório Home do usuário atual.  
UID - Uid do usuário atual.  
RANDOM - Gera um número aleatório.  
LANGUAGE - Idioma, especificado como locale.

Para criar uma variável global, a crie como local depois exporte com o comando `export`  
`export teste`

### Variáveis do Shell
Exemplo de atribuição de valor a variável "teste":  
`teste='valor'`  
Exibindo o valor de "teste:  
`echo $teste`  
Removendo "teste" do Path:  
`unset teste`
`echo $SECONDS` exibira o conteúdo da variável Seconds, que guardo o tempo em segundos que o Shell esta aberto.  
`echo $SHELL` exibe o caminho do Shell padrão do sistema.

## Arrays de Ambiente (Aula 3)
`testearray=(laranja morango acerola abacaxi)`cria o array.  
`echo ${testearray[1]}` acessa o índice 1 do array.  
`echo ${testearray[*]}` exibe todo o conteúdo do array.  
`testearray[2]=banana` altera o valor do índice 2.  
`unset testearray[2]` remove o índice 2.  
`unset testearray[*]` remove todo o array.  
`testearray[4]=mamão` adiciona novo índice.  

## Aliases (Aula 4)
Pode-se definir aliases para comando(s) usado(s) com frequência:  
`alias mo=more` cria um alias para o comando *more*  
`alias lshome='cd /home; ls'` cria um alias para os comandos *cd /home* e *ls*  
`aliasl lsl='ls-l'`modifica o comportamento do comando *ls-l*  
`unalias lshome` remove o alias especificado.  
`alias` exibe todos os alias presentes no sistema.  

### Funções
Pode-se criar funções no bash:  
*nome_função() {comandos}*
`palavra() {`  
`>cd ~`  
`>echo linha adicionada >> teste_func`  
`}`  
`typeset -f` exibe todas as funções presentes no bash.  

## Arquivos de Configuração (Aula 5)
### Shell de Login
Iniciado após o login no Linux, procura por arquivos nesta ordem:
`/etc/profile` executa também todos arquivos em */etc/profile.d*  
`~/.bash_profile`  
`~/.bash_login`  
`~/.profile`  

### Shell Interativo
Iniciado a partir de outro bash, executa o arquivo *.bashrc* da pasta do usuário.

### Shell Não-Interativo
É iniciado para executar scripts, verificando a variável *BASH_ENV* em busca de comandos de inicialização.  
Por padrão, não tem valor configurado.

## Criando Scripts Simples e comando Echo (Aula 6)
A utilização de arquivos, permite a repetição de um ou mais comandos. O arquivo deve começar especificando qual shell sera usado:  
`#!/bin/bash`  

O simbolo `#` representa comentário, exceto na primeira linha, quando `#!` indica o shell a ser usado.  
Exemplo de um arquivo:  
`#!/bin/bash`  
`# Este é o meu primeiro script do bash`  
`cd /`  
`ls -l`  

Após a criação do script, o mesmo deve ter permissão de execução:
`chmod a+x meuscript.sh`  
Ao ser executado, o Shell ira buscar este script em um pasta padrão de scripts do sistema. Como este se encontra em uma outra pasta, deve-se informar o caminho para o mesmo:  
`./meuscript.sh`  

Alternativamente, pode ser informado o caminho completo ao script:  
`/home/meuusuario/documents/meuscript.sh`  
Adicionarei uma mensagem a ser exibida pelo script:  
`#!/bin/bash`  
`# Este é o meu primeiro script do bash`  
`cd /`  
`ls -l`  
`echo "Listando diretórios dentro da raiz"`  

Opcionalmente, pode-se utilizar `echo -n` que faz o comando seguinte é ser executado na mesma linha.  
Editarei novamente o script:  
`#!/bin/bash`  
`# Este é o meu primeiro script do bash`  
`cd /`  
`ls -l`  
`echo "Listando diretórios dentro da raiz"`  
`echo -n "Usuário logado no momento é "`  
`whoami`  

## Usando Variáveis de Ambiente (Aula 7)
Exemplo simples de script que faz uso das variáveis de ambiente:  
`#!/bin/bash`  
`# Informações sobre o usuário:`  
`echo "Usuário: $USER"`  
`echo "Diretório: $HOME"`  
`echo "UID do usuário: $UID"`  

O usuário pode criar suas próprias variáveis, podendo ter até 20 caracteres no nome e são *case-sensitive*  
**Observação.:** variáveis criadas pelo usuário são <ins>desalocadas</ins> ao fim do script.  

Outro exemplo de script, criando variáveis de  usuário:
`#!/bin/bash`  
`# Teste de variáveis`  
`idade=25`  
`nome="Monica"`  
`echo "A $nome tem $idade anos de idade"`  

## Redirecionar comandos para variáveis (Aula 8)
Utilizando crases é possível atribuir a saída de um comando do shell a uma variável:  
`dia='date'`
`echo "Data é $dia"`  
**Observação.:** <ins>utilizei aspa simples ' pois no markdown a crase ` é utilizada para formatação de códigos.</ins>  

## Redirecionar entrada e saída de dados (Aula 9)
Redirecionamento de Saída, criando arquivo novo ou **sobrescrevendo** arquivo existente:  
`ls > arq.txt`  

Redirecionamento de Saída, **incrementando** arquivo existente:  
`date >> arq.txt`  

Redirecionamento de Entrada, permite tomar o conteúdo de um arquivo para um comando:  
`wc < arq.txt`  
O Comando *wc* obtém 3 contagens sobre o conteúdo do arquivo:
* N° de linhas  
* N° de palavras
* N° de bytes  

Redirecionamento de Entrada Inline:  
`wc << EOF`  
`> 1ª linha de texto`  
`> 2ª linha de texto`  
`EOF`  
*"EOF"* foi usado como marcador de inicio e fim dos dados, mas pode ser substituído por qualquer outra palavra.  

## Cálculos Matemáticos Simples (Aula 10)
É possível realizar cálculos matemáticos, atribuindo resultado de uma operação a uma variável.  
`var1=$[2 + 6]`  
`echo $var1`  
`var2=$[$var1 * 2]`  
`echo $var2`  

#### Problema com cálculos...  
O Shell bash trabalha somente com valores inteiros!  
`var1=9`  
`var2=2`  
`var3=$[$var1/$var2]`  
`echo "Resultado: $var3"`  
*Resultado deste exemplo deveria ser 4,5, no entanto é retornado 4*  

## Usando calculadora do bash (Aula 11)
"Resolve" o problema anterior e implementa uma linguagem de programação que permite:
* Números inteiros e ponto flutuante
* Variáveis simples e arrays
* Comentários estilo linguagem C (/* */)
* Expressões
* Condicionais if-then
* Funções  

Para acessar a calculadora:  
`bc`  
e para finaliza-la:  
`quit`  

Exemplos de utilização:  
`2 + 3`  
`5`  
`3 * (2 + 5)`  
`21`  
`sqrt(81)`  
`9`  

Acessando a calculadora com parâmetro `bc -q`, esta é iniciada sem exibição das linhas de boas vindas/copyright.  

Ao executar a expressão `2/4`, é retornado o valor `0` pois por padrão a calculadora do bash não exibe casas decimais.  

Para correta exibição das casas é preciso informar através da variável `scale`, por exemplo definindo 2 casas decimais:  
`bc -q`  
`2/4`  
`0`  
`scale=2`  
`2/4`  
`.50`  
`quit`  

Fazendo o uso de variáveis dentro da calculadora:  
`bc -q`  
`scale=2`  
`a=4`  
`b=6`  
`a / b`  
`.66`  
`quit`  

É possível usar a calculadora com scripts, fazendo uso de crase:
`variavel='echo "variaveis; expressao" | bc'`  
**Obs.:** <ins>utilizei aspa simples ' pois no markdown a crase ` é utilizada para formatação de códigos.</ins>  

Em alguns casos, pode ser necessário fazer uso de expressões ainda mais complexas, para tal, pode-se fazer uso da entrada de dados inline também com scripts:  
`#!/bin/bash`  
`var1=6`  
`var2=5`  
`var3=4`  
`var4='bc<<EOF`  
`scale=4`  
`a1=($var1*$var2)`  
`b1=($var3+$var1)`  
`a1+b`  
`EOF`  
`'`  
`echo "Resultado: $var4"`  
**Obs.:** <ins>utilizei aspa simples ' pois no markdown a crase ` é utilizada para formatação de códigos.</ins>  

**Obs.2:** as variáveis criadas dentro do comando inline (`a1` e `a2`) não disponíveis fora da `bc`  

## Status de Saída de Comandos (Aula 12)
Cada comando executado no shell, possui um valor de saída, sendo um inteiro entre 0 e 255. Se finalizado com sucesso retorna 0. A variável especial `$?` armazena o valor do ultimo comando executado.  

| Código | Significado |
| --- | --- |
| 0 | Comando completado com sucesso |
| 1 | Erro geral desconhecido |
| 126 | Comando não pode ser executado (permissões) |
| 127 | Comando não encontrado |
| 130 | Comando finalizado com Ctrl+C |

Exemplo de utilização 1:  
`ls`  
`echo $?`  
`0`  

Exemplo de utilização 2:  
`lsy`  
`echo $?`  
`127`  

O valor de saída pode ser definido manualmente ao termino do script, usando o comando `exit`:  
`#!/bin/bash`  
`var1=10`  
`var2=2`  
`var3=$[$var1*$var2]`  
`echo $var3`  
`exit 6 #Retorna o código de saída 6`  

O valor de saida, pode ser o conteúdo de uma variável:  
`exit $var3`  

## Estrutura de Decisão Condicional (Aula 13)
### Decisão Condicional If-Then
Sintaxe:  
`if comando testado` *caso a saida deste comando seja 0*  
`then` *executura uma nova sequencia de comandos*  
&nbsp;&nbsp;&nbsp;&nbsp;`comandos a serem executados`  
`fi`  

Exemplo:  
`if cd /`  
`then`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Diretório raiz encontrado!"`  
`fi`  

### Decisão Condicional If-Then-Else  
Sintaxe:  
`if comando testado` *caso a saida deste comando for 0*  
`then` *executura esta sequencia de comandos*  
&nbsp;&nbsp;&nbsp;&nbsp;`comandos a serem executados`  
`else` *caso a saida for diferente de 0*  
&nbsp;&nbsp;&nbsp;&nbsp;`outros comandos a serem executados`  
`fi`  

## Condicional aninhado if-then com elif (Aula 14)  
Exemplo:  
`if comando 1`  
`then`  
`comandos`  
`elif comando 2`  
`then`  
`comandos 2`  
`else`  
`comandos ele`  
`fi`  

## Comando Test (Aula 15)  
A declaração if-then não consegue avaliar nenhuma condição que não seja o código de status de saída de um comando.
Isso é possível utilizando o comando `test` juntamente com if-then.  
`if test condição`  
`then`  
`comandos`  
`fi`  

Alternativamente, pode ser incluida condição dentro de colchetes, diretamente sem o comando `test`:  
`if [ condição ]`  
`then`  
`comandos`  
`fi`  

Permite avaliar três classes de condições:  
* Comparações Numéricas
* Comparações de Strings
* Comparações de Arquivos

### Comparações Numéricas
| Comparação | Descrição |
| --- | --- |
| n1 -eq n2 | Verifica se n1 é igual a n2 |
| n1 -ge n2 | Verifica se n1 é maior ou igual a n2 |
| n1 -gt n2 | Verifica se n1 é maior do que n2 |
| n1 -le n2 | Verifica se n1 é menor ou igual a a n2 |
| n1 -lt n2 | Verifica se n1 é menor do que n2 |
| n1 -ne n2 | Verifica se n1 é diferente de n2 |  

*Estas comparações verificam numeros inteiros ou variaveis, não suporta ponto flutuante*

Exemplo:  
`#!/bin/bash`  
`# Comparações numéricas com test e if-then`  
`var1=10`  
`var2=15`  
`if [ $var1 -gt 8 ]`  
`then`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "A variável de valor $var1 é maior que 8"`  
`fi`  
`if [ $var1 -eq $var2 ]`  
`then`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Os valores são iguais"`  
`else`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Os valores são diferentes!"`  
`fi`  

### Comparações De Strings  

| Comparação | Descrição |
| --- | --- |
| str1 = str2 | Verifica se str1 é idêntica a str2 |
| str1 != str2 | Verifica se str1 é diferente de str2 |
| str1 < str2 | Verifica se str1 é "menor" que str2 |
| str1 > str2 | Verifica se str1 é "maior" que str2 |
| -n str1 | Verifica se str1 tem comprimento maior que zero |
| -z str1 | Verifica se str1 tem comprimento zero |

Exemplo1:  
`# Testar  igualdade de strings`  
`nome=usuario`  
`if [ $USER = $nome]`  
`then`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Ola $nome"`  
`fi`  

Exemplo2:  
`# Testar não-igualdade de strings`  
`fruta=laranja`  
`if [ $fruta != laranja]`  
`then`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "A fruta não é laranja, é $fruta"`  
`else`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "A fruta é $fruta"`  
`fi`  

Exemplo3:  
`# testar se variável possui conteúdo`  
`var1=abacate`  
`var2=''`  
`if [ -n $var2 ]`  
`then`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Variável não está vazia, contém o valor $valor1"`  
`else`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Variável está vazia"`  
`fi`  

`if [ -z $var2 ]`  
`then`  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Variável está vazia"`  
`else `  
&nbsp;&nbsp;&nbsp;&nbsp;`echo "Variável não está vazia"`  
`fi`  