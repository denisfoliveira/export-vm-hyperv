# Script para Export e compactação de máquina virtual do Hyper-V

Esse script foi criado para atender uma demanda no qual é preciso fazer o export, compactar e zipar uma máquina virtual que se encontra no Hyper-V.
Observação: Ele foi feito para manter somente 1 arquivo ZIP de Backup na pasta.

## O que você precisa fazer:

1 - Criar uma pasta de Backup no C:
2 - Jogar esse Script na pasta criada. 
3 - Editar as seguintes linhas do Script: 

- cd [aqui colocará o caminho da pasta criada]
- $VMName = "nome_da_maquina_mostrada_no_hyper-v"
- $ExportPath = "caminho da pasta criada, o mesmo caminho inserido na primeira linha"
- $SevenZipPath = "C:\Program Files\7-Zip\7z.exe" # Caminho para o executável 7-Zip

## O que ele faz:

1 - O Script acessa a pasta de backup e faz a verificação se tem algum arquivo ZIP iniciando com o nome da máquina: 

- Exemplo: 
- Nome da máquina: Sistema
- Então ele irá verificar todo arquivo que começa com Sistema, localizando arquivos como: Sistema_XXX_XXX (com datas, etc)

2 - Os arquivos ZIPs encontrados serão deletados.

3- Realiza o Export da máquina virtual, criando uma pasta com o nome da máquina, com o tamanho total da máquina virtual.

4- Compacta e zipa essa pasta, com o nome da máquina definida na variável, adicionando a data e hora.

- Exemplo: Sistema_20240406_093500.zip

5 - Apaga a pasta criada pelo export, mantendo somente o arquivo ZIP na pasta.

## Para automatizar, é só criar uma Task no Windows para executar o Script diariamente.

## Essa foi uma solução que encontrei para realizar o backup da máquina virtual, e não utilizar muito espaço do HD. Posteriormente, eu utilizo o Cobian para jogar essa pasta em uma pasta no Google Drive que fica em Stream. Deixando somente 1 arquivo completo na pasta.

