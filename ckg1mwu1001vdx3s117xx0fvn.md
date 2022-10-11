# Seu próprio "GitHub" em casa e de graça

> Pra que usar GitHub, BitBucket, GitLab quando você pode ter o seu servidor de Git em casa enquanto prepara um chá?

foto de capa: ["YDS Library"](https://www.flickr.com/photos/60668967@N00/3376164750) by [Chris and Amy Stroup](https://www.flickr.com/photos/60668967@N00) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

## Intro

O que seria uma "solução" sem problemas?

Caso você tenha caído de gaiato aqui e não saíba o que é [**git**](https://git-scm.com/), em uma resumida absurda ele seria *"o Google Docs do seu código"*:

- Possui versionamento
- Histórico
- Várias pessoas podem editar ele
- Trabalho simultâneo em diversas tarefas
- etc

Caso isso seja interessante para ti, antes de continuar a ler o texto por favor veja os seguintes conteúdos:

- [Git Explained in 100 Seconds](https://youtu.be/hwP7WQkmECE)
- [5 Ways to DevOps-ify your App - Github Actions Tutorial](https://youtu.be/eB0nUzAI7M8)
- [Tech Talk: Linus Torvalds on git](https://youtu.be/4XpnKHJAok8)

O git nasceu de um necessidade de Linus Torvalds em conseguir gerenciar o desenvolvimento do kernel que ele criou. Todavia o projeto cresceu tanto que o próprio Torvalds passou a tocha para Junio Hamano manter ele com outros desenvolvedores uma vez que ele acredita que já provou que conseguiria ir além do estigma de ser apenas *"o cara que fez o Linux"*.

Só para não fazer um desserviço a apresentar a ferramenta como se não tivesse nada antes dela, já existiam soluções similares disponíveis no mercado: [Mercurial](https://www.mercurial-scm.org/) e [SVN](https://subversion.apache.org/). Ambas com seus paradigmas e abordagens diferentes:

- Mercurial: modelo similar ao que o git emprega, código descentralizado, você pode fazer tudo na sua máquina sem precisar de um servidor
- SVN: código centralizado, funciona como se você apenas fizesse um acesso remoto, sem possibilidade de ter acesso sem estar conectado ao seu servidor

![24106967867_592385c3b9_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602152987453/sBl6ud2v5.jpeg)

["Hieroglyphic script on Rosetta Stone"](https://www.flickr.com/photos/98786299@N00/24106967867) by [PeterThoeny](https://www.flickr.com/photos/98786299@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Soluções atuais

Não é apenas pela proximidade de nome que muita gente confunde o Git com o Github (GH), ele foi o primeiro a oferecer armazenamento de código baseado em Git quando comparado às outras soluções apresentadas aqui. Seguido pelo Bitbucket (BB) anos depois, então o GitLab (GL) e, por último, o Gitea (GT).

O GH é o maior de todos, tanto que há dois anos sofreu o [maior ataque de DDoS da história](https://www.wired.com/story/github-ddos-memcached/) e armazena alguns dos maiores projetos de programação como:

- [vue](https://github.com/vuejs/vue): ferramenta de desenvolvimento web em terceiro lugar no ranking de "likes"
- [tensorflow](https://github.com/tensorflow/tensorflow): ferramenta de desenvolvimento de projetos de Machine Learning em sexto lugar
- [You Don't Know JS Yet](https://github.com/getify/You-Dont-Know-JS): livro de programação em décimo lugar

A diferença com relação a analogia feita anteirormente de ser é que serviços baseados em git hoje em dia fazem muito mais do que o já apresentado, normalmente eles constroem os artefatos necessários e os distribuem. Isso faz com que o simples "servidor de arquivos de textos" construa também o seu código e envie ele para onde ser necessário seja isso: uma loja de app, um site ou até mesmo outros sistemas de código. Só vale ressaltar que isto isso em si não tem a ver com o git como tecnologia, mas as soluções contruidas a partir dele. Tal facilidade reduz e, em alguns casos remove, a necessidade de se ter um time de "builds" e de "infra".

![599820538_f98138ea32_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602020900926/n3a3-gghf.jpeg)

["Storage Servers"](https://www.flickr.com/photos/9246159@N06/599820538) by [grover_net](https://www.flickr.com/photos/9246159@N06) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

Agora mais sobre elas:

- Github:
  - Microsoft (MS) comprou ele em 2018
  - Mais da metade das 50 maiores empresas em verba dos EUA utilizam ele
  - Tem o [Linux](https://github.com/torvalds/linux) armazenado nele

- BitBucket:
  - Teve um começo independete assim como o GH mas foi adquirido em 2010
  - Por ser da Atlassian, tem muita integração com os produtos da empresa como JIRA e Trello sem muitas configurações como nas outras opções
  - A Atlassian é famosa por seu suporte

- GitLab
  - Teve um grande crescimento logo depois da aquisição do GH pela MS
  - Foi o primeiro a apresentar repositórios privados para contas gratuitas
  - Tinha ferramentas como Continuous Integration (CI) / Continuous Delivery (CD) antes do GH Actions
  - Famoso por pegar o feedback da comunidade e procurar sempre implementar novas features

Uma vez citados esses fatos, muitas empresas e pessoas podem evitar justamente tais produtos justamente por esses motivos. Assim como outros:

- MS ainda tem um "passado turbulento" por causa de coisas que aconteceram, principalmente nos anos 90:
  - [Windows Refund day](http://marc.merlins.org/linux/refundday/) 
  - [Monopólio](https://www.investopedia.com/ask/answers/08/microsoft-antitrust.asp)
- Atlassian é famosa por ser cara
- GL não possuiu uma comunidade muito forte no País como as outras duas opções, o que dificulta para achar conteúdo em Português ou pessoas que utilizam a solução; além disso o seu sistema já apresentou mais instabilidades do que os outros dois

## Por que o Gitea?

Antes de continuar, por mais que o GT seja o "garoto novo na parada", ele é bem robusto com facilidades de instalação seja rodando um container Docker em qualquer lugar até como o suporte para instalar ele com Helm. Além disso:

- As vezes trabalha em uma pequena empresa e não tem a grana para pagar um GH, BB ou mesmo um GL own hosted
- Roda em ARM
- Interface mínima, simples e intuitiva
- Baixa complexidade quando comparado a hostear os outros serviços

Fora que você pode ter também o interesse em entender como tal tipo de sistemas funcionam e procurar você mesmo a fazer modificações que atendam melhor a sua necessidade.

![12696017363_6a6fcbf550_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602128554285/Ybo8bmEyE.jpeg)

["tea bags"](https://www.flickr.com/photos/18090920@N07/12696017363) by [Sean MacEntee](https://www.flickr.com/photos/18090920@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Rancher

Parando de onde o [último](https://fazenda.hashnode.dev//centralize-os-favoritos-em-qualquer-browser-e-em-qualquer-device) texto continua, o Gitea será deployado em uma [Raspberry Pi 4](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/):

![48119313161_3b2a5cb9f0_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602169654942/4gc6b0FYr.jpeg)

["Raspberry Pi 4 Model B is here!"](https://www.flickr.com/photos/35434449@N08/48119313161) by [adafruit](https://www.flickr.com/photos/35434449@N08) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

E para poder explicar um pouco sobre o que o [Rancher](https://rancher.com/) é em si: *"um 'sistema operacional' pro seu servidor com uma interface simples e rápida de configurar seus serviços a serem utilizados"*

Caso você já tenha seguido alguns dos posts aqui publicados e/ou já tenha um conhecimento de Rancher, Docker e Kubernetes, a imagem disponível [no Docker Hub](https://hub.docker.com/r/gitea/gitea) não possuí o melhor exemplo de caso de uso, tome cuidado.

![45675861921_28fd3f39cc_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602021279254/oh_ta_a3v.jpeg)

["Mt Adams Barns Late Autumn Day 2135 G"](https://www.flickr.com/photos/137864562@N06/45675861921) by [jim.choate59](https://www.flickr.com/photos/137864562@N06) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Para instalar o GT há algumas opções de banco de dados assim como a  [própria documentação explica](https://docs.gitea.io/en-us/install-with-docker/). Um dos exemplos é o [MySQL](https://hub.docker.com/_/mysql) 5.7, todavia esta versão não suporta multi arquiteturas, só a partir da versão 8.0... O que como já mostrado [neste](https://fazenda.hashnode.dev/cds-parados-seu-proprio-spotify-de-graca) texto do Spotify DIY (Do It Yourself) há como se fazer funcionar ele e com uma boa performance -- o que reduziria a necessidade de subir um container novo caso já esteja rodando tal solução de streaming de música.

 1. Caso ainda não tenha o banco de dados:

  I. SSH no seu servidor:
```shell
ssh -l seuUsuario ip.do.cluster.rancher
```
  II. Rode os seguintes comandos:
```shell
mkdir ~/mysql
cd ~/mysql
pwd # salve o output deste comando
```
  III. Crie um novo deploy:
![image1023.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602208418775/AtyEa4lOc.png)
  IV. Coloque os seguintes valores de variáveis de ambiente:
![image1009.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602208542260/MI8j_Il9A.png)
  V. Configure o caminho que conseguiu no passo `II` -- no meu caso `/home/ubuntu/mysql` mas no seu pode ser que sejam outros valores:
![image995.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602208718264/Uls5LmTP7.png)
  VI. Selecione a opção de configurações avançadas no canto inferior direito e vá na aba de `Command` e coloque o seuginte comando (`--default-authentication-plugin=mysql_native_password`):
![image981.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602208869115/Iy2V6JcFP.png)

2. Agora o GT:

  I. SSH no seu servidor:
```shell
ssh -l seuUsuario ip.do.cluster.rancher
```
  II. Rode os seguintes comandos:
```shell
mkdir ~/gitea
cd ~/gitea
pwd # salve o output deste comando
```
  III. Configure a imagem -- recomendo sim travar ela porque o GT tem muitas builds na `lastest`:
![image967.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602209282573/kItMGo2lm.png)
  IV. Mapeie as suas portas -- lembrando que a `8082` e `8083` eram as disponíves na minha máquina, na sua pode ser que sejam outras:
![image967-3.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602209358164/e7agLccXg.png)
  V. Coloque os seguintes valores de variáveis de ambiente:
![image953.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602209461917/_497Q_jqm.png)
  VI. Configure o caminho que conseguiu no passo `II` -- no meu caso `/home/ubuntu/gitea` mas no seu pode ser que sejam outros valores:
![g1148.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602209521547/CxzOSKfuM.png)
  VII. Acesse o seu endereço:
![g1440.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602210072492/dWZ9OqwB3.png)
  VIII. Registre um novo servidor:
![g1449.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602210088990/IYamqzONm.png)
  IX. Comece a se divertir:
![g1458.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602210098538/RwzLcy_cf.png)

## Considerações Finais

Com o GH em uma aparente jogada de marketing ao armazenar alguns códigos em um cofre no ártico, cada vez mais está se procurando conscientizar a "população comum" -- neste caso quem não coda ou pelo menos expostos à área -- sobre o quão "importante" o código é para computação, uma vez que ficou claro que a ideia era fazer uma comparação de importância com o Svalbard Global Seed Vault.

Além de ressaltar a importancia de legados de código, quando ações como essas procuram atingir principalmente o público não técnico, mostra uma intenção de se atrair pessoas para a àrea, uma vez que a demandar por profissionais se torna cada vez mais evidente. Mostar que não se precisa ter uma formação técnica, superior ou até mesmo um bootcamp em código para se poder programar -- como o  [químico que dá suporte à uma biblioteca de shells em Python](https://testandcode.com/130).

Caso tenha vontade de participar em contribuir em qualquer projeto, este mês a Digital Ocean está [dando uma camiseta](https://hacktoberfest.digitalocean.com/) para quem auxiliar eles em projetos como alguns do citados e vários outros e caso queira auxiliar o GT você pode fazer isso de várias maneiras:

- Código
- Documentação
- Testes
- etc.

Projetos assim crescem com o aúxilio que recebem de diversas pessoas, as vezes você pode ajudar a escrever a história dele e de muitos outros.

![497411169_f87bb7eea7_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602161004839/J_h_KWbY2.jpeg)

["'Story Road'"](https://www.flickr.com/photos/8271124@N03/497411169) by [umjanedoan](https://www.flickr.com/photos/8271124@N03) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Apêndice

- Menções honrosas à serviços de armazenamento de código que talvez você não saiba que fazem isto também:
  - Dropbox
  - Google: Cloud Source Repositories
- A opção mais próxima é o Gitlab, o qual você pode também ter com passos similares ao mostrado aqui todavia não há suporte oficial para ARM
- Caso queria saber mais sobre git, tem [este](https://git-scm.com/book/en/v2) livro gratuito para downlods
- Com a aquisição recente do **npm** -- sistema de distribuição de pacotes da linguagem Node -- pela Microsoft isso mostra que a distribuição de código é importante pare eles uma vez que:
  - Fecharam um contrato de 10 bilhões de dólares com o governo americano para a plataforma de nuvem deles, a Azure.
  - Eles sabem já a importância de Free and Open Source Software (FOSS) em projetos utilizados na industria podem ser vistos [aqui](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/ownership.pdf)
- Em um nível pessoal, ter um repositório git independentemente da solução, isto serve como um "portifólio" dos seus projetos: tarefas de faculdade, correções em projetos que utiliza, textos -- como este daqui -- que escreveu, etc. Dito isso, hostear o seu próprio serviço de git mostra que foi um passo bem além dos anteriores.

## Referências

- [Installation with Docker](https://docs.gitea.io/en-us/install-with-docker/)
- [Git Fundamentals](https://syntax.fm/show/286/git-fundamentals)
- [Lambda3 Podcast 206 – Monorepo](https://www.lambda3.com.br/2020/07/lambda3-podcast-206-monorepo/)
- [Git vs Mercurial vs SVN [duplicate]](https://stackoverflow.com/a/3183093/7092954)
- [Git vs. Mercurial: How Are They Different? ](https://www.perforce.com/blog/vcs/git-vs-mercurial-how-are-they-different)
- [Microsoft acquires GitHub](https://news.microsoft.com/announcement/microsoft-acquires-github/)
- [Microsoft buys JavaScript developer platform npm; plans to integrate it with GitHub](https://www.zdnet.com/article/microsoft-buys-javascript-developer-platform-npm-plans-to-integrate-it-with-github/)
- [Git e Github – Hipsters #109](https://hipsters.tech/git-e-github-hipsters-109/)
- [Javascript, cozinha e comida na Liv Up – Hipsters On The Road #22](https://hipsters.tech/javascript-cozinha-e-comida-na-liv-up-hipsters-on-the-road-22/)
- [Explore some of the top projects archived in the 2020 Arctic Vault program](https://archiveprogram.github.com/)
- [Xbox and Windows NT 3.5 source code leaks online](https://www.theverge.com/2020/5/21/21265995/xbox-source-code-leak-original-console-windows-3-5)
- [Linus Torvalds: "Git proved I could be more than a one-hit wonder."](https://www.techrepublic.com/article/linus-torvalds-git-proved-i-could-be-more-than-a-one-hit-wonder/)
- [Github Ranking](https://github.com/EvanLi/Github-Ranking#most-stars)
- [20 Interesting Facts and Statistics About GitHub](https://www.rankred.com/facts-and-statistics-about-github/) 
