# SSH através do navegador

> SSH é lindo demais

foto de capa: ["Zenith Z-19 Terminal"](https://www.flickr.com/photos/15587432@N02/3281139507) by [ajmexico](https://www.flickr.com/photos/15587432@N02) is licensed [under CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Intro

Este é o texto do que junta os textos já publicados nestes blog, neste... *"Publishing Extended Universe"*.

O `SSH` em suma é: *uma maneira segura de se acessar um sessão remota em outra máquina*. Tanto que SSH significa **Secure Shell**.

Apenas [um](https://fazenda.hashnode.dev/streaming-de-retro-games-de-graca-e-em-dois-passos) dos textos não utilizou SSH até agora enquanto [outros](https://fazenda.hashnode.dev/centralize-os-favoritos-em-qualquer-browser-e-em-qualquer-device) utilizaram demais. E isto pode afastar muitos "não inciados" ao mundo do terminal e seus comandos.

Todavia, a solução apresentada aqui ainda será uma forma de terminal de acesso, só que a vantagem é que para àqueles que estão com receio por ter que usar algo na máquina deles sem repararem que não estão mais em uma conexão remota e sim no próprio terminal. Trazer de uma forma mais encapsulada e menos exigente.

A vantagem é que entendendo um pouco melhor sobre, vai conseguir entender o porquê o [GitHub esstá migrando do uso de usuários/senhas para o usso de chaves ssh](https://hackaday.com/2020/09/15/githubs-move-away-from-passwords-a-sign-of-things-to-come/).

Então, fique tranquilo porque esta abordagem rodará 100% no navegador e direto na máquina remota, sem riscos de você desconectar ou perder a conexão, sendo jogado de volta para sua máquina e rodar um comando nela que deveria ser executado na remota.

![30406238370_384dfa8aa4_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602328477758/OR5W2R9hV.jpeg)

["Halloween: Terminal Transit"](https://www.flickr.com/photos/134000856@N06/30406238370) by [SimplSam](https://www.flickr.com/photos/134000856@N06) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Projeto

O [docker-wetty-alpine](https://github.com/svenihoney/docker-wetty-alpine) é um fork do [wetty](https://github.com/butlerx/wetty) só que, como o nome indica, rodando em um container baseado em [Alpine Linux](https://alpinelinux.org/).

Todo projeto Docker precisa de uma base para começar, você pode começar uma sua própria, claro; mas o comum é se utilizar uma de um sistema operacional existente. Normalmente Ubuntu, Debian e Alpine são os mais famosos para. A vantagem de se utilizar o Alpine ao invés dos outros é que, em alguns casos, um projeto de 1 GB pode acabar sendo feito em 30 MB em Alpine -- uma redução de 34 vezes no consumo de espaço!

![5625208727_30465c3cf6_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602499982502/kO_6D4u50.jpeg)

["IBM 3279-S3G"](https://www.flickr.com/photos/21881956@N05/5625208727) by [vaxomatic](https://www.flickr.com/photos/21881956@N05) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

O `WeTTY` funciona com um servidor web e uma sessão de terminal aberta nele. Agora para explicar melhor como tal pode ser possível:

1. Uma conexão SSH depende de duas máquinas: uma um usuário e outra um servidor
2. Um "aperto de mãos" é feito entre ambas as partes para se começar a conexão
3. Durante este aperto são decidos quais implementações de segurança serão utilizadas
4. No próximo passo é perguntado qual o tipo de forma de confirmação com o servidor será feita: por uma chave previamente gerada ou por uma autenticação na hora com usuário e senha
5. Uma vez a autenticação é realizada, a conexão entre as partes é estabelecida para troca de comandos

Esta é a base do SSH, o WeTTY simplesmente implementa tudo isso com ferramentas de interface web como HTML e CSS, utilizando o JS como um servidor para rodar sua interface. E caso ache isto muito "disruptivo" ou coisa do tipo: *o terminal do VSCode funciona de maneira similar.*

## Docker

> "O que acontece no container, fica no container"

![1249873059_53bd0efbd9_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602543085850/DAHh50DXL.jpeg)

["Container"](https://www.flickr.com/photos/30713600@N00/1249873059) by [twicepix](https://www.flickr.com/photos/30713600@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Por mais que a afirmação anterior tenha as suas exceções, via de regra execução em um ambiente containerizado é mais "segura" do que uma aplicação rodando em um ambiente de usuário no sistema operacional.

Uma das vantagens é que você consegue ter até uma sessão de um serviço temporário rodando em uma espécie de "caixa preta". Um dos cenários interssantes para se usar isso seria para controlar várias máquinas sem ter que decorar o IP delas na rede e seus usuários.

A vantagem é que uma vez configurados Dockerfiles derivados do apresentado você poderá ter um só container para acesso a várias outras máquinas, seja por conexão por usuário/senha ou até mesmo por arquivos contendo as chaves de autenticação. A imagem disponível para este pode ser rodada nas seguintes arquiteturas:

- amd64
- arm/v6
- arm/v7
- arm64
- ppc64le
- s390x

O que significa que poderá fazer isto desde uma placa de desenvolvimento até um servidor na sua empresa. E caso tenham um registro privado do Docker, você poderia criar uma imagem para rodar em quase qualquer tipo de máquina e utilizar ela para acessar outros serviços de uma máquina que não seja a sua; quase que como carregasse contigo as chaves o tempo todo.

## Rancher

![21872542194_e0c22a25fa_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602544088010/MQ_qVS_xZ.jpeg)

["Container City"](https://www.flickr.com/photos/127744844@N06/21872542194) by [US Department of State](https://www.flickr.com/photos/127744844@N06) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

I. Configure a imagem [fazenda/docker-wetty-alpine
](https://hub.docker.com/r/fazenda/docker-wetty-alpine) e as portas:

![image144.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602634105127/VmgqgGZLB.png)

II. Configure os valores de ambiente:

![g1054.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602634083410/ADxloYgxR.png)

III. Abra a URL passando no seguinte formato `ip.do.rancher:portaDoWeTTY/ssh/usuarioASerAcessado` :

![g1036.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602634116814/qWn9CwM93.png)

A vantagem desta abordagem atrelada ao Rancher é que você poderá subir um terminal para cada cada cluster seu e salvar em um card do [seu Heimdall](https://fazenda.hashnode.dev/nova-aba-universal-em-qualquer-aparelho-e-navegador) e acessar cada cluster dele:

![g911.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602635815752/myQXUJM6f.png)

Isso facilita porque você poderá acessar todos e quaisquer cluster que tiver em qualquer lugar, sem precisar de um PC. Ou seja, você poderá acessar remotamente o seu servidor de um:

- Smartphone
- Tablet
- SmartTV
- etc

Basicamente qualquer coisa que rode um navegador.

## Considerações finais

Para quem já utiliza Linux e Mac há anos sabe que há ferramentas de shell que mostram visualmente se você está em uma conexão remota ou não, seja por mudar a cor do shell em si ou até mesmo matar o terminal atual. Dito isto, este texto sim foi direcionado ao público Windows que nunca utilizou um terminal ou um [PuTTY](https://www.putty.org/); ou até mesmo usuários do Mac que nunca mexeram muito com o terminal deles.

E por que penso desta forma? Realmente acho díficil alguém que utilize Linux mesmo que seja em um computador antigo, que não seja um programador ou alguma coisa do tipo que não tenha pelo menos aberto o terminal uma vez para copiar e colar um "comando mágico" que achou no Stack Overflow que resolvia aquele problema que ele estava justamente tendo.

E para quem falar que tal abordagem não é segura por X, Y ou Z, muito provavelmente irei concordar; só que olhe o contexto antes, a ideia é mostrar uma maneira fácil de acessar um node em um homelab, só isso.

![2892278536_4cc6f0e3f7_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602544314203/xixz5K2yI.jpeg)

["Coded Coffee Cup"](https://www.flickr.com/photos/74609962@N00/2892278536) by [*ejk*](https://www.flickr.com/photos/74609962@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Apêndice

- Para ir além:
  - [Secret Key Exchange (Diffie-Hellman) - Computerphile](https://youtu.be/NmM9HA2MQGI)
  - [Public Key Cryptography - Computerphile](https://youtu.be/GSIDS_lvRv4)
  - [Secure Copy Vulnerability (SCP) - Computerphile](https://youtu.be/fcesKgfSPq4)
  - [How Secure Shell Works (SSH) - Computerphile](https://youtu.be/ORcvSkgdA58)

- Caso tenha algum hardware antigo que use protocolo serial, recomendo brincar com ele para ver como funciona. Ou até mesmo um hardware novo que permita o protocolo por USB; isso poderá te ajudar a conhecer outra maneira de acesso remoto sem ser por SSH
- Caso queira ir ainda [mais além](https://www.cloudflare.com/learning/ssl/why-is-http-not-secure/) vendo a diferença de HTTP vs HTTPS

## Referência

- [How Does SSH Work](https://www.hostinger.com/tutorials/ssh-tutorial-how-does-ssh-work)
- [Understanding The SSH Encryption and Connection Process](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process)