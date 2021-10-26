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

## Variáveis do Shell
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

## Funções
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

### Criando Scripts Simples e comando Echo (Aula 6)
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

### Usando Variáveis de Ambiente (Aula 7)
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

### Redirecionar comandos para variáveis (Aula 8)
Utilizando crases é possível atribuir a saída de um comando do shell a uma variável:  
`dia='date'`
`echo "Data é $dia"`  
**Observação.:** <ins>utilizei aspa simples ' pois no markdown a crase ` é utilizada para formatação de códigos.</ins>  

### Redirecionar entra e saída de dados (Aula 9)
Redirecionamento de Saída, criando arquivo novo ou **sobrescrevendo** arquivo existente:  
`ls > arq.txt`  

Redirecionamento de Saída, **incrementando** arquivo existente:  
`date >> arq.txt`  

Redirecionamento de Entrada, permite tomar o conteúdo de um arquivo para um comando:  
`wc < arq.txt`  
O Comando *wc* obtem 3 contagens sobre o conteúdo do arquivo:
* N° de linhas  
* N° de palavras
* N° de bytes  

Redirecionamento de Entrada Inline:  
`wc << EOF`  
`> 1ª linha de texto`  
`> 2ª linha de texto`  
`EOF`  
*"EOF"* foi usado como marcador de inicio e fim dos dados, mas pode ser substituído por qualquer outra palavra.  

### Cálculos Matemáticos Simples (Aula 10)
É possível realizar cálculos matemáticos, atribuindo resultado de uma operação a uma variável.  
`var1=$[2 + 6]`  
`echo $var1`  
`var2=$[$var1 * 2]`  
`echo $var2`  

#### Problema com calculos...  
O Shell bash trabalha somente com valores inteiros!  
`var1=9`  
`var2=2`  
`var3=$[$var1/$var2]`  
`echo "Resultado: $var3"`  
*Resultado deste exemplo deveria ser 4,5, no entanto é retornado 4*  
