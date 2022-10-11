# O Inferno de Dante do Cloud Native

> ‘Para onde foi Deus’, gritou ele, ‘já lhes direi! Nós o matamos – vocês e eu. Somos todos seus assassinos! - Nietzsche

Foto de capa: ["Judgment"](https://www.flickr.com/photos/boston_public_library/7727595008/in/photostream/) by [Boston Public Library](https://www.flickr.com/photos/24029425@N06) is licensed under [CC BY-NC-ND 2.0](https://www.flickr.com/photos/24029425@N06)

## Intro

O texto de hoje não vai ser uma análise *profunda* ou até mesmo *elaborada* que procure mostrar um planejamento de mudança quântica do DNA da sua empresa para ficar """preparada""" pro cloud native. Hoje vai ser um rant; ou seja, uma maneira bem informal de criticar pontuando várias coisas e meio que um 'balde de água gelada'.

Mas, antes de continuar, alguns pontos para a leitura do texto:

- *Containers*: tecnologia de encapsulamento e execução de sistemas
- *Cloud Native (CN)*: desenvolvimento baseado em containers
- *Kubernetes (K8s)*: gerenciador de containers em alta escala
- *Docker*: ferramenta de criação, execução e distribuiçlão de containers

![14835903808_9319f3d8b5_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615982316170/DurjTzfTz.jpeg)

["The Purgatorial Ladder, or Ladder of Souls, with the Seven Deadly Sins"](https://www.flickr.com/photos/98601913@N00/14835903808) by [louisberk.com](https://www.flickr.com/photos/98601913@N00) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

Para quem não conheça o Inferno de Dante, é uma obra de Dante Alighieri chamada Divina Comédia; talvez você a conheça melhor pela obra de Botticelli, uma pintura que representa justamente o Inferno.

## O inferno

![13786557975_f627d4244b_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615951556139/ay_XHzEBV.jpeg)

["Satan (after Botticelli)"](https://www.flickr.com/photos/37413900@N04/13786557975) by [Maxwell Hamilton](https://www.flickr.com/photos/37413900@N04) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

- Quando já se tem um time com uma cultura sólida de desenvolvimento na qual a migração para cloud native, no momento, não se justifique
- Utilização de ferramentas extremamente poprietárias que não se integram bem com a tecnologia de containers, seja como para chamar eles em um ambiente de desenvolvimento ou transferindo a responsabilidade para configurações de rede que nem sempre são suportadas em um ambiente de produção
- Não ter a necessidade de coleta, supervisão e processamento de métricas coletadas de como anda a saúde do sistema -- *não que isso seja uma abordagem 'certa' ou até mesmo recomendada*
- *Sejamos honestos...* Ainda tem gente com infra esturturada em torno do Windows Server 2003
- Tecnologias nas quais seu ciclo de vida e/ou comunidade mostrem sinais de já estarem com morte cerebral, só esperam que os equipamentos de suporte de vida sejam desligados -- *banco de dados muito pouco conhecidos ou ferramentas de processamento de arquivos que não decolaram, mas, como foram utilizadas no começo do projeto são mantidas até agora*
- FALTA DE AMBIENTE HOMOLOGADO DE PRODUÇÃO
- Ciclo de densevolvimento com poucas entregas e muito espaçadas -- *fazer um processo de build complexo e escalável pode não justificar o custo de ter que corrigir uma build manualmente por cinco minutos duas vezes por ano*

![4478819368_14b305e2c1_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615981132105/MfISfgtzf.jpeg)

["Portrait of Dante by Botticelli"](https://www.flickr.com/photos/26244825@N05/4478819368) by [paukrus](https://www.flickr.com/photos/26244825@N05) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

- Projetos MUITO pequenos e com times com backgrounds muito diferentes e que não possuem familiaridade com a tecnoliga de containers -- *por mais que containers, Docker e K8s possam ser conceitos elegantes, robustos e bonitos para mim, muita gente sequer sabe o básico da tecnologia, o que o treinamento e reciclagem de alguns pode acabar encarecendo o desenvolvimento*
- Tem um post que fala sobre o porquê uma empresa não utiliza Docker; em resumo eles não precisam... Por mais que eles utilizem Go, a mesma linguagem com qual o Docker é escrito, a simplicidade e a robustez da linguagem faz com que por mais que eles pudessem encapsular se tornasse desnecessário -- *quase quando você compra algo quepor si só já é MUITO bem embalado mas o Mercado Livre ainda embala com outra caixa quase que desnecessária*
- O mercado profissional da tecnologia é incipiente e requer uma mão de obra altamente qualificada -- *em um primeiro momento a criação, distribuição e execução de containers pode parecer algo realmente simples; mas o desenvolvimento de uma arquitetura que comporte bem todos os cenários de vários containers, réplica de dados, balenceamento de carga e etc. seja algo com quais profissionais de décadas de experiência em outras áreas tenham maior familiridade pois eles só vão estar aplicando conhecimentos que eles já possuem de outras vidas de infraestrutura que eles possuem em uma tecnologia nova. Alguém que só conheça infra de um ponto de vista de containers pode acbar tendo uma visão muito limitada da categoria como um todo, não conseguindo mensurar outras possibildades*

![4118905607_1e3edcfbe0_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615982157328/OuWgMe_m1.jpeg)

["Birth of Venus, Botticelli"](https://www.flickr.com/photos/33057724@N04/4118905607) by [f_snarfel](https://www.flickr.com/photos/33057724@N04) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

- Mercado com falta de profissionais bons e baratos; como o próprio ponto anterior tangencia nisso, mesmo sendo simples dar um `docker-compose up` como vários dos meus textos mostram, o Docker só começou a pegar força por volta de 2015 pra cá; ou seja, quem entrou na faculdade naquele ano se formou ano passado e nem sequer pode ter ouvido falar da tecnologia e mesmo assim anos de experiência que fariam com que também se tenha mais familiaridade e cicatrizes de uso
- **Falta de comunidade**: sim, é uma bolha a comunindade de containers -- assim como qualquer outra comunidade de tecnologia --... Por mais confortável que esteja com a utilização de Dockerfiles em projetos Node.js, pessoas por exemplo que usem Haskell talvez não tenham a mesma facilidade e mesmo quese elas comecem a usar pode ser que quando forem procurar tirar dúvidas sobre isso no StackOverflow elas vejam que ninguém perguntou antes delas; ainda é uma tencnologia para muitos "desbravadores".
- **Barreira de entrada**. Não, não está escrito errado; assim como sempre se diz que a melhor câmera é aquela que se tem no momento, por mais que um projeto utilize todas as tencologias citadas até agora possa ter o potencial de se tornar o melhor possível, pode ser que seja também como o tênis mais confortável que possua agora mas que levou uns dias até laçear e ficar confortável no seu pé. Caso já tenha o seu fluxo de desenvolvimento de R no Fedora, migrar para imagem oficial utiliza uma base Debian com pacotes de sistema com outros nomes; nem sempre a migração vai ser 1:1 -- *isso quando não se estiver saindo do Ubuntu e seu projeto utilize algo exclusivo dele e você não conseguir portar para uma imagem Alpine por exemplo*
- **Omissão de configuração**: muitas vezes um projeto não utiliza artefatos como requirements.txt, setup.py, DESCRIPTION, package.json e etc para gerenciar suas dependências. Um projeto que dê um `pip3 install ...` dentro do Dockerfile tem que deixar claro que o projeto só roda dentro de containers, assim como são e como configurar eles -- *esperar alguém que não tenha familiariade abra um projeto sem um norte e esperar que a pessoa consiga utilizar é o mesmo que mandar uma bibilioteca em C com um Makefile para um arquiteto e falar pra ele "está tudo aí" e esperar que ele saiba que tem que rodar um* `make`

![48966902726_3e3d11f9a4_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615983034386/mToVljn_2.jpeg)

["IMG_6768B Alessandro Botticelli 1445-1510 Florence Madonna del Padiglione Madone du Pavillon Madonna of the Pavilion Milan Pinacoteca Ambrosiana"](https://www.flickr.com/photos/79505738@N03/48966902726) by [jean louis mazieres](https://www.flickr.com/photos/79505738@N03) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

- Juntando os dois últimos pontos: o melhor projeto é aquele que você consegue tocar agora; se a omissão deixa o projeto díficil de se executar o excesso de artefatos como YAMLs pode fazer com que a pessoa que nunca viu aquilo em um projeto fique se perguntando se ela vai precisar instalar um K8s na máquina dela e o Helm para simplesmente executar uma calculadora em Java. Fazendo que por mais que os arquivos sejam em texto se tornem tão difícieis de leitura como um binário para os não iniciados.
- Knuth já diz que uma das piores coisas é a otimização precoce. A busca se utilizar em excesso os recursos de builds como multistage build, como pipe de Jenkings, Harbor, Grafana, Prometheus e etc. acabe fazendo com que a performance até mesmo possa ser menor. Com o Github Actions muitos workflows acabam ficando maior do que o código contido no projeto em si. O que faz com que um projeto que era para ser um "pitch de elevador" se torne um "pitch do expresso do oriente" -- *se for só para você, para rodar só na sua máquina e apenas poucas vezes, não mate sua produtividade e pensamento criativo em detrimento de pensar em cenários que talvez nem aconteçam se a base do projeto não for sólida*
- **Conhecimento intermediário de SO**: isso mesmo, infelizmente não dá pra se chamar de *mínimo* neste caso porque não é todo mundo que escreve linha de código que tem um bacharel em Ciências da Computação; essa mesma pessoa talvez não entenda que ela tenha que fazer uma binding de volume para poder salvar os dados do MongoDB dela ou até mesmo expor uma porta do container além de ter que fazer um binding de uma do host para poder acessar a demo dela feita em Rails.
- Não é só o princípio de menor privilégio que vai tornar sua apilicação 100% confiável; serverless nasceu até com com a ideia justamente de você só se preocupar com o código e a empresa se preocupar com a infra e a manutenção dela e isso vale muito a pena em muitos cenários. Não são TODAS as linguagens que o depenabot faz um scan dos pacotes -- isso quando o programador faz o mínimo de colocar elas em um `package.json` --, ou até mesmo o Synk passa fazendo PR porque um pacote do seu projeto minerava criptomoedas de fundo. Nem todo mundo vai usar uma infraestrutura empresarial que consegue cuidar de cenários assim ou muito menos privada como uma Azure; galera rodando em infra como de universidades precisa ter claro aquilo que você vai executar e não acreditar cegamente em sua palavra.

![8629191040_48a3958829_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615985475944/HpCt9wF9V.jpeg)

["Botticelli, Lamentation of Christ"](https://www.flickr.com/photos/33057724@N04/8629191040) by [f_snarfel](https://www.flickr.com/photos/33057724@N04) is licensed under [CC BY-NC 2.](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

- **Elasticidade sem responsabilidade é imaturidade**... Por maior que sejam os pontos de vendas de vendas de cloud native com relação a sua utilização isso acaba se tornando também um dos, senão o maior, calcanhar de Aquiles dela. Como o pessoal do canal Tech Deals fala:* "não existe um produto ruim, existe um produto mal precificado"*; se o sistema for flexível para escalar demais sem reduzir depois quando a demanda cair, pode acabar atingindo mais cedo este mês o limite do cartão de crédito que deixou atrelado à AWS.
- Esses tipos de cenários acontecem devido há falta de tradição que o desenvolvimento baseado em containers tem; a falta de conteúdos como *"Aprenda a subir seu container Java"* ou até mesmo uma pegada mais charlatona como *"Suba seu container com Julia em 7 dias"* fazem com que as regras do jogo não fiquem claras para quem decide dar uma chance para a tecnologia; falta de erros reportados na internet não são a prova que eles não existem.
- A falta de tradição não para por aí, hoje em dia players como Intel e AMD possuem em seus servidores instruções de CPU feitas exclusivas para aplicações rodando em Virtual Machines (VMs).
- **Falta de incentivos**: assim como o Clippy da Microsoft perguntava se você precisava de ajuda em seu documento Word na década de 90 e o Ubuntu se você quer atualizar; enquanto CLIs como o `create-react-app` ou até mesmo botões de IDEs de novos projetos não perguntarem se deseja ou não colocar um artefato como um `Dockerfile` ou mesmo um `docker-compose.yml` no seu projeto, a exposição para pessoas que não conhecem a tecnologia de irem lá e procurarem saber mais consequentemente faz com que seja de díficil penetração.
- **Falta de adoção acadêmica**: por mais que os pontos até agora tenham sido mais "mercadológicos" com uma pitada de projetos pessoais, a adoção por parte da academia pode ajudar a propagar o usa da tecnologia -- *uma coisa que eu particularmente dúvido muito uma vez que muitos papers não publicam por inteiro o código que rodam, isso quando publicam, e mesmo assim se tem dificuldade de reproduzir maior parte deles.*

![26652348463_c47c892871_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615989972208/O_drD1kh6P.jpeg)

["IMG_0413CKA Sandro Botticelli. (Alessandro di Mariano di Vanni Filipepi) 1445-1510. Florence. Venus and Mars. vers 1485. Londres National Gallery."](https://www.flickr.com/photos/79505738@N03/26652348463) by [jean louis mazieres](https://www.flickr.com/photos/79505738@N03) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

- **Mainstream mídia**: dentro de mídias mais técnicas publicações sobre de containers pode dar uma falsa sensação que eles são onipresentes e onipotentes -- *quase como o Mimir em GoW, aquele que tudo vê e aquele que tudo sabe* --, em mídias menos voltadas para computação como mercado financeiro e arquitetura eles já falaram de Python; e em mídias mais tradicionais como um canal de TV já falaram sobre Java. Como diz o ditado *"não existe má publicidade"*, o brasileiro que lê/assiste/ouve notícias deve saber sobre VMs por causa da falha de segurança do Supremo Tribunal de Justiça que aconteceu em 2020 -- *não só o brasileiro em si, a mídia internacional reportou sobre isto também*
- **Casos de sucesso**: por mais que todo caso de uso bem feito dando retorno de segurança, escala e economia de uma tecnologia seja considerado de *sucesso* para àqueles que implementaram ela, falta de coberturas em mídias mais técnicas como *"NETFLIX muda para rodar 100% em containers ARM e reduz gastos de infra para 1/7 do que eram antes"* fariam com que a comunidade técnica repensasse a sua posição e cogitasse dar uma chance para a tecnologia uma vez que um grande player fez isso -- *quase como quando o Twitter saiu de Rails para ir pra Java que fez com que a comunidade técnica debatesse e analisasse o movimento*
- **Garra**: desenvolvimento pessoal é duro uma vez que muitas pessoas ralam no trabalho o dia todo, vão para a faculdade no final do dia e ainda tem os boletos e problemas pessoais para lidar e pedir para que elas estudem nas 4h que conseguiram reservar no final de semana pode ser uma venda díficil, quase que uma aposta, de falar em containers quando JavaScript pode dar um retorno pessoal quase imediato e de baixo risco.
- **Reinado do x86**: durante décadas o x86 domina os desktops de desenvolvedores assim como os servidores, uma vez o próprio Linus Torvalds comentou que não via um futuro muito no ARM enquanto os desenvolvedores não tivessem acesso em suas próprias máquinas; fora que o costume e o legado de décadas de x86 poderia tornar o processo custoso. Essa "supremacia" de arquiteturas torna os desenvolvedores complacentes a plataformas baseadas em Intel e AMD; sem incentivos de migrar para outras plataformas e pensar em arquiteturas diferentes talvez essa inércia seja difícil de ser quebrada -- *comento isso principalmente porque em uma pequena margem de projetos pessoais que porto para várias arquiteturas através do Buidlx tive que fazer pequenas adequações nas imagens para rodar o mesmo projeto*

![16423852561_6fe822cce7_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615991841387/f0s3yibVw.jpeg)

["IMG_6268J Sandro Botticelli. (Alessandro di Mariano di Vanni Filipepi) 1444-1510.Florence."](https://www.flickr.com/photos/79505738@N03/16423852561) by [jean louis mazieres](https://www.flickr.com/photos/79505738@N03) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

- E por falar em "supremacia"... Mesmo com Windows Subsystem for Linux (WSL) e o próprio Docker, muitos desenvolvedores que não mexeram com um MS-DOS não sabem o que é um terminal e muito menos o padrão POSIX; enquanto tais conceitos sejam como um passeio no parque para desenvolvedores Linux/Mac/BSD, para um desenvolvedor Windows -- que são a maioria dos desktops do que os outros três sistemas combinados -- faz com que um `cd` por mais simples que seja se torne um conceito beirando a ficção científica
- Mesmo em ambientes de desenvolvimento e de produção como a cloud já utilizarem containers ainda há pouca penetração deles no on-premise; mesmo se a empresa estiver rodando o Windows Server mais recente, muito provavelmente é um ambiente VMWare no qual não possuem um cluster K8s muito menos um Docker Desktop para rodar aplicações baseadas em containers.
- *Por que bancos rodam COBOL ainda?...* Longe de dar uma resposta final e super técnica até por falta de conhecimento profundo da área uma linguagem que é mais do que duas vezes mais velha do que eu -- beirando as três vezes --, um dos motivos que um texto que li há uns anos que comentou sobre isso disse que o custo de migrar a infra para Java superava os possíveis retornos. Por pior que manter sistemas em COBOL possa parecerer e que outras linguagens façam aquilo melhor, mais eficiente e tudo mais, o investimento inical é muito alto... Agora imagina querer migrar um sistema que funciona relativamente bem, com os gastos, erros e cenários de recuperação previstos para uma nova infraestrutura desconhecida?

Assim como um container pequeno, com um scan limpo, sem permissão de escrita em disco e com healthcheck configurado é o sonho de qualquer sys admin, ele pode ser o pior pesadelo de um desenvolvedor. Cloud Native não se resume apenas há "desenvolvimento baseado em containers" assim como GitOps não é apenas "pipes de build e entregas"... No final a mudança de paradigma não é ferramenta mas sim de responsabilidade; a granularidade alta de desenvolvimento fez com que as reponsabilidade sobre os projetos sejam compartilhadas; cada vez mais se vê menos o profissional que sabe montar um hardware, configurar sua rede, instalar o sistema operacional com as opções de firewall com um apache rodando na porta certa liberada pro reverse proxy poder servir o site que ele fez em Flask.

A mudança não é tencologica, mas sim de um mercado que está começando a se solidificar com bases e procedimentos.

![16221446299_6d6e1fcf8d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615992671284/4dwNbBM4J.jpeg)

["IMG_6267D Sandro Botticelli. (Alessandro di Mariano di Vanni Filipepi) 1444-1510. Florence"](https://www.flickr.com/photos/79505738@N03/16221446299) by [jean louis mazieres](https://www.flickr.com/photos/79505738@N03) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Em suma

A ideia deste texto surgiu quando comecei a escrever "usos para K8s..." no meu caderno de estudo ao começar a ler o livro da SUSE sobre K8s para dummies; a vontade de continuar a ler foi automáticamente para a mais baixíssima prioridade quando bateram as dores já passadas e o pensamento focou nas futuras -- e previstas -- dores sobre mexer com mais uma tecnologia.

Só que, ao mesmo tempo, a falta de uso de cloud native gerar essa dificuldade de implementar eles acaba se tornando um problema do ovo e a galinha; se não tiver gente utilizando a tecnologia para implementar casos de uso não haverá também desenvolvimento dela para melhorar seu ciclo de desenvolvimento. Isso faz lembrar como o Rust cresceu com a adoção por empresas como o Firefox e o Discord.

Por """pior""" que isto possa soar, na verdade funciona mais como um mecanismo de adptação; prever dificuldades e saber planejar para elas evita a desistência precoce uma vez que as expectativas estão alinhadas e se o desafio for grande demais para o momento, procurar traçar a melhor maneira de conseguir mitigar os problemas.

![6065631472_03d14613af_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615951779099/cBlq4qyE_.jpeg)

["Do not fear failure"](https://www.flickr.com/photos/36116655@N00/6065631472) by [Tomasz Stasiuk](https://www.flickr.com/photos/36116655@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Apêndice

Caso não tenha ficado claro no texto e nas conclusões finais, vou deixar claro agora no apêndice: *"A IDEIA NÃO É DESINCENTIVAR, MAS SIM PONTUAR RISCOS"*.

Por mais que mesmo MUITOS dos pontos não serem exclusivos da abordagem cloud native, eles existirem no bare metal e na VM, vários textos que citam cloud native deixam de pontuar eles; por mais que seja uma maneira de tentar atrair pessoas para a tecnolgia, enganar não é a melhor maneira porque faz com que quando a pessoa se fruste fique brava justamente e não se desenvolva mais.

O texto é para poder projetar as ideias entre uma hora de estudo e uma janta com um caderno do lado anotando ideias, nada mais e nada menos. É um dos poucos publicados que as [referências](#referencias) técnicas são quase que uma obrigação a leitura. Como foram as coisas que vieram na mente em questão de uma hora talvez possa ser que faça uma "parte 2" algum dia no futuro se mais ideias vierem.

![2754681293_e395cb3895_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615951945194/zBn4PM2nO.jpeg)

["Water Glass Light Shadow"](https://www.flickr.com/photos/82439748@N00/2754681293)  by [blmurch](https://www.flickr.com/photos/82439748@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Referências

- [Botticelli — Dante's hell in art | DW Documentary](https://youtu.be/SUlcmTcJ_4I)
- [Inferno (Dante)](https://en.wikipedia.org/wiki/Inferno_(Dante))
- [A divina comédia em quadrinhos](https://www.amazon.com.br/Divina-Com%C3%A9dia-em-Quadrinhos/dp/8575962299/ref=asc_df_8575962299/)
- [Mozilla Welcomes the Rust Foundation](https://blog.mozilla.org/blog/2021/02/08/mozilla-welcomes-the-rust-foundation/)
- [Why Discord is switching from Go to Rust](https://blog.discord.com/why-discord-is-switching-from-go-to-rust-a190bbca2b1f)
- [Why We Don’t Use Docker (We Don’t Need It) ](https://launchyourapp.meezeeworkouts.com/2021/03/why-we-dont-use-docker-we-dont-need-it.html?m=1)
- [Examining “Reproducibility in Computer Science”](https://cs.brown.edu/~sk/Memos/Examining-Reproducibility/)
- [x86 virtualization](https://en.wikipedia.org/wiki/X86_virtualization)
- [https://www.securityreport.com.br/overview/ataque-aos-sistemas-do-stj-requer-configuracoes-nos-protocolos-de-seguranca-do-windows/](https://www.securityreport.com.br/overview/ataque-aos-sistemas-do-stj-requer-configuracoes-nos-protocolos-de-seguranca-do-windows/)
- [HACKED: Brazil’s Superior Court](https://youtu.be/0MpJO4OOnq0)
- [Twitter muda de Ruby para Java. Ruby é 3x mais lento que Java.](https://www.akitaonrails.com/2011/04/16/twitter-muda-de-ruby-para-java-ruby-e-3x-mais-lento-que-java)
- [The incredible growth of Python](https://stackoverflow.blog/2017/09/06/incredible-growth-python/)
- [What Linus Torvalds really thinks about ARM processors](https://www.zdnet.com/article/what-linus-torvalds-really-thinks-about-arm-processors/)
- [Desktop Operating System Market Share Worldwide](https://gs.statcounter.com/os-market-share/desktop/worldwide)
- [The cost of fixing COBOL bugs](https://www.phasechange.ai/the-cost-of-fixing-cobol-bugs/)