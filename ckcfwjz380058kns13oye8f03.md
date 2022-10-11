# Análise de dados + Site + Banco de Dados? Tudo no isso seu PC e sem precisar instalar o R, Shiny e o Mongo

> Texto meu... Já sabe que vou arranjar um motivo para socar Docker nele

foto de capa: ["Growth - Earnings Growth - Growth Sign"](https://www.flickr.com/photos/141574894@N07/27448741372) by  [gfdnova1](https://www.flickr.com/photos/141574894@N07) is licensed under [CC BY-SA 2.0 ](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich) 

# Intro

Eu venho citando Docker aqui e ali já faz um tempo só que em execução apenas, sem buildar nada; agora quero mostrar como você pode fazer a sua análise de dados usando [R](https://www.r-project.org/) -- uma linguagem de programação voltada para o público estatístico --, com uma interface web e salvá-la em um banco de dados.

A ideia é mostrar que mesmo você estando no Windows, Mac ou Linux, vai poder escrever uma aplicação robusta que faça a análise que queira e fazer ela rodar onde quiser. Ou seja, se você está no Windows, ela vai rodar no Mac e no Linux -- este último é importante caso queira subir na nuvem, principalmente se não for querer usar o [shinyapps.io](https://www.shinyapps.io/).

E caso queira algum jargão como "micros-serviços", "System As A Service", "cloud-native" e etc... Pode ficar garantido que o seu [cargo cult](https://en.wikipedia.org/wiki/Cargo_cult) de ficar repetindo eles sem entender uma porr#$ do que significam está garantido com este texto...

![2097014897_aa2641d70f_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594345128529/Kk_1TPPtm.jpeg)

 ["Temple Curch"](https://www.flickr.com/photos/87863966@N00/2097014897) by [buggolo](https://www.flickr.com/photos/87863966@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

# Porque o R + Shiny?

> "Elementar, meu caro Watson..."

Normalmente os récem-graduados, pesquisadores e estagiários da empresa em que trabalho tem R durante a graduação -- seja em alguma matéria, Iniciação Científica (IC) ou por conta própria.

Todavia o post não é um endosso da escolha dos dois -- até porque eu próprio tenho alguns pontos contra a combinação que pretendo explorar em um texto mais futuro.

# "Talk is cheap, show me the code"

> Frase do "titio" Linus -- o Trovalds não o Sebastian

![48659436006_616e00e4f1_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594341311630/WfkjPnRsj.jpeg)

 ["do we write code"](https://www.flickr.com/photos/43661283@N00/48659436006) by [m.gifford](https://www.flickr.com/photos/43661283@N00) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

Caso queira ver a aplicação rodado, tenha o `docker` e o `docker-compose` instalados na sua máquina -- caso você esteja no Windows ou no Mac, os dois são uma instalação só dentro do [Docker Desktop](https://www.docker.com/products/docker-desktop).

1. Clone ou baixe [este](https://github.com/Fazendaaa/RSMD) repositório em sua máquina
```shell
git clone https://github.com/Fazendaaa/RSMD
cd RSMD/
```
2. Uma vez dentro dele basta rodar:
```shell
docker-compose up
```
3. Abra seu navegador e digite `localhost` e veja a magia acontecer:

![2020-07-10-021116_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594358348260/fP3vHcaJE.png)

Basicamente o banco de dados armazena todos os valores de número de quebras utilizados para fazer a análise de dados. Isto como uma espécie de log do sistema, também chamada de **trilha de auditoria** por alguns.

![2020-07-10-021120_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594358369528/8F7BJ8W5G.png)

Caso esteja rodando tudo isso em uma rede wi-fi, após descobrir o ip da sua máquina, você pode acessar também o site pelo seu celular:

![image1197.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594365899062/ybyb_2kw1.png)

![image1185.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594365933933/RVV4aZeor.png)

O importante dessa vizualização no seu celular funcionar bem é que caso você deseje publicar amanhã ou depois o seu site como um "app" para um  [Google Store](https://medium.com/@firt/google-play-store-now-open-for-progressive-web-apps-ec6f3c6ff3cc), [Windows Store](https://docs.microsoft.com/en-us/microsoft-edge/progressive-web-apps-edgehtml/microsoft-store) ou até mesmo fazer com que fique salvo como um [app no seu aparalho iOS](https://love2dev.com/pwa/ios/) , pode dar uma olhada [neste](https://cran.r-project.org/web/packages/shinyMobile/readme/README.html) plugin Shiny para Progressive Web Apps (PWA).

O cenário citado anteirormente é um claro ponto positivo para o negócio e o produto em si, mas como desenvolvedor ter a segurança de que um tudo o que eu faço vai rodar no sistema do cliente ou no servidor na nuvem -- uma vez que **não tenho o R instalado na minha máquina** e só desenvolvo usando containers -- é algo que:

- Evita retrabalhos uma vez que o produto que entrego já contem **TUDO** necessário para rodar -- nada de dores de cabeça perdidas por falta de instalar um pacote R, ou por rodar ele em uma versão errada, quem sabe até mesmo pela falta de uma biblioteca de sistema
- Dá uma segurança de poder trocar de hardware sem perder tempo para configurações
- "Binários" da aplicações em qualquer lugar, graças ao [Docker Hub](https://hub.docker.com/) uma vez que a build que faço na minha máquina se torna disponível a todos do meu time independente de onde e qual sistema eles escolham desenvolver

## Pontos importantes

![30465669870_5cabb7b70b_o(1).jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594343620118/kyi4ujIsB.jpeg)

 ["Robot Warning"](https://www.flickr.com/photos/37996646802@N01/30465669870) by [cogdogblog](https://www.flickr.com/photos/37996646802@N01) is licensed under [CC0 1.0](Link) 

No `README.md` do projeto é ressaltado como fazer com que o  [Mongo](https://www.mongodb.com/) do jeito que foi configurado ele tem 'perda de memória recente', ou seja, toda execução ela roda com um BD zerado. Todavia você pode mudar isso **com uma linha de configuração**.

A abordagem do `docker-compose` neste caso tem suas vantagens:

1. Evita com que um BD seja instalado na máquina do desenvolvedor
2. Evita com que o consumo de internet seja alto caso uma nuvem como o [Atlas DB](https://www.mongodb.com/cloud/atlas) esteja sendo utilizada -- o que ajuda principalmente quem está fazendo remote work por causa da quarentena
3. Evita o famoso problema de usar um banco de dados -- agora podendo se aplicar três: um para desenvolvimento, um para homologação e um para produção

Outro ponto importante é que utilizei esta imagem base porque ela vai além do escopo de um demo e se trata de algo disponível e mantido por uma empresa. Caso você queira ver o que há nela para reproduzir e retirar as dependências que não utiliza, por favor, fique a vontade e vá adiante.

Para não ficar **MUITO** fora do escopo do que o texto se propõe, ainda pretendo explicar como é o fluxo de desenvolvimento desta stack na empresa que trabalho.

## Achou que acabou?

> "Achou errado, otário" -- INGÁ, Rogerinho

![9795459904_d888cece01_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594343814092/3DgZhmZXT.jpeg)

 ["Every end is a new beginning."](https://www.flickr.com/photos/78592755@N06/9795459904) by [deeplifequotes](https://www.flickr.com/photos/78592755@N06) is licensed under  [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich) 

A imagem base do utilizada no projeto possui algumas "vantages". Ela pode ter rodado no seu x86 do seu laptop sem menor dor de cabeça, mas como já [pontuado anteriormente](
https://fazenda.hashnode.dev/como-distribuir-codigo-para-rodar-em-diversas-arquiteturas-r-docker-buildx-ckc5i3ogj00bllps10znnbyio), o Docker tem arquiteturas diferentes de CPU. Isto significa que você vai poder rodar este projeto nas seguintes arquiteturas:

- 386
- amd64
- arm/v6
- arm/v7
- arm64/v8
- s390x
- ppc64le

O que para ti agora não pode ter grande diferença, mas recomendo ler as referências do texto citado no link anterior.

# Quer rodar em um servidor em casa?

![34028948085_44cf6ff191_o.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594342527645/ednbmbfGi.png)

 ["Orange Pi 2G-IoT"](https://www.flickr.com/photos/120586634@N05/34028948085) by [ghalfacree](https://www.flickr.com/photos/120586634@N05) is licensed under [CC BY-SA 2.0 ](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich) 

Eu sempre falo de ter seu próprio [servidor em casa](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf) até para poder ter a [sua própria nuvem](https://fazenda.hashnode.dev/nuvem-de-terceiros-quando-voce-pode-ter-a-sua-propria-em-casa-com-o-clique-de-um-botao-ckccpbe5k005sqgs18e89h4ik?guid=fc79cfb5-a8ef-4e54-a34e-11c1a1df9920). Caso a situação não permita fazer isso porque não tem uma máquina velha sobrando em casa, tudo bem porque você pode fazer o seu sistema rodar 24/7, caso tenha os seguintes itens:

1. fonte USB -- contando o cabo
2. microSD -- uns 8GB pelo menos
3. Uma Raspberry Pi -- a  [Zero W](https://produto.mercadolivre.com.br/MLB-1523834959-placa-raspberry-pi-zero-w-com-wifi-e-bluetooth-_JM#position=25&type=item&tracking_id=d182735a-e499-47e6-9ec6-1f1eff33f1dd) funciona

Caso não os tenha, tudo ficaria em torno de uns 200 reais se pegar de um site como AliExpress. Caso o valor seja muito para você, lembre que muitas nuvens possuem planos de avaliação gratuita de até um ano e caso more em república as vezes pode ver de rachar o custo com seus amigos -- provavelmente vocês gastam já BEM mais por mês mesmo com breja.

## Rancher

Caso queira rodar no [Rancher](https://rancher.com/) basta quebrar os containers do `docker-compose.yml` em dois deploys do no seu painel:

- O banco de dados:

![image1275.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594366289388/4-f1P5clr.png)

- O site:

![image1287.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594366294653/HDX7JR-3E.png)

Logo depois disso o sistema é acessível de qualquer dispositivo dentro do meu wi-fi -- e, teoricamente, fora de casa por Virutal Private Network (VPN) -- através do ip e porta configurada no sevidor.

obs: no caso do Mongo você não vai conseguir rodar em todos os tipos de arquitetura uma vez que ela só suporta três atualmente

# Indo além

-  [Shiny Tutorial](https://bookdown.org/weicheng/shinyTutorial/)
-  [PWS examples - Successful Progressive Web Apps](https://appmaker.xyz/pwa-examples-successful-progressive-web-apps/) 