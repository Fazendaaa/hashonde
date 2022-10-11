# Chega de Jira


> O Jira está morto, longa vida ao Open Project

foto de capa: ["Counting the days"](https://www.flickr.com/photos/19994833@N00/38845933964) by [Bernie Goldbach](https://www.flickr.com/photos/19994833@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Caso não conheça o [Jira](https://www.atlassian.com/software/jira), se trata de um sistema de gerenciamento de projetos da [Atlassian](https://www.atlassian.com/). Todavia, um dos grandes problemas da plataforma é seu preço, considerando que com mais de 10 usuários o custo vai para 10 USD por usuário. Ou seja, **no mínimo 544 reais por mês** para uma única ferramenta só pode significar uma empresa pequena, um projeto de faculdade, ou até mesmo uma organização sem fins lucrativos, um gasto alto de manter.

A ideia do texto é mostrar como você pode subir em casa ou em um servidor um serviço gratuito, robusta e utilizada por empreas e instituições como:

- Siemens
- AUDI
- Universidade das Nações Unidas
- etc

Mesmo se o Jira por si só não for um gasto que vá fazer muito a diferença no final do mês, ele mais outros serviços como banco de dados -- que já foi [mostrado anteriormente ](https://fazenda.hashnode.dev/banco-de-dados-em-casa-e-500-vezes-mais-barato-do-que-na-nuvem-ckddqoth0017nxvs17a449b1d) como reduzir eles -- podem fazer com que os gastos de serviços assim acabem se tornando um fator limitante de o quanto pode investir no projeto, seja com desenvolvimento do pessoal que trabalha mesmo ou até mesmo com outros gastos relacionados ao projeto. E, como você vai ver, a própria paltaforma do [Open Project (OP)](https://www.openproject.org) vai te ajudar a mapear os gastos.

O OP representa mais que uma redução dos gastos, mas sim um investimento a longo prazo. 

![3175809505_378ab53d7f_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596991964260/RCBbPEeKw.jpeg)

["Random pics 003"](https://www.flickr.com/photos/69201526@N00/3175809505) by [How I See Life](https://www.flickr.com/photos/69201526@N00) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

Alguns motivos para considerar tal opção de serviço se ir para serviços/produtos de código aberto, uma vez que muitas empresas de código fechado:

- Reduzem o suporte para sistemas legados a fim de querer vender uma plataforma nova
- Usam ferramental que não seguem padrões de segurança
- O modelo de negócio é atrelado a venda de equipamentos, ou seja, injetam atualizações de uma maneira a travar equipamentos funcionais para que pessoas comprem novos
- etc

Para dar alguns exemplos concretos disso:

- O governo da Coreia do Sul irá sair do Windows para o Linux nos terminais de acesso. Assim como Munique e Hamburgo.
- Os governos do Canadá e de Taiwan probindo o uso do Zoom por suas falhas de segurança
- A empresa Sonos anunciando que equipamentos antigos deixaram de receber atualizações e, em alguns casos, como o equipamento não possue outra maneira de se comunicar sem ser através do sistema deles, as caixas de som se tornarão "enfeites"
- etc

## Intro

![481732361_9291f5b7cf_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597007012185/cGS4nkuCW.jpeg)

["Ruben's Baby Factory"](https://www.flickr.com/photos/74715206@N00/481732361) by [Lisa Meader](https://www.flickr.com/photos/74715206@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Antes de continuar, umas ressalvas que merecem ser pontuadas:

- Caso já esteja usando o Jira, a migração do time para uma nova plataforma pode ser um processo trabalhoso
- Não existe solução mágica, caso queira subir o OP seja local ou na nuvem, poderá economizar com o Jira caso vá para a opção do suporte da comunidade -- todavia tem como ter o suporte empresarial também
- As vezes o Jira pode ter funções e integrações que para o seu fluxo o OP não seja a melhor opção -- procure fazer uma lista de equivalência antes de migrar a plataforma ou não
- etc

Juntando esses pontos com o que já foi comentado anteriormente no texto, caso tenha alguma dúvida ainda do quão importante é manter suporte para aplicações e sistemas antigos mesmo quando nenhum "valor" aparente faz sentido; basta olhar a comunidade de jogos.

Há uma máxima em computação que diz que dois dos fatores que movimentam a tecnlogia, principalmente no mercado consumidor, são: pornografia e jogos. No tocante ao segundo grupo, a indústria de emuladores, por mais informal e não estabelecida movimenta milhões de dólares por ano direta ou indiretamente, seja no desenvolvimento de emuladores ou comprando placas para emular eles em cima; uma vez que há sites que vendem peças equivalentes de placas de computadores de mais de 25 anos atrás quando a emulação ainda não é possível ou até mesmo há pessoas que preferem rodar seus jogos em um hardware antigo.

Como o OP possui o código aberto, você pode modificar ele para as suas necessidades, criando novas regras e/ou tarefas para ele desempenhar. Além de tudo isso isso, outras vantagens dele são:

- Documentação ampla com:
  - Teinamentos
  - Webinars
- Suporta:
  - Metologias ágeis
  - Gráfico de Gantt
  - Kanban
- Controle e rastreio de:
  - Bugs
  - Portifólio
  - Gastos
  - Ideias
  - Metas
- Por ser baseado na web, não há o problema de apps não rodarem em versões antigas de sistemas operacionais, sejam eles de celular ou computadores
- API disponível para integração à outros sistemas
- etc

Além disso, um fator bem subjetivo, é que ele apresenta uma interface mais intuitiva do que a do Jira. Mas outro objetivo é que a versão na nuvem da ferramenta, caso decida pagar para usar ela, o custo por pessoa é de 1 euro -- apóximadamente 6.40 reais --, diferentemente dos 10 dólares do Jira -- aproximadamente 54,40 reais.

## Rancher

![NVIDIA_Jetson_Nano_Developer_Kit_(40790261993).jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597524509403/ucECTUfpD.jpeg)

 ["File:NVIDIA Jetson Nano Developer Kit (40790261993).jpg"](https://commons.wikimedia.org/w/index.php?curid=81141093) by  [Thomas Amberg](https://www.flickr.com/people/23124942@N03) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0?ref=ccsearch&atype=rich)

Caso ainda não tenha o [Rancher](https://rancher.com/) rodando, siga  [este](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf) tutorial. Todavia desta vez o tutorial utilizará uma [Nvidia Jetson Nano]() -- não porque se precisa de uma placa "tão potetente" como ela, mas como a utilizarei para subir um servidor de Minecraft e fazer análise de dados, resolvi colocar ela também para trabalhar com o OP.

Uma observação é que este é o primeiro projeto no qual foi necessário fazer um porte para multiplas arquiteturas para poder escrever este texto uma vez que rodo o servidor em ARM e não x86. Caso queira usar a imagem oficial, basta utilizar o [`openproject/community`](https://hub.docker.com/r/openproject/community) no lugar de [`fazenda/openproject`](https://hub.docker.com/r/fazenda/openproject). Todavia esta segunda imagem permite o sistema rodar além do x86, ARM e também fora atualizados os seguintes componentes:

- Postegress
- Utilizar o NVM para instalar o Node e NPM
- Mudança de Stretch para Buster
- Começar a migrar alguns pacotes binários para x86 para uma abordagem mais "arquitetura agnóstica"
- etc

Diferentemente de outros tutorias, neste serão necessários subir-se três containers para o serviço funcionar em ARM. Basta seguir os seguintes passos:

I. Subir o banco de dados:
  1.  SSH no seu servidor Rancher:
```shell
ssh -l seuUsuarioNoServidor ip.do.servidor.rancher
```
  2. Crie os seguintes diretórios:
```shell
mkdir -p ~/openproject/postegresql/data
cd ~/openproject/postegresql/data
pwd # copie o output deste comando
```
  3. Crie uma imagem do [`postgres:11`](https://hub.docker.com/_/postgres):
![image903.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597524826339/1fVub4v2m.png)
  4. Coloque os seguintes valores como variáveis de ambiente:
![image903-1.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597524834190/YDEnU1Xd2.png)
  5. Monte o caminho do passo `2` e deployie o sistema -- lembrando que `/home/nvidia/` é o do meu servidor, o seu pode ser bem diferente:
![image1073.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597525297270/NtmzDqCUO.png)

II. Subir o cache
  1. Crie uma image do [`memcached`](https://hub.docker.com/_/memcached) e deployie ela:
![image915.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597524805329/gXt_o9lpb.png)

III. Subir o sistema em si:
  1. SSH no seu servidor Rancher:
```shell
ssh -l seuUsuarioNoServidor ip.do.servidor.rancher
```
  2. Crie os seguintes diretórios:
```shell
mkdir -p ~/openproject/{pgdata,assets}
cd ~/openproject/
pwd # copie o output deste comando
```
  3. Crie uma senha para ser utilizada no sistema:
```shell
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo '' # copie o resultado deste comando também
```
  4. Agora só abrir o seu painel do Rancher e prencher ele com as informações necessárias. Primeira sendo a imagem e as portas -- a `8888` era uma livre no meu servidor, mas no seu pode ser outra:
![image1109.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597525318640/2AmMOlag6.png)
  5. Em seguida coloque a variáveis de ambiente -- mais o valor da gerada no passo `3`:
![g1166.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597525372768/Qzs3tcPpI.png)
  6. E agora monte os caminhos do seu servidor que copiou do passo `2` -- lembrando que `/home/nvidia/` é o do meu servidor, o seu pode ser bem diferente:
![image1085.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597525390952/e0M2CsWaI.png)
  7. Só abrir a tela do OP e digitar `admin` como usuário e senha:
![g1254.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597525545366/5Ky7EWhFz.png)

Uma observação **importante** é que no passo `III.5` possuem valores dos serviços criados nos passos anteriores, então tome cuidado para atualizar com os nomes que deu à cada um dos seus containers e atualizar no passo ou utilize os mesmos do exemplo.

## Considerações finais

Vindo de uma sequência de posts de como rodar sistemas por contra própria, dois fatores que andam juntos são custos e eficiência energética. Como acabo rodando muitos desses sistemas em casa mesmo, o custo de energia não pode ser alto, muito menos o custo do equipamento em si -- uma vez que muitos servidores 'básicos' usados podem chegar a custar três mil reais usados --, fora o preço de suas peças sobressalentes como memória RAM, HD, fontes e etc seriam mais díficeis de manter.

![4130014567_2949dbdabb_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596997585778/GVvGNrVUm.jpeg)

 ["Energie sparen"](https://www.flickr.com/photos/44969058@N04/4130014567) by [SPW/](https://www.flickr.com/photos/44969058@N04) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Apêndice

- Foi considerado o preço de um dólar igual à 5.44 reais -- último valor durante a escrita deste texto.
- O Open Project buildado para multiplas arquiteturas se encontra disponível [neste](https://github.com/Fazendaaa/openproject) repositório na branch da versão 10 estável.
- Por falta de comptibilidade de um pacote não foi possível buildar o sistema para todas as arquiteturas, mas teoricamente seria possível fazer o OP rodar também nas seguintes arquiteturas:
  - linux/386
  - linux/ppc64le
  - linux/s390x
  - linux/mips64le
  - linux/arm/v6
  - linux/arm/v7
- Para maiores informações de configurações e ajustes 'finos' para a imagem do Open Project, basta seguir [este](https://docs.openproject.org/installation-and-operations/installation/docker/) passo a passo.
- Mesmo o OP em si permitir com que todos os componentes -- sistema, bd e cache -- sejam carregados em um container em si, para o suporte em ARM não consegui fazer com que tal abordagem fosse um sucesso pelos os requests de rede demorarem. Por causa de tal acredito que o problema seja de abstração de rede e a comunicação delas entre si do que a imagem em Docker ou até mesmo do Rancher/Kubernetes; talvez se mudar a configuração da sua placa ARM para carregar outro tipo, funcione para você.

## Referências

- [Clientes do Open Project](https://www.openproject.org/customers/)
- [South Korea's government explores move from Windows to Linux desktop](https://www.zdnet.com/article/south-koreas-government-explores-move-from-windows-to-linux-desktop/)
- [South Korea switching their 3.3 million PCs to Linux](https://www.fosslinux.com/29117/south-korea-switching-their-3-3-million-pcs-to-linux.htm)
- [Linux not Windows: Why Munich is shifting back from Microsoft to open source – again](https://www.zdnet.com/article/linux-not-windows-why-munich-is-shifting-back-from-microsoft-to-open-source-again/)
- [Zoom Security: 100 New Features Later, Can You Trust Zoom?](https://www.forbes.com/sites/kateoflahertyuk/2020/07/02/zoom-security-100-new-features-later-can-you-trust-zoom-yet/)
- [Is Nextcloud the Best Zoom Alternative in 2020?](https://velocityhost.com.au/blog/nextcloud-safe-secure-video-calling)
- [Taiwan joins Canada in banning Zoom for government video conferencing](https://www.cbc.ca/news/technology/taiwan-zoom-video-conference-1.5524384) 
- [Why is Sonos dropping support for older speakers, and does the reason hold up?](https://www.zdnet.com/article/why-is-sonos-dropping-support-older-speakers-and-does-the-reason-hold-up/)
- [OpenProject](https://www.capterra.com/p/152761/OpenProject/)
- [Installing Node.js and NPM on Ubuntu/Debian](https://www.devroom.io/2011/10/24/installing-node-js-and-npm-on-ubuntu-debian/)