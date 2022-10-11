# Tire o pó dos filmes parados, eles serão sua nova Netflix... E 33 vezes mais barato!

> Docker é a nova seda, o Docker Hub é a nova rota e o Rancher a nova loja

foto de capa: ["Netflix CARNAGE"](https://www.flickr.com/photos/76877398@N00/151384059) by [Ross Catrow](https://www.flickr.com/photos/76877398@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Intro

*No começo só havia Netflix...*

Assim como Band Aid, Ping Pong e Merthiolate são produtos que se tornaram sinônimos para respectivamente: curativos, tênis de mesa e antisséptico; a Netflix se tornou o sinônimo para streaming de vídeo. E isto propulsionou cada vez mais a plataforma a crescer se estabelecer. As vantagens do streaming como forma de distribuição de conteúdo são claras:

- **Consumir o conteúdo quando quiser**
- **Consumir onde estiver**
- **Consumir quantas vezes quiser**

O que representa o famoso *consumo sob demanda*. Fora que algumas facilidades do alguns players procuram se diferenciar:

- Poder continuar de onde parou em um aparelho em outro
- Plataforma de recomendações dos catálogos
- Pode baixar no seu aparelho para poder ver quando não estiver conectado
- etc.

O conjunto dessas facilidades tem feito não só o Netflix em si crescer mas muitos players de streaming como Spotify, Audiable, Kindle Unlimited e etc. Cada um oferecendo o conteúdo de um catálogo enorme, mídias diferentes, qualidade de serviço, suporte de aparelhos dos mais diferenciados e etc... Todavia, *tudo que é sólido pode derreter*:

- Friends e The Office saíram da Netflix para ir pra HBO, assim como os filmes da Disney foram pro Disney+
- Disponibilidade de conteúdos diferentes sob a mesma empresa de país pra país
- Redução da qualidade dos vídeos na época de quarentena para reduzir o consumo de banda
- Falta da possibilidade de reprodução de conteúdo em aparelhos não homologados
- etc.

Com a entrada de competidores, contratos de distribuição vencendo e alta dos preços dos serviços oferecidos muitas pessoas se veem "orfãs" dos conteúdos que gostavam de consumir por terem ido parar em outras plataformas ou até mesmo não serem simplesmente renovados. Há uma máxima na indústria de cinema que diz que *"conteúdo reina"*.

![371662689_55da41e5cb_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602727541476/KSpry8sjm.jpeg)

["Upmarket Home Theater"](https://www.flickr.com/photos/91342102@N00/371662689) by [muffytyrone](https://www.flickr.com/photos/91342102@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Projeto

Caso você seja um *Data Hoarder*: uma pessoa que gosta de ter os conteúdos que gosta de consumir de uma maneira mais "física" por motivos similares ao anteriores aos citados anteiroremente. Provavelemnte vai gostar do [Streama](https://streama.demo-version.net/#!/dash) -- só digitar `admin` para a senha e usuário para ver a demo.

![image1343.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602797484152/6j2Im7Ofl.png)

Um projeto que tem a ideia de centralizar as mídias que já posuí para poder consumir elas de qualquer lugar que quiser. Muito parecido com o Netflix, o projeto realmente apresenta muitas características da plataforma, o que auxilia os usuários já acostumados com ela. E a vantagem que por ser um projeto FOSS (Free and Open Source Software), você vai conseguir rodar ele na sua casa.

Você pode ver [aqui](https://github.com/streamaserver/streama) o código do projeto, ele está disponível para você entender como funcionam:

- Reprodução de em um navegador
- Sincronização das informações de filmes e séries
- Upload de arquivos
- etc.

O Streama tem o potencial de crescimento muito a do VLC, outro projeto famoso para reprodução de vídeos que também tem uma origem de código aberto. O que te possibilita você mesmo fazer modificações no projeto ou até mesmo fazer uma doação para que eles trabalhem em um função que você queira para ele caso não saiba codificar.

![401577307_98088ac55f_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602729873745/i62QWmBx-.jpeg)

["VLC"](https://www.flickr.com/photos/56286862@N00/401577307) by [pittaya](https://www.flickr.com/photos/56286862@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich) 

## Docker

Assim como a máquina de tear ajudou a padronizar a padrão de tecidos, o Docker ajuda a padronizar o desenvolvimento de projetos. Nesta analogia:

- Código é a seda
- Docker é a máquina
- Container é o tecido finalizado

![2439273346_b9d1cf0d7c_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602730605998/o7rlGTUAb.jpeg)

["Silk Machine"](https://www.flickr.com/photos/7365676@N03/2439273346) by [Gone-Walkabout](https://www.flickr.com/photos/7365676@N03) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

Docker remove o gap entre desenvolvedor e usuário final, pois dessa maneria você pode distribuir um código feito em sua máquina para se utilizado nos mais diferenciados cenários; assim como um tecido pode ser utilizado depois para:

- Uma roupa
- Um conjunto de cama
- Um revestimento de automóvel
- Um acessório
- etc.

A imagem do Docker disponibilizada para este projeto te permite rodar ele em qualquer computador que você tenha parado ou até mesmo uma Single Board Computer (SBC), desde que ambos respeitem as limitações de serem X86_64 ou ARM64.

## Rancher

Assim como o Docker remove o gap para os densevolvedores entregarem uma aplicação, o Rancher na analogia seria uma **loja**:

- Por servir como o uma frente para os tecidos [containers]
- Fazer o contato com o distribuidor [Docker Hub]
- Gerenciar e permitir fazer alterações necessárias -- assim como você pode pedir mais ou menos metros de um tecido

E graças a ele vários posts já foram feitos aqui como você pode ter rodando vários serviços como:

- [Seu próprio Drive](https://fazenda.hashnode.dev/nuvem-de-terceiros-quando-voce-pode-ter-a-sua-propria-em-casa-com-o-clique-de-um-botao)
- [Seu  próprio streaming de música](https://fazenda.hashnode.dev/cds-parados-seu-proprio-spotify-de-graca)
- [Seu  próprio streaming de games](https://fazenda.hashnode.dev/streaming-de-retro-games-de-graca-e-em-dois-passos)

![488201765_82ac14f35e_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602731060007/VOm4IeP5n.jpeg)

["Silk Store"](https://www.flickr.com/photos/10349660@N00/488201765) by [erwinkarim](https://www.flickr.com/photos/10349660@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Agora os passos para ter o sitema funcionado, é necessário fazer o deploy do banco de dados antes. O MySQL será utilizado, caso você já o tenha dos outros tutoriais, basta ir pro estágio `II` direto.

I. Fazer o deploy do banco de dados:
  1. [Acesse sua placa](https://fazenda.hashnode.dev/ssh-atraves-do-navegador)
  2. Digite os seguintes comandos:
```shell
mkdir ~/mysql
cd ~/mysql
pwd # copie o resultado deste comando
```
  3. O exemplo do projeto do Streama utiliza o `MySQL:5.7` foi mudado para a versão [mysql/mysql-server:8.0](https://hub.docker.com/r/mysql/mysql-server) para ter suporte em ARM, uma vez que é a versão mínima suportada para a arquitetura: 
![image1259.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602799029325/4ypWNdCOf.png)
  4. Coloque as seguintes variáveis de ambiente:
![image1245.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602799051782/PLN4ARcfb.png)
  5. Monte o caminho do passo 2 -- lembrando que no meu caso é `/home/nanopineo3/mysql` mas no seu pode ser que seja outro: 
![image1287.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602799075325/Os7wO3jGn.png)
  6. Clique no canto inferior direito para abrir a opção de Command -- cole o seguinte valor `--default-authentication-plugin=mysql_native_password`:
![image1273.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602799086262/qLnOX7HsI.png)
  7. Deplyoie a imagem

II. Fazer o deploy do [streama](https://hub.docker.com/r/fazenda/streama):
  1. [Acesse sua placa](https://fazenda.hashnode.dev/ssh-atraves-do-navegador)
  2. Digite os seguintes comandos:
```shell
mkdir ~/streama
cd ~/streama
pwd # copie o resultado deste comando
```
  3. Coloque os valores para a imagem e suas portas -- lembrando que a `8081` era a disponível no meu servidor, no seu pode ser que seja outra:
![image1826.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602799473766/0tb5TUIAm.png)
  4. Coloque as variáveis de ambiente -- lembre-se que os valores serão diferentes caso tenha pulado o estágio `I`:
![image1921.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602799529697/tcQEiNXSc.png)
  5. Monte o caminho do passo `2` -- lembrando que no meu caso é `/home/nanopineo3/streama` mas no seu pode ser que seja outro:
![image1231.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602799537203/YZgNRViBV.png)
  6. Deployie a imagem.
  7. Agora só abrir o endereço, pode ser que demore alguns minutos para o servidor ser configurado. Uma vez que a tela aparecer, digite `admin` para usuário e senha:
![g2146.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602800211558/C2lP6g4sd.png)
  8. Configure a tela com o seguinte valores em cada campo:
![g2226.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602800238262/NwS92FC7Q.png)
  9. Vá em filmes e crie um novo filme com qualquer valor e suba o mp4 disponível [neste](http://techslides.com/sample-webm-ogg-and-mp4-video-files-for-html5) link para download
![g2216.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602800251039/TTuXasKvZ.png)
  10. Agora só assitir ele de qualquer navegador e em qualquer device
![g2206.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602800266579/Zg3oXrrg5.png)

Sim, tudo isto está rodando na plaquinha desta foto:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602774135930/oLGj0Ezqi.png)

A afirmação *"33 vezes mais barato" é* porque [esta placa](https://pt.aliexpress.com/item/10000299302152.html?spm=a2g0o.productlist.0.0.b8c3493enRyeyK&algo_pvid=561fed2f-81bf-45f6-8cd3-4fdc3ad5902b&algo_expid=561fed2f-81bf-45f6-8cd3-4fdc3ad5902b-1&btsid=0bb0623f16027760743687946ebc96&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_) da foto custa em torno de 120 reais em promoções. Já o Netflix chegou ao País em 2011, se você for assinante desde aquela época e com o valor médio de 37.50 por mês, isto seria o equivalente a **4 050 reais em Netflix**. Em outras palavras:

- 352 DVDs do filme [Inferno](https://www.amazon.com.br/Inferno-Felicity-Jones-Foster-Hanks/dp/B07QWWW6NT/ref=asc_df_B07QWWW6NT/?tag=googleshopp00-20&linkCode=df0&hvadid=395506397466&hvpos=&hvnetw=g&hvrand=6674051483168277190&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001769&hvtargid=pla-922382051164&psc=1) 
- 16 boxes com as oito temporadas completas de [House](https://www.amazon.com.br/House-1%C2%AA-Temporada-S%C3%A9rie-Completa/dp/B07R4S3WJP/ref=sr_1_3?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=box+serie&qid=1602776969&sr=8-3) 
- 40 boxes dos 7 filmes de [Harry Potter](https://www.amazon.com.br/Col-Harry-Potter-2016-Retratos/dp/B07T17KSL1/ref=sr_1_1?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=box+harry+potter+dvd&qid=1602777160&sr=8-1) 

Lembrando que a Netflix é **APENAS** filmes e séries, quando comparada com as concorrentes como Amazon e Apple que oferecem streaming de música também, este 4 050 reais seriam o equivalente a:

- 270 CDs da [Rita Lee](https://www.amazon.com.br/SISTEMA-GLOBO-DE-GRAVACOES-RITA/dp/B00006FSU6/ref=sr_1_1?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=box+cds&qid=1602777398&sr=8-1) 
- 33 box com 6 CDs do [Gilberto Gil](https://www.amazon.com.br/GILBERTO-GIL-ANOS-VIVO-BOX/dp/B07713KJWH/ref=sr_1_3?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=box+cds&qid=1602777398&sr=8-3) nos Anos 70
- 115 CDs do [Abbey Road](https://www.amazon.com.br/Abbey-Road-Beatles/dp/B0025KVLUQ/ref=sr_1_29?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=box+cds&qid=1602777398&sr=8-29) dos Beatles

A discrepância aumenta quando considera-se que a mesma placa pode rodar outros serviços para ti como:

- [Bloequeador de propagandas](https://fazenda.hashnode.dev/nao-e-so-o-ad-blocker-que-vai-te-salvar)
- [Servidor de Minecraft](https://fazenda.hashnode.dev/minecraft-docker-kubernetes-servidor-de-jogos-na-sua-casa)
- [Controlador de impressora 3D](https://fazenda.hashnode.dev/fazenda-de-impressoras-3d-inteligentes-26-vezes-mais-barata)

O que fará com que suas economias aumente ainda mais.

![6355251231_acce54bb4a_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602797286605/2BrhZjtFy.jpeg)

["Saving Cash"](https://www.flickr.com/photos/68751915@N05/6355251231) by [401(K) 2013](https://www.flickr.com/photos/68751915@N05) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Considerações finais

- *"Vou cancelar meu Netflix depois de ter lido isso"*
- *"Vou usar só coisas DIY daqui pra frente"*
- *"Vou colocar isso pra todo mundo"*

A ideia do texto não é nenhuma dessas frases anteriores, caso goste do Netflix, Amazon Prime, Apple, Hulu, YouTube e etc., por favor continue usando eles; incentive a produção de conteúdo próprio dos mesmos.

Agora, se você:

- Ficou cansado da guerra de streaming e ficar no fogo cruzado quando quer ver apenas uma série que você já tem
- Se o seu celular, tablet, PC e etc não funciona mais com o app da plataforma por motivos diversos
- Ou simplemente quer ver aquele filme ou série que já tem em algum lugar largado pela casa mas não tem mais como ver porque só tem a Smart TV agora e mais nenhuma outra forma de ver eles

Neste cenário sim vale a pena montar a solução apresentada aqui. Ainda mais porquê o aparelho apresentado não faz nenhum barulho, pode ser montado com uma fita dupla face em qualquer lugar quase para esconder ele e, além disso, **só precisa de um carregador de celular para funcionar**.

![15339256394_4202005953_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602777979319/sb7r0Uz_e.jpeg)

["Rialto Theater"](https://www.flickr.com/photos/65315936@N00/15339256394) by [Chris Smith/Out of Chicago](https://www.flickr.com/photos/65315936@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Apêndice

- [Este](https://youtu.be/QXK1aAbUJ38) vídeo ajudou a entender que é melhor subir em `*.mp4` além de como configurar a tela inical
- A conta feita para o valor médio baseada no valor inicial do Netflix no Brasil e o valor do plano mais completo deles atualmente
- Mesmo não sendo utilizados para a produção deste post, é recomendado ouvir os seguintes episódios dos Tecnocast:
  - [Tecnocast 131 – Guerra dos streamings](https://tecnoblog.net/317507/tecnocast-131-guerra-dos-streamings/)
  - [Tecnocast 103 – Quem precisa de uma TV?](https://tecnoblog.net/270394/tecnocast-103-quem-precisa-de-uma-tv/)
- Outros episódios de podcast para entender como a Netflix em si funciona: [Tecnologias na Netflix – Hipsters #41](https://hipsters.tech/tecnologias-na-netflix-hipsters-41/) 
- Os preços de CDs, DVDs e etc foram feitos baseados no preço deles no dia da escrita deste post
- Lembrando que armazenamento é um fator limitante, o seu catálogo de filmes vai crescer o máximo de espaço que você tiver
- Caso queria saber mais sobre a [história do VLC](https://youtu.be/03fR2o15QYQ) 
- A imagem mais recente do Java não estava estável para builds, o que é uma pena pois permitiria com que a imagem suportasse mais arquiteturas

## Referências

- [When Is DVD Ripping Illegal?](https://www.toptenreviews.com/when-is-dvd-ripping-illegal)
- [What is data hoarding?](https://www.reddit.com/r/DataHoarder/comments/9lfnn0/what_is_data_hoarding/)
- [Netflix chega ao Brasil por R$ 15 ao mês](http://g1.globo.com/tecnologia/noticia/2011/09/netflix-chega-ao-brasil-por-r-15-por-mes.html)
- [Quanto custa a assinatura da Netflix no Brasil?](https://olhardigital.com.br/tira-duvidas/noticia/quanto-custa-a-assinatura-da-netflix-no-brasil/97149)
- [Netflix and YouTube Are Reducing Streaming Quality to Meet Quarantine High Demands](https://www.the961.com/netflix-youtube-reduce-streaming-quality-to-meet-quarantine-high-demands/) 
- [Friends Won't Be There for You on Netflix Starting in 2020](https://time.com/5622979/friends-leaving-netflix-for-hbo-max/)
- [Por que o catálogo da Netflix é diferente de um país para outro](https://tecnoblog.net/259232/por-que-o-catalogo-da-netflix-e-diferente-de-um-pais-para-outro/)