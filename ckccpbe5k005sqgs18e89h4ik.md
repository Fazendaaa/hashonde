# Nuvem de terceiros quando você pode ter a sua própria em casa com o clique de um botão?

> Não sou o Marvel Cinematic Universe (MCU) mas gosto de trabalhar em ganchos deixados de onde [a última história parou](https://fazenda.hashnode.dev/como-distribuir-codigo-para-rodar-em-diversas-arquiteturas-r-docker-buildx-ckc5i3ogj00bllps10znnbyio).

# Quem é você?

Não querendo entrar na parte filosófica da questão em si mas levantar mais questionamentos em cima dela:

- Sua mãe é a pessoa que mais te conhece?
- Seu histórico escolar da quinta série definiu toda sua vida a partir de então?
- Os seus likes do Facebook dizem realmente quem [você é](https://www.wired.com/2015/01/facebook-personality-test/)?

Considerando que as estimativas para este ano eram que [cada pessoa produzisse 1.7 MB de dados por segundo](https://www.socialmediatoday.com/news/how-much-data-is-generated-every-minute-infographic-1/525692/) -- o que daria mais ou menos 42 [jogos de NES](https://youtu.be/ZWQ0591PAxM) por segundo -- não é a toa que afirmações de que dados são o  ["petróleo do século XXI"](https://www.wired.com/insights/2014/07/data-new-oil-digital-economy/) se tornaram populares. 

![3867097_afec23a3ef_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594093620747/7IoaFYKHs.jpeg)

 ["mp_0146_027"](https://www.flickr.com/photos/43013992@N00/3867097) by [vphill](https://www.flickr.com/photos/43013992@N00)  is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich) 

# Você [realmente] possui seus dados?

> Ou são eles que te possuem?

![1191174633_0a6982b858_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594093977466/8mXungrLP.jpeg)

 ["Lion Cub"](https://www.flickr.com/photos/48355243@N00/1191174633) by [elmada](https://www.flickr.com/photos/48355243@N00) is licensed under [CC BY-NC-SA 2.0 ](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Iniciativas como a [GPDR](https://gdpr-info.eu/) -- e a sua "versão brasileira" [LGPD](http://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/L13709.htm) -- por mais """louváveis""" que sejam elas não tratam do problema principal que é: mesmo com o anonimização dos dados, 'opt-ins' e 'opt-outs' da vida, **as empresas ainda podem usá-los como base de processamento**.

Assim como o envisionado por alguns projetos a ideia de empresas pagarem por processarem seus dados ou até mesmo como o MKBHD colocou uma vez em uma [entrevista ao Joe Rogan](https://youtu.be/QSGaMUBC4Mc) que se forem para ter os dados dele que pelo menos [o Google] desse benefícios como informações para sair mais cedo de casa para ir pro trabalho por causa de trânsito.

Como já pontuado várias e várias vezes por Richard Stallman a ideia de "praticidade" pode ser basicamente um disfarce para te colocar em algemas uma vez que muitos desses softwares vão além da ideia de *vendor lock-in* e chegam ao ponto de ser crime em alguns países a distribuição de softwares que quebrem camadas de sistemas para se ver o core da aplicação que muitos hardwares rodam.

# NextCloud

![3799007336_6b7ffa4cbc_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594094556842/Cz6z-1Qfb.jpeg)

 ["Ditto"](https://www.flickr.com/photos/32224133@N07/3799007336) by [sickmouthy](https://www.flickr.com/photos/32224133@N07) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

O principal ponto deste texto não é apresentar o [NextCloud](https://nextcloud.com/) como "produto" mas sim comentar como ele pode te ajudar a ter o controle maior sobre os seus dados e ser uma das opções para você. Caso não goste da proposta deles, alguns competidores estarão linkados no "indo além" ao final deste texto.

## Rancher

Caso você tenha uma instância de [Rancher](https://rancher.com/) já rodando em sua casa ou até mesmo uma simples Single Board Computer (SBC) sobrando em algum canto você pode usar a [imagem do oficial](https://hub.docker.com/_/nextcloud/) do projeto e rodar em um comando só pelo terminal, ou até mesmo simplesmente através dos cliques de um botão, uma vez que se trata de apenas **UMA** imagem e não várias que poderiam ser orquestrada em um `docker-compose.yml`.

Aqui está como ficou no meu cluster já [configurado anteriormente](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf?guid=654d277a-f7e0-48ac-bc2f-13aa8b5ca8c4):

![image887.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594169734033/ITsHHtWxp.png)

![image875.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594169754871/ivCa2GaiO.png)

Logo após disso só apertar o botão "Launch" e acessar o serviço na porta que alocou para ele -- no meu caso a `8888`:

![g875.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594169990033/w1U3nv7lx.png)

obs: acabei criando uma pasta no servidor para armazenar os dados gerados no host, todavia recomendo ver qual das soluções de armazenamento você vai escolher para suprir melhor sua necessidade

# A decisão é sua

![4739085405_22c4325a22_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594094370229/VJEDibzzq.jpeg)

 ["Bif. & Gare de St Vaast Bosville - 088"](https://www.flickr.com/photos/44007425@N05/4739085405) by [8Uhr](https://www.flickr.com/photos/44007425@N05) is licensed under [CC BY-NC 2](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

Caso decida realmente seguir o caminho de subir sua própria instância do NextCloud antes de tudo considere os pontos apresentados nos próximos tópicos.

## Tudo em um lugar só não necessariamente é a melhor ideia

Sempre procurando seguir a regra do 3-2-1 para backups:

- 3 cópias dos dados
- 2 armazenadas em mídias diferentes
- 1 localizada fora

O mais recomendado seria, neste primeiro momento, antes mesmo de rodar o NextCloud "em produção" na sua casa seria considerar fazer apenas testes com ele, seja em casa ou até mesmo em algum cloud provider como o [Linode](https://www.linode.com/) caso não tenha um hardware para rodar localmente 24/7 ainda ou enquanto providencia equipamentos para fazer um Network Attached System (NAS) fora localização onde o seu sistema vai rodar -- para fazer os backups.

## Acessar fora de casa

Lembrando que caso queria acessar a sua nova nuvem você precisará de um ip fixo e coincidentemente há dois dias um colega de trabalho e eu fizemos isso, através do [noip](https://www.noip.com/) com a ajuda  [deste](https://github.com/coppit/docker-no-ip) Docker que também se encontra rodando no mesmo servidor Rancher da empresa.

obs: no nosso caso estamos também utilizando OpenVPN em um Netgate rodando [pfSense](pfsense.org/), o que pretendo escrever sobre quando reproduzir o mesmo em casa

## Overhead

> Sim, você terá que se adaptar...

Anos e anos utilizando os serviços da Microsoft, Google, Apple ou até mesmo -- se você é que nem o meu pai -- o BOL, pode se tornar uma grande dor de cabeça no começo, mas talvez vá valer a pena para você.

# Indo além

![5246212149_f4f6d468f2_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594094688376/bHAC6Xg5x.jpeg)

 ["Rocky Statue"](https://www.flickr.com/photos/56861532@N06/5246212149) by [toriecarr822](https://www.flickr.com/photos/56861532@N06) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

- Foto de capa da publicação:  [".sun."](https://www.flickr.com/photos/8276992@N06/3334118634) by [amish.patel](https://www.flickr.com/photos/8276992@N06) is licensed under  [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)
- [Facebook manipulated 689003 users emotions for science](https://www.forbes.com/sites/kashmirhill/2014/06/28/facebook-manipulated-689003-users-emotions-for-science/)
- [Illegal prime](https://en.wikipedia.org/wiki/Illegal_prime) 
- [DeCSS](https://en.wikipedia.org/wiki/DeCSS) 
- [NextCloud vs ownCloud](https://civihosting.com/blog/nextcloud-vs-owncloud/) 
- [seafile](https://www.seafile.com/en/home/)
- [Build a Raspberry Pi NAS with 4 Hard Drives and RAID](https://youtu.be/O-FfOWdZAQ4)
- [RAID is Not a Backup Solution](https://www.2brightsparks.com/resources/articles/RAID-is-not-a-backup-solution.html) 
- [Netshoes paga R$ 500 mil em danos morais após vazamento de dados](https://tecnoblog.net/277594/netshoes-acordo-mpdft-vazamento-dados/)
- [Instituto notifica Dataprev e aponta vazamento de dados do INSS ](https://idec.org.br/idec-na-imprensa/instituto-notifica-dataprev-e-aponta-vazamento-de-dados-do-inss) 