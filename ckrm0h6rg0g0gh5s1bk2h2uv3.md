# Gipsita.R

foto de capa: ["Plaster 2"](https://www.flickr.com/photos/10765581@N02/2774531668) by [tropicalart77 (Tammy Dial Gray)](https://www.flickr.com/photos/10765581@N02) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Intro

Seja através de um bullet journal, dailies, weekly, metódos ágeis e etc, procurar melhorar, mesmo que aos poucos, pode ser relacionado ao método *kaizen* de melhoria contínua. Ou, se quiser também, analisar como a cultura dos **5S**:

- *Seiri* (Organizar): saber o quando e o quê;
- *Seiton* (Esquematizar): tudo tem seu lugar;
- *Seiso* (Destacar): tudo tem voz própria;
- *Siketsu* (Padronizar): seguir as regras;
- *Shutsuke* (Auto-disciplina): análise crítica e ser aberto a mudanças.

Este conjunto de "princípios" são os fundamentos da cultura japonesa de *Total Productive Maintenance (TPM)* da metade do século passado e um dos grandes pilares da engenharia de software moderna.

![15314689197_4a69a80292_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627242373681/dWujiDdIH.jpeg)

["Tokyo 3314"](https://www.flickr.com/photos/57054101@N00/15314689197) by [tokyoform](https://www.flickr.com/photos/57054101@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Code smells

*Code smells* se trata de uma gíria muito utilizada para generalizar quando um código não segue nenhuma boa prática de código; e, como dito uma vez por um sábio: *"não existe melhor padrão, o melhor padrão é o padrão que todos seguem"*. Com esta afirmação/definição pode gerar várias dúvidas para os não iniciados no círculo de qualidade de software, [esta](https://www.ted.com/talks/linus_torvalds_the_mind_behind_linux?language=en) entrevista com Linus Torvalds pode ajudar a entender um pouco como ele vê e define um trecho de código apresentado.

Além de tudo isso algumas filosofias básicas para o desenvolvimento de software são:

- [Single Responsibility Principle (SRP)](https://en.wikipedia.org/wiki/Single-responsibility_principle)
- [Keep It Simple, Stupid (KISS)](https://en.wikipedia.org/wiki/KISS_principle)
- [Don't Repeat Yourself (DRY)](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
- [We Dont Need It Yet (WDNIY)](Link)
- etc.

Uma das maneiras de seguir tais princípios é o [*dividir para conquistar*](https://pt.wikipedia.org/wiki/Dividir_para_conquistar) que será apresentado aqui com o [MVC](#mvc). 

![8238698197_e11c5a1b5d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627247303053/EB6UmF0Sa.jpeg)

["Nuclear Power Plant"](https://www.flickr.com/photos/77856868@N04/8238698197) by [Lennart Tange](https://www.flickr.com/photos/77856868@N04) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## MVC

Tim Berners-Lee (TimBL) é um nome conhecido para os desenvolvedores web porquê ele, literalmente, inventou a World Wide Web em 1989; sendo o desenvolvedor do HTTP, do primeiro navegador e servidores web da história. Só que, até então, a web era o famoso *plain-text* não possuindo o comportamento de clickar em um botão e surgirem animações como hoje em dia ou até mesmo mudar o site para o dark theme. A web no início era quase como abrir um pdf no seu navegador que tivesse link para outros pdfs embutidos nele.

Em 1994 o CSS foi proposto por Håkon Wium Lie, que era parceiro de TimBL no CERN na época. O CSS se tornou então uma maneira de deixar as páginas *plain-text* que eram a web até então em uma maneira visualmente mais bonita: com cores, objetos diferentes e etc; só que isso só foi acontecer em 1996 com o lançamento do CSS1. 

Em 1995, Brendan Eich inventou o JavaScript (JS) a pedido da Netscape -- que depois se tornou a Mozilla -- para poder tornar o conteúdo web mais iterativo e, segundo a lenda diz: ele fez a primeira versão em duas semanas.

Jutando tudo que aconteceu entre '89 e '96, a web não mudou muito em filosofia de lá pra cá; foram nesses *"anos de ouro"* que foram construídos os pilares que são utilizados até hoje:

- Uma camada que retém o modelo: HTML
- Uma camada que apresenta este modelo com diferentes abstrações visuais: CSS
- Uma camada que modifica o modelo para atender melhor a necessidade proposta: JS

> E assim nasceu o  Model-View-Controller (MVC).

![1348385500_09c12c8b28_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627343445827/FAy0bCAPS.jpeg)

["Giant House of Cards"](https://www.flickr.com/photos/78128495@N00/1348385500) by [Tjflex2](https://www.flickr.com/photos/78128495@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## RSMD

O trocadilho de no título do texto é porque a gipsita é o principal componente do gesso e o [RSMD](https://github.com/Fazendaaa/RSMD) até então por mais que seja uma simples aplicação isso não significa que não utilizar boas práticas de desenvolvimento. Procurando transladar os conceitos apresentados pelo [MVC](#mvc) no RSMD pode ser reduzido à três componentes básicos:

- *Model* (Modelo): no qual funções matemáticas e estatísticas se encontraram implementadas; nenhuma função que não caía nesta categoria deve se encontrar na camada de modelo
- *View* (Visualização): responsável pelas tratativas de interface como captura e pré-procesamento dos dados assim como sua exibição; no caso do exemplo tudo que não for relacionado à Shiny e/ou RBokeh deverá se encontrar nesta camada
- *Controller* (Controlador): assim como uma função sem uso não tem propósito e uma interface sem a execução de tarefas não serve pra nada, a camada de controlador é uma camada "de negócio" na qual regras de verificação de escopo e acoplamento das análises são geradas -- no exemplo é a camada que verifica que tipo de análise realizar para a mesma metologia de acordo com o ambiente e atender as necessidades do usuário

O código também possuí outras partes que são relacionadas à banco de dados e API elaborada no  [texto anterior](https://fazenda.hashnode.dev/api-first). Mas código por si só é relativamente enxuto, precisando de um arquivo para cada camada do MVC; todavia, caso você queria modificar ele e/ou aplicar esses conhecimentos em um projeto seu, poderia o fazer ao gerar vários arquivos subdenominando-os como mostra este exemplo:

```
...
R/
   cadeiaDeMarkov.model.R
   cadeiaDeMarkov.view.R
   cadeiaDeMarkov.controller.R
   movimentoBrowniano.model.R
   movimentoBrowniano.view.R
   movimentoBrowniano.controller.R
   monteCarlo.model.R
   monteCarlo.view.R
   monteCarlo.controller.R
...
```

Além de ser mais claro para quem escreve o código segmentar o escopo dessa maneria, *"semioticamente"* auxilia também uma pessoa que nunca utilizou o projeto a entender como ele está estruturado; reduzindo a barreira de entrada dela.

No caso do controlador da aplicação desenvolvida até agora, ele permite com que seja validada a presença ou não de uma API permitindo que se utilize ou não tal modelo ou tal abordagem do modelo para aplicação da caraceterística determinada. O que pode ser visto por [neste](https://github.com/Fazendaaa/RSMD/blob/f1b517d849fac98fc6b0e488f4479d6a4e45308a/R/controller.R#L54) trecho de código:

```R
dbController <- function() {
  response <- list(breaks = 'Sem BD disponivel -- configure um para rodar')

  if ('TRUE' == Sys.getenv('HAS_DB')) {
    response <- dbFindAll()
  }
  if ('TRUE' == Sys.getenv('HAS_API')) {
    print(paste0('Does the database has primes values in it? Anwser: ',
                  hasEratosthenes(unlist(response))))
  }

  return (response)
}
```

Já o modelo [contém](https://github.com/Fazendaaa/RSMD/blob/f1b517d849fac98fc6b0e488f4479d6a4e45308a/R/model.R#L51) uma aplicação do cálculo do Crivo de Eratosthenes:

```R
hasEratosthenes <- function(set) {
  primes <- eratosthenesSieve(max(set))

  return (0 < length(intersect(set, primes)))
}
```

E a visulização como apresentar tudo [isto](https://github.com/Fazendaaa/RSMD/blob/f1b517d849fac98fc6b0e488f4479d6a4e45308a/R/view.R#L27) para o usuário:

```R
histogramView <- function(input, output, session) renderRbokeh({
  modfiedBreaks <- histogramController(input[['breaks']])

  figure() %>%
    ly_hist(eruptions,
            data = faithful,
            breaks = modfiedBreaks,
            freq = FALSE) %>%
    ly_density(eruptions,
               data = faithful)
})
```

E, como sempre, se quiser rodar o código agora e ver você mesmo isso em prática:

```shell
git clone https://github.com/Fazendaaa/RSMD/
cd RSMD
docker-compose up
```

E acessar o seu `https://rsmd.docker.localhost/` -- lembrando que caso não funcione você precisará configurar o seu [HTTPS local](https://fazenda.hashnode.dev/https-para-desenvolvimento-local).

![7865159650_12d17679a5_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627386948931/ZsFJEYdJi.jpeg)

["Project 366 #239: 260812 Stay On Target!"](https://www.flickr.com/photos/23408922@N07/7865159650) by [comedy_nose](https://www.flickr.com/photos/23408922@N07) is marked with  [CC PDM 1.0](https://creativecommons.org/publicdomain/mark/1.0/?ref=ccsearch&atype=rich)

## R first

Muito da visão apresentada aqui é baseada na própria forma de como o R gerencia e distribuí seus pacotes, como pode ser visto no famoso livro [R Packages](https://r-pkgs.org/). O baixo acoplamento faz com que mesmo que um controlador feito para tal projeto possa ser exposto amanhã ou depois como uma API como já demonstrado [anteriormente](https://fazenda.hashnode.dev/api-first), o que permitirá comunicar as regras desenvolvidas em um projeto Shiny para:

- Um sistema empresarial como qualquer outro que suporte integração por API REST
- Um outro projeto Shiny que só queira utilizar os métodos desenvolvidos pelo seu sem precisar do código, mas sim de uma função que chame o método e devolve o resultado
- Um projeto em qualquer outra linguagem
- etc.

Além disso ganhar a flexbilidade de desenvolvimento internamente para:

- Ou até mesmo trocar um tema Shiny para outro sem que a pessoa que desenvolve a lógica de como o produto funciona precise se preocupar se vai ou não quebrar com as novas cores e vice-versa
- Ter todos os projetos separaddos pelos seus controladores apenas, centralizando o seu front em um repositório e atrelando ele às camadas de negócio que são os controladores
- Fora que quando a sua camada de modelo começar a crescer isso possa ser um bom sinal para que encapsule ela em um pacote R para ter maior segurança e distribuição
- etc.

Todas essas vantagens apresentadas separam o mundo da idéias do mundo real -- *e você aí achando que computação e estatística não tinham nada a ver com Kant* --, onde você centraliza a manutenção do código mas pode abrir a sua distribuição e execução nos mais diversos cenários. *"Ouvir o código"* falar com você e entender melhor a delimitação de escopo fará com que o desenvolvimento não entre em rota de metástase, se tornando um problema para:

- *você*
- *o time*
- *o próprio ciclo de vida do projeto*

![484446352_4cd363838d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627319089495/7-NlldCqF.jpeg)

["Watercube under construction - interior - 2007-1-24 (4)"](https://www.flickr.com/photos/76815233@N00/484446352) by [xiaming](https://www.flickr.com/photos/76815233@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Em Suma

A flexbilidade que o sistema agora permite segmentar e delegar tarefas para além da combinação R + Shiny + Mongo + Docker que forma o nome RSMD. Isso faz com que a idéia de que a aplicação possa crescer aos poucos e agregar valor, reduzindo custos e procurando eficiência em cada etapa do processo.

Uma das richas na comunidade de desenvolvimento é a praticamente *rinha de galo* que é **Python vs R**; com essa abordagem o sistema pode ter tido sua primeira versão implementado da maneira atual mas fazer sua suplementação com linguagens como:

- [Julia](https://julialang.org/) 
- [Python](https://www.python.org/) 
- [Haskell](https://www.haskell.org/) 
- [Java](https://www.java.com/en/) 

Assim como o potencial delas chamarem o sistema de volta; elas serão adicionadas no futuro para agregar cada vez mais ao projeto, assim como está no planejamento comunicar ele outro front feito em [Vue.js](https://vuejs.org/) para consequente integração e deploy de PWA -- mesmo com o [shinyPWA](https://github.com/Fazendaaa/shinyPWA) já existindo.

Linguagens/frameworks possuem cada um suas falhas e muitas são históricas -- vide a famosa palestra [wat](https://www.destroyallsoftware.com/talks/wat) que trata sobre algumas --, então distribuir e tirar o melhor de cada uma é uma solução mais do que viável do que colocar todos os ovos em uma cesta só.

![28980379942_44fa307f7a_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627247747248/jdWZ6nRVE.jpeg)

["Nescafé Dolce Gusto production line"](https://www.flickr.com/photos/28056346@N06/28980379942) by [Nestlé](https://www.flickr.com/photos/28056346@N06) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Apêndice I

Uma das vantagens não mencionadas desta abordagem de baixo acoplamento é que, na prática, a solução poderia ser implementada utilizando vários provedores de nuvem diferentes para receberem cada uma das as camadas, o que te iria te permitir, por exemplo:

- Rodar o front-end na nuvem
- Rodar o controlador/modelo na sua infraestrutura
- Executar o banco de dados no cliente

Além disso, o MVC não é o único modelo de segmentação de reponsabilidades, outros modelos são:

- [MVVM](https://developer.android.com/jetpack/guide?gclid=Cj0KCQjwl_SHBhCQARIsAFIFRVV6KM1zGq-jUoRCnHt-hnMRXoPve_rkwQ7c0ssagEUnfvGID36XFbMaAvpqEALw_wcB&gclsrc=aw.ds): Model-View-ModelView
- [MVA](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93adapter): Model-View-Adapter
- [MVP](https://en.wikipedia.org/wiki/Model_View_Presenter): Model–view–presenter

Independentemente do caminho que decida seguir, [design by contract](https://en.wikipedia.org/wiki/Design_by_contract) irá te ajudar a manter uma implementação limpa e norteada -- muito baseada na [filosofia Unix](https://en.wikipedia.org/wiki/Unix_philosophy).

![4335615871_89ce7c4e7e_o.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1627229102129/FWNHuC36n.png)

["Domino Spiral"](https://www.flickr.com/photos/37474593@N04/4335615871) by [FracturedPixel](https://www.flickr.com/photos/37474593@N04) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Apêndice II

Docker é a forma de encapsulamento de serviços em tempo de desenvolvimento apresentada para tudo isso até agora, só que com o Kubernetes (K8s) você poderia muitas vezes ter só um container rodando seu front e controladores mas possuir vários containers para executar os modelos, distribuindo as tarefas. Desta maneira você poderá também dar mais RAM/CPU onde importa, no seu modelo; isso faz com que a distribuição de investimentos nos recursos seja a mais eficiente possível. 

Caso tenhas reparado nos detalhes, a interface de rede representada nas environment variables do serviço Shiny é `SIEVE_HOST=siever` e não `SIEVE_HOST=siever.docker.localdomain` isso porque os serviços neste caso só enchergam as interfaces de redes determinada pelo Docker; lembrando que o HTTPS e o DNS é provido por um outro serviço, o [Traefik](https://traefik.io/) como mostrado [neste](https://fazenda.hashnode.dev/https-para-desenvolvimento-local) tutorial, fazendo com que uma interface de rede projete uma sombra sobre a outra por isso que pode ser díficil para discernir muitas vezes qual interface de rede a aplicação:

- A interna ao container?
- A exposta pelo Docker?
- A construída pelo reverse proxy e exposta pro host?

Nesses momentos mesmo um conhecimento da camada OSI pode não ser o suficiente para depurar o problema, muito mesmo o conhecimento de redes por si só; entendendo melhor o que não é pode ser a melhor opção para se solucionar o que precisava ser configurado e a modularidade e construção da aplicação até agora permite com que cada escopo esteja bem delimitado.

![16544037057_5096d8cc1d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627346187788/r3rkMMSjl.jpeg)

["many shadows"](https://www.flickr.com/photos/53662163@N06/16544037057) by [Georgie Pauwels](https://www.flickr.com/photos/53662163@N06) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Refêrencia

- [Engineering Production-Grade Shiny Apps](https://engineering-shiny.org/)
- [Como é feito o gesso?](https://agldrywall.com.br/2020/11/06/gipsita/)
- [Model–view–controller](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)
- [Alternatives to MVC](https://blog.ircmaxell.com/2014/11/alternatives-to-mvc.html)
- [FarmNotes](https://fazendaaa.github.io/FarmNotes/)
- [Tim Berners-Lee](https://en.wikipedia.org/wiki/Tim_Berners-Lee)
- [JavaScript History](https://www.w3schools.com/js/js_history.asp)
- [CSS](https://en.wikipedia.org/wiki/CSS) 