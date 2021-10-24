# Curso Shell Script
Curso oferecido no Youtube pela https://www.youtube.com/c/bosontreinamentos

## Variáveis de Ambiente

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

## Arrays de Ambiente
`testearray=(laranja morango acerola abacaxi)`cria o array.  
`echo ${testearray[1]}` acessa o índice 1 do array.  
`echo ${testearray[*]}` exibe todo o conteúdo do array.  
`testearray[2]=banana` altera o valor do índice 2.  
`unset testearray[2]` remove o índice 2.  
`unset testearray[*]` remove todo o array.  
`testearray[4]=mamão` adiciona novo índice.  

## Aliases
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

## Arquivos de Configuração
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

#### Referência
https://www.youtube.com/playlist?list=PLucm8g_ezqNrYgjXC8_CgbvHbvI7dDfhs