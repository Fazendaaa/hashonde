# Como distribuir código para rodar em diversas arquiteturas? R: Docker buildx

# Intro

Caso você não conheça Docker... Como veio parar aqui?

Mas, mesmo assim, caso não conheça, recomendo ler/ver/ouvir os seguintes conteúdos e antes de continuar a leitura, dê a cara a tapa e faça um  minimum viable product (MVP) de alguma coisa em  [Docker](https://www.docker.com/) -- ainda irei publicar alguns exemplos maneiros de deploy de webapps rodando  [Shiny](https://shiny.rstudio.com/)  e análise de dados com  [R](https://www.r-project.org/)  -- que você se sentir mais confortável com:

- [What is Docker in 5 minutes](https://youtu.be/_dfLOzuIg2o)
- [Docker 101](https://www.docker.com/101-tutorial)
- [Lambda3 - Docker](https://www.lambda3.com.br/2016/05/podcast-1-docker/)

Agora, caso já conheça Docker e tenha feito algo com ele, podemos falar de  [buildx](https://docs.docker.com/buildx/working-with-buildx/); mas antes, gostaria de colocar alguns cenários:

1. "Você tem um computador antigo, um Intel 32bits e gostaria de usar ele como um servidor na sua casa para poder rodar algumas das suas aplicações. O contra ponto é que gostaria de desenvolver de qualquer lugar a qualquer hora."
2. "Você tem uma Raspberry Pi e gostaria de colocar ela para bom uso."
3. "Sabendo que serviços na nuvem começaram a apresentar [serviços com processadores ARM](https://aws.amazon.com/ec2/graviton/), que possuem **custos mais baixos**, você decide querer reduzir os custos da sua empresa."

Considerando que os dois últimos cenários tem a ver com a arquitetura ARM -- que eu pretendo escrever cada vez mais aqui sobre --, elas podem parecer *"a mesma coisa"* em uma análise rápida na verdade elas apresentam considerações diferentes. Mas um até mesmo um cenário extra talvez te ajude a entender melhor o potencial:

4. "Está cansado de a cada 10-15 a Apple mudar de arquitetura e com receio de novo futuro eles decidirem mudar para um [RISC-V](https://riscv.org/) ou coisa do tipo?"

Okay, este último é mais um chute do que algo certo ou que tenha algum embasamento atual... Mas seria fácil injetar um [QEMU](https://www.qemu.org/) com tal arquitetura e, da noite para o dia, ter toda a sua aplicação atual estar rodando para outra arquitetura -- com pequenas para quase nenhuma alteração dependendo do cenário.

# O buildx

O buildx em termos simples: *"é que uma camada de abstração do hardware para que o Docker consiga construir uma imagem de uma arquitetura em outra."*

![41912416812_95f0353052_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1593732978367/PzBK-Tho3.jpeg)

Você pode ver, em ciclo de vida de um produto, o buildx como  a previdência privada: *você faz hoje mas pensando no futuro.*

## Como configurar ele na sua máquina

Caso queria um script "pronto" para rodar apenas e começar a desenvolver para multiplas arquiteturas, recomendo [este](https://gist.github.com/Fazendaaa/e10f74642b30e893a8724eb791e9933f) daqui que acabei montando durante alguns meses.

Caso tenha algum receio de que seu tempo de build vai começar a demorar demais ou consumir energia demais, só lembrar que mesmo com o suporte para compilar para várias arquiteturas você escolhe quais vai querer, fora que sempre vou recomendar procurar dar um `docker build --help` para ver pode utilizar mais cores da sua máquina, caso tenhas essa possibilidade. Lembre-se: *"o Docker é seu amigo"*.

## Como rodar agora?

![27870956405_1dca244cda_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1593736045555/WxyDPJK-w.jpeg)

```shell
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 --push --tag <seuUsuarioNoRepositorio>/<seuProjeto> .
```

Este é um exemplo simples de um comando que eu rodo para algumas de aplicações de uso pessoal e empresarial que mantenho. Todavia é importante comentar outra vantagem do buildx que é a aglutinação de comando, uma vez que os antigos `docker tag` e `docker push` agora podem ser passados como flags e fazendo um comando três etapas do desenvolvimento serem chamadas com apenas um comando.

Algumas outras plataformas atualmente suportadas são:

- linux/arm/v6
- linux/386
- linux/ppc64le
- linux/s390x

## Como saber se a minha aplicação vai funcionar em algo diferente do meu x86?

![49816253648_cc4027a918_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1593733630026/Xp9MPPvpY.jpeg)

*A grande dúvida, mas também tem a pior resposta de todas... "Depende".*

Atualmente não tenho problemas em compilar para ARM mas isso porque normalmente utilizo imagens que possuem um bom suporte para linguagens como [Node](https://hub.docker.com/_/node/) e [Python](https://hub.docker.com/_/python); todavia, caro queira ir mais além, além de uma stack e subir soluções mais complexas, recomendo dar uma olhada no  [Alpine](https://hub.docker.com/_/alpinehttps://hub.docker.com/_/alpine) para construir suas imagens.

## Exemplo de aplicações

Atualmente eu mesmo já desenvolvo e rodo três aplicações minhas -- bots para Telegram -- desta maneira. Resolvi parar de pagar os US$: 5 por aplicação -- o que daria aproximadamente 80 reais -- por mês para rodar na minha Single Board Computer (SBC) -- as famosas "plaquinhas" -- que está rodando os três serviços e muito mais, tudo isso conectado a um carregador de celular. Caso queira ver mais sobre elas:

- [Bot de spoiler](https://fazendaaa.github.io/I-m-a-Spoiler-Bot/)
- [Bot de informação de animes](https://fazendaaa.github.io/AnilistBot/)
- [Bot de informação de podcasts](https://github.com/Fazendaaa/podsearch_bot)

Agora, o que você pode contruibir e rodar além disso graças a ferramentas como buildx?

- **[Sua própia nuvem](https://owncloud.org/)**
- **[Seu próprio servidor de casa conectada](https://www.home-assistant.io/)**
- **[Seu próprio gerenciador de clusters](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf)**

## Vantagens

Ter a sua própria nuvem e a garantia de que seus dados são seus mesmo, vai muito além de qualquer [LGPD](http://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/L13709.htm) ou coisa do tipo. Poder também  [bloquear propagandas e rastreamento](https://pi-hole.net/) também é algo que vai além do que muita lei pode fazer ou já fez para você.

![327609942_a804d55008_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1593735326154/lyGOdCUhT.jpeg)

# Pontos importantes

Caso goste de desafios e quebrar a cabeça em muitos pontos, procure compilar todas as suas aplicações daqui para frente dando suporte para todas as arquiteturas, mesmo que não use. O seu trabalho pode ajudar outros com um script apenas. E a tecnologia quanto mais ela se tornar acessível, maior o potencial dela fazer a diferença na vida de outras pessoas que até então não tinham o acesso fácil a ela.

# Referências

-  ["Docker-4"](https://www.flickr.com/photos/134416355@N07/31518969030) by [maijou2501](https://www.flickr.com/photos/134416355@N07) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)
- ["Rolled up Blueprints Home Construction"](
) by [ShebleyCL](https://www.flickr.com/photos/25636851@N03) is licensed under  [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)
-  ["Falling Wheel"](https://www.flickr.com/photos/37996646802@N01/27870956405) by [cogdogblog](https://www.flickr.com/photos/37996646802@N01) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich) 
- ["CPU Processor"](https://www.flickr.com/photos/17423713@N03/49816253648) by [danielfoster437](https://www.flickr.com/photos/17423713@N03) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)
-  ["Chain; May Be Removed"](https://www.flickr.com/photos/67533181@N00/327609942) by  [Hamedog](https://www.flickr.com/photos/67533181@N00) is licensed under [CC BY-ND 2.0 ](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)