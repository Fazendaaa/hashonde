# 'Nova Aba' universal, em qualquer aparelho e navegador

> Una Salus Victis Nullam Sperare Salutem - (Virgil - 19 AC)

foto de capa: ["IMG_5052"](https://www.flickr.com/photos/35842362@N03/4432196640) by [Fr James Bradley](https://www.flickr.com/photos/35842362@N03) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

Assim como uma biblioteca tem suas maneiras maneiras de se organizar, há maneiras de organizar o conteúdo consumido recorrentemente na internet. Você pode usar favoritos, deixar as abas abertas colocando o navegador para inicializar de onde parou, colocar elas as páginas fixadas em cards na "nova aba" e etc... A primeira e a última são fáceis de sincronizar entre aparelhos diferentes -- seja um tablet, celular ou computador -- já a segunda nem tanto. Todavia, o problema aparece quando você quer utilizar navegadores diferentes, o Silk no tablet da Amazon, o Edge no celular e o Firefox no computador. Quando a ferramenta é diferente dificilmente elas irão se comunicar de uma forma uniforme... Aí que entra o [Heimdall](https://heimdall.site/)

Pense no Heimdall como um [*Index Librorum Prohibitorum*](https://pt.wikipedia.org/wiki/Index_Librorum_Prohibitorum) reverso, ao invés conter o que você não deveria acessar ter os conteúdos do quais você gostaria de acessar.

![Index_librorum_prohibitorum,_title_page_Wellcome_L0045295.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1595715131145/v-NKzgXYX.jpeg)

["File:Index librorum prohibitorum, title page Wellcome L0045295.jpg"](https://commons.wikimedia.org/w/index.php?curid=36119454) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0?ref=ccsearch&atype=rich)

## Heimdall

Caso você já tenha visto um dos filmes que conte com a presença do Heimdall no Marvel Cinematic Universe já tem uma noção de quem ele é. Mas caso não tenha, se trata de um deus da mitologia nórdica no qual funciona como um "porteiro" que tudo vê -- um nome bem apropriado para o sistema que salva todos os sites importantes para você.

![Processed_SAM_heimdallr.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1595722379870/jUSDKWDAb.jpeg)

["File:Processed SAM heimdallr.jpg"](https://pt.wikipedia.org/wiki/Ficheiro:Processed_SAM_heimdallr.jpg#file) is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0?ref=ccsearch&atype=rich)

Para ver o sistema em ação:

[![](http://img.youtube.com/vi/GXnnMAxPzMc/0.jpg)](http://www.youtube.com/watch?v=GXnnMAxPzMc "Heimdall")

Alguns dos prós do Heimdall são:

- Nada mais de vendor lock-in -- você ter que utilizar o mesmo navegador em todas as plataformas para ter a comodidade que procura
- Maior possibilidade de configurações como temas, botões, cores e etc
- Comunidade ativa que procura sempre manter a ferramenta atulizada e sem bugs

## Rancher

[Rancher](https://rancher.com/) é um orquestrador de [Docker](https://www.docker.com/) e [Kubernetes](https://kubernetes.io/) no qual já escrevi alguns textos sobre, caso queira saber mais recomendo que leia [este](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf) texto para auxilio.

1. Acesse o seu servidor Rancher:
```shell
ssh -l seuUsuario ip.do.servidor.rancher
```
2. Crie uma pasta chamada `heimdall`:
```shell
mdkir ~/heimdall
```
3. Copie o caminho absoluto desta pasta:
```shelll
cd ~/heimdall
pwd # este comando irá mostra o caminho que deverá copiar
```
4. Copie os seguintes números, eles serão utilizados no passo 7:
```shell
id -u $USER #PUID
id -g $USER #PGID
```
5. Adicione a imagem [linuxserver/heimdall](https://hub.docker.com/r/linuxserver/heimdall) dando um nome à ela:
![image1087.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595721498822/PJwdW5voh.png)
6. Configure as portas necessárias, a `80` e a `443` no container para qualquer duas portas disponíveis no seu servidor -- no caso do exemplo foram `8500` e `8600`:
![image1075.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595721512609/dyGsBy5m0.png)
7. Coloque os valores coletados no passo 4:
![image1076.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595721600956/TwxmP4A3V.png)
8. Cole o valor copiado no passo 4 configurando o resto dos valores no volume:
![image1063.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595721519329/GWQ_l7_iB.png)

Para ver o resultado, acesse a porta que você colocou relacionada à porta `80` do container. Vou mostar o meu painel atual:

![g995.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595716972162/vJzeIrowY.png)

Do celular agora:

![g987.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595716977377/uW20hEpAk.png)

Caso você não consiga ver um valor nisto, pense nele como uma tela central de produtos e serviços utilizados pela sua empresa, centralizando ele em uma tela todos os seus funcionários poderão acessar os serviços que não necessáriamente tem uma URL como "https://example.com" mas sim algo como "http://algum.ip.tenebroso.extremo:portaNaoFixa" sem precisar decorar eles... E a vantagem que por ele estar rodando dentro de um Docker, vai poder inicializar quantas imagens quiser de telas diferentes no Rancher, digamos que você tem vários times na empresa, um para cada um. Exemplo do painel da empresa na qual trabalho:

![g1024.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595726154502/JtH5HxWeX.png)

## Apêndice

- Caso tenha gostado do Rancher e queria ver mais sobre ele, recomendo estes dois textos:
  - [Nuvem de terceiros quando você pode ter a sua própria em casa com o clique de um botão?](https://fazenda.hashnode.dev/nuvem-de-terceiros-quando-voce-pode-ter-a-sua-propria-em-casa-com-o-clique-de-um-botao-ckccpbe5k005sqgs18e89h4ik)
  - [Análise de dados + Site + Banco de Dados? Tudo no isso seu PC e sem precisar instalar o R, Shiny e o Mongo](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo-ckcfwjz380058kns13oye8f03) 

## Referências

- [Meet Heimdall, Your Homelab Application Dashboard](https://youtu.be/PA01Z6-z8Qs)
- [Heimdall](https://pt.wikipedia.org/wiki/Heimdall)

