# Rancher no Linode

Foto de capa: "[Oxford university museum](https://www.flickr.com/photos/75487768@N04/13164220234)" by [barnyz](https://www.flickr.com/photos/75487768@N04) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

> "There is nothing more deceptive than an obvious fact." -- Arthur Conan Doyle, The Boscombe Valley Mystery - a Sherlock Holmes Short Story

# Intro

*HTTPS, [Docker](https://www.docker.com/), [Kubernetes](https://kubernetes.io/), Cloud, ....* Termos que são muitas vezes jogados e ficam difíceis de ser debatidos uma vez que muitas pessoas não conseguem delimitar onde começam e terminam cada um e delegar suas responsabilidades; caso não tenha acompanhado alguns dos textos já publicados neste site, aqui vai um resumo:

- **HTTPS**: comunicação do tipo HTTP porém com configurações a mais que a deixa maneira criptografada;
- **Docker**: ferramenta de criação, distribuição, execução e composição de containers;
- **Kubernetes**: padrão de orquestramento e elasticidade em massa de containers, englobando o seu cilco de vida;
- **Containers**: formato "exportar" software de maneria prática;

O termo "Cloud Native" geralmente está associado a tudo isto porque ele significa um desenvolvimento baseado em containers pronto para ser executado na nuvem.

Com isso, uma das possibilidades é ter uma rotina de desenvolvimento e entrega que garante um cenário onde podemos ter:

- `https://exemplo.com`: o site empresarial;
- `https://blog.exemplo.com`: o blog da empresa;
- `https://app.exemplo.com`: a aplicacao da empresa;
- `https://demo.app.exemplo.com`: uma demo da aplicacao da empresa;
- `https://email.exemplo.com`: o client de email self-hosted;
- `https://admin.exemplo.com`: a dashboard da infra empresarial, mesmo que seja com diferentes provedores;
- etc;

E o mais importante, com tecnologias completamente distintas e, em alguns casos, de terceiros. Tudo isso podendo ser em espacos físicos ou virtualizados diferentes ou até mesmo em um só ambiente seja lá de qual tipo ele for; fora que em diferentes provedores, podendo extrair o melhor de cada oferta. E o mais importante: **usando uma maneira de gerenciar apenas**.

O que virtualmete lhe permite ser o seu próprio cloud provider uma vez que o gerenciamento da infra está todo centralizado em suas mãos, mas com a vantagem de não precisar em se preocupar em manter os recursos e ter que escalar eles.

Após mais de um ano utilizando uma das stack de cloud native, a ideia é compartilhar neste texto um pequno pedaço dela e o porquê lhe pode ser interessante ter algo parecido também. Tudo isso de maneira atual trazendo:

- Versão mais recente do Kubernetes (v1.24)
- Versão mais recente do Traefik (v2.8)
- Versão mais recente do Rancher (v2.6)

![15586540809_79e0f3558a_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661801142324/iT2xqOzl-.jpg align="left")

"[Transporter Moves Orion Into Place](https://www.flickr.com/photos/108488366@N07/15586540809)" by [NASAKennedy](https://www.flickr.com/photos/108488366@N07) is licensed under [CC BY-NC 2.0.](https://creativecommons.org/licenses/by-nc/2.0/?ref=openverse)

# Aplicação

A grande vantagem se utilizar tais tecnologias é que isto permite uma pluraridade de opções de desenvolvimento, isto porque não há mais a limitação da oferta de execução. Ou seja, não irá mais precisar utilizar [Java](https://www.java.com/en/), [C#](https://docs.microsoft.com/en-us/dotnet/csharp/), [Objetive C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) ou qualquer outra linguagem porque o ambiente de execução só tem elas instaladas, contanto que rode containers você poderá desenvolver com o ferramental que quiser. Vale ressaltar que Linux, Mac e Windows rodam containers.

No final do dia seu sistema pode ser executado com: Docker, [Compose](https://docs.docker.com/compose/), [Swarm](https://docs.docker.com/engine/swarm/), [AKS](https://azure.microsoft.com/en-us/services/kubernetes-service/), [EKS](https://aws.amazon.com/eks/), etc. Como tais ambientes são facilmente interoperáveis, isto facilita a integragção e faz com que a migração caso necessária seja feita com baixa ou até mesmo nenhum atrito ou necessidade de modificação.

Além disso o enriquecimento para o negócio é claro:

- Desenvolvedores podem trabalhar da maneria que mais ficam confortáveis:
  - Com sistemas operacionais diferentes;
  - Com ferramental de edição de código diferente;
  - Com versões totalmente diferentes do ferramental ao mesmo tempo, sem precisar se preocupar com gerir elas com relação ao sistema operacional da própria máquina;
- O arquiteto poder desenhar uma solução:
  - Sem se preocupar em qual fornecedor ela irá rodar;
  - Qual sistema operacional vai estar rodando;
  - Sem precisar calcular previamente a volatilidade do uso e ter que fazer um overspec do hardware para garantir o pior cenário;
  - Focando na longevidade da aplicação em si e não nas migrações necessárias de tech para poder escalar ela no seu ciclo de vida;
- Separação de escopos de responsabilidades:
  - Time de infra aloca o recurso;
  - Time de segurança configura politicas necessárias sem precisar ter acesso à infra;
  - Time de desenvolvimento só se preocupa com o código da aplicação em si, sem se preocupar com os outros dois times;

Esta mesma estrutura lhe permite também subir soluções que não ficariam expostas a internet mas que poderiam ser utilizadas para auxiliar a execução das que ficam, ou até mesmo serem utilizadas por serviços internos da empresa ou da sua casa., como um banco de dados, uma ferramenta de coleta de metricas de uso do sistema. Uma vez que a estrutura é agnóstica do que voc/ẽ vai executar nela desde que apresente um container, o que hoje em dia eh uma fatia considerável do mercado.

Outro ponto importante é que se um time de desenvolvimento tem um pipe de gerção de containers, o mesmo pode ser integrado a solucação para entregar este container no ambiente de produção e executar ele.

Pluraridade de opções não significa que o resultado sera robusto. Entender os prós e contras de cada opção permite dar uma visão de como o resultado desejado pode ser atingido e desenhar a solução de trás para frente baseado nisto; assim como um cozinheiro procura entender o que cada ingrediente pode entregar para potencializar o resultado no prato e não sobrepor nada e, muito menos, gerar disperdícios.

![4436583782_4511a958f3_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661383901841/pfCuIxcRU.jpg align="left")

"[La Boqueria (Food Market) Barcelona](https://www.flickr.com/photos/47557199@N03/4436583782)" by [Jonesemyr](https://www.flickr.com/photos/47557199@N03) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=openverse).

# Importância

Comodidade é a maneira como muitos cloud providers atraem e até mesmo convertem usuários; porém como diz o ditado: *"cada escolha, uma renúncia"*.

Utilizar um solução como o [Heroku](https://www.heroku.com/) que ja lhe entrega a comodidade de alocar uma URL pra sua aplicação e você só se preocupar com o código e integrar as publicações dele ao provedor. Isto lhe limita também porque pelo o fornecedor se tratar de uma solução famosa pela sua oferta de tecnologia serverless, este tipo de tecnologia geralmente acarreta em:

- Oferta bem reduzida de linguagens/frameworks muita vezes suportados;
- Custo operacional alto por oferecerem basicamente uma solução com baixa pra nenhuma supervisão -- *praticamente um piloto automatico só que sem feedback, o que eles entregam é o que você tem e sem possibilidade de ajustes finos*;
- Métricas e/ou controle da aplicação são desnutridos de conteúdo relevante;
- DNS normalmente no formato: `http://meuApp.nomeDoProvedor.com/` -- *ficando clara a dependência no provedor;*
- etc;

O foco, muitas vezes, de empresas como essas sao ser "boutiques" e fazer o nome delas em certo nicho, atendendo muito bem eles, principalmente em caso de empresas pequenas que precisam de um killing app para poder sair do status de start up; só que a mesma oferta deixa clara sua fragilidade de um negócio que é caro para ser mantido uma vez que se saí da fase de prototipação e é necessário se tornar sustentável para poder se vender. Em uma situação dessas, aprovedora depende mais do cliente do que o cliente dela -- *coisa que nas grandes cloud providers o inverso acontece porque manter uma operação no ar sendo reponsável pela infra é muito mais caro e não é para qualquer um.*

Isso sem contar o premium que é gasto em opcionais que seriam de graça ou custo baíxssimo comparado a outros provedores como:

- Análise de tráfego;
- Databases;
- Atrelar seu próprio domínio;
- TLS/SSL -- *que geralmente já é uma versão descontinuada ou muito próxima de ser*;
- etc.

Assim como retratado em partes no texto [Cansado de pagar caro com o shinyapps.io? Nada mais de 'vendor lock-in'](https://fazenda.hashnode.dev/cansado-de-pagar-caro-com-o-shinyappsio-nada-mais-de-vendor-lock-in), isto pode parecer mais com o canto de uma sereia; a provedora lhe atraí com planos gratuitos interessantes para um protótipo e um projeto pra portifólio, mas mostra as presas com o custo dos planos pagos, tornando impraticável para colocar algo em produção. 

A saída a ser apresentada aqui será a "stack":  Let's Encript + Traefik + Linode + K3s + Rancher + GoDaddy. Com ela teremos:

- **Flexibilidade**:
  - *Acesso por DNS próprio*: o que permite migrar toda a "magia" do sistema como acontece amanhã ou depois e mudar de provedores porque o usuário vai reter a detenção do dominío;
  - *Portabilidade*: poder migrar parte da stack para outro provedor;
- **Segurança**:
  - *Configurações de rede*: limite de IPs de acesso, controle para evitar DDoS, balanceamento de tráfego, etc; 
  - *Controle do sistema operacional*: podendo garantir que o controle da informação será mantido sem o vazamento dela pelo provedor;
- **Custo baixo**:
  - *Retirar o intermediário*: gestão de diretivas na mão do usuário e não do cloud provider;
  - *Granularidade alta de ofertas*: liberdade para utilizar ferramentas que tiram o maior proveito de cada camada da solução sem encarecer por ser limitado a usar uma coisa só;
- **Alfaiataria de hardware**:
  - *'Bullseye'*: escolher o hardware que não deixara a solução não entregar assim como evitar disperdícios;
  - C*ontrole de demanda esporádica*: elasticidade para reduzir ou aumentar de acordo a necessidade;
- ***"Free as in beer"***:
  - Licenciamento gratuito de algumas das soluções;
  - Código aberto para escrutínio;

Com isso, a ideia não eh excluir quem tem uma solção diferente ou até mesmo escolheu uma variação desta; mas sim explorar como fazer para estruturar esta em si e quais cenários e variações são melhores para atender cada etapa do desafio.

![5605187738_69b5dec802_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661384425355/ztRocJf7Q.jpg align="left")

"[classroom blackboard](https://www.flickr.com/photos/52678969@N05/5605187738)" by [cayoup](https://www.flickr.com/photos/52678969@N05) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

# DNS

O famoso Domain Name System (DNS) por mais que seja conhecido como o meio de acessar um site atravez de uma URL, a magia nao para ai. Em uma macro visão toda vez que você digita o nome de um site e dá Enter, é feita uma requisição para o name server responsável atrelado aquele domínio para requisitar o IP dele.

Lembrando que IP apenas significa Internet Protocol, ele não é um número de série que é instransferível, ele funciona mais como uma comanda de uma balada, algo que voce usa uma vez que entrou no estabelecimento e lhe é entregue ali. O IP é uma "comanda" da internet, que é atribuído ao seu aparelho uma vez que ele se conecta, por isso o IP de uma máquina pode mudar entre conexões; o número de série de uma placa de rede em si é o [MAC address](https://en.wikipedia.org/wiki/MAC_address) dela.

O DNS irá possibilitar que com algo registrado uma vez so permita que todas as soluções a serem apresentadas sejam alocadas em um só registro, o que faz com que o custo operacional seja, na prática, inexistente quase uma vez que se tem teoricamente infinitas combinacoes de subdomínios. Fora que a portabilidade de domínios existe, assim sendo se quiser mudar de um provedor de DNS para outro isto é totalmente possível.

Caso já possua um domínio sem utilizar e saber configurar os nameservers dele para apontar pros do Linode, poderá pular a próxima parte. O registro do domínio exemplificado será feito pelo GoDaddy, por ser uma solução paga isto pode ser um fator limitante para alguns seguirem este tutorial; todavia processo similar ao apresentado pode ser feito com soluções como o [freenom](https://www.freenom.com/en/index.html?lang=en) -- todavia é um serviço que no qual mais é elaborado sobre ele no [Apêndice](#apendice) do texto.

![3706832460_fcacc24ee4_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661429590267/jbz4OCzbZ.jpg align="left")

"[long stones](https://www.flickr.com/photos/39334480@N00/3706832460)" by [Jos van Wunnik](https://www.flickr.com/photos/39334480@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

## GoDaddy

Neste tutorial o domínio a ser utilizado, `fazenda.solutions`, será registrado pelo [GoDaddy](https://www.godaddy.com/). A questão da escolha deste nome para o domínio em si é mais por preço e achar um nome interessante ao invés de qualquer motivo técnico em si como alguns domínios são e como elaborado no apêndice de [Por que utilizar *.app?](#por-que-utilizar-app) -- *caso escolha um domínio `*.com` utilizar o [Honey](https://www.joinhoney.com/) talvez lhe ajude porque quando esta matéria foi escrita um cupom de 50% de desconto estava disponível.*

Uma vez na página inicial do GoDaddy, e depois de ter feito o seu cadastro, basta clicar na opção de encontrar seu domínio:

![g5187.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661602058277/DB4dO21ZM.png align="left")

Na tela que abrir, pesquise um domínio que lhe interesse. Durante este texto será utilizado nome `seu.dominio` para exemplificar o domínio que escolher:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661602261612/SR6niPgyf.png align="left")

Selecione a opção desejada:

![g9822.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661602453338/ha-YOZO8p.png align="left")

Aparecerá um janela pra confirmar a sua escolha e adicona-la ao carrinho, selecione pra adiciona-la:

![g10664.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661602676029/FAwsAHUadN.png align="left")

Logo em seguida clique para ver o carrinho no botão que aparecer no mesmo lugar de adicionar o domínio ao carrinho em si. Agora, na parte de proteção do domínio:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661379168638/6vENL3KpZ.png align="left")

Esses fatores vão recair sobre você fazer a escolha, mas o *"two cents"* sobre cada um:

- A proteção completa ja é bastante interessante porque ela utiliza um e-mail de proxy do GoDaddy que evita que tentativas de ataques sociais sejam feitas tentando capturar o e-mail do dententor do domínio e fazer sequestro da titularidade dele; todavia caso esteja fazendo algo mais sério, configurar o multi factor authentication ou ate mesmo usar um aparalelho [air gapped](https://en.wikipedia.org/wiki/Air_gap_(networking)) seria a melhor solução;
- Ja a solução Ultimate auxilia uma vez que é comum se esquecer de renovar o domínio, ainda mais se escolher uma opção de pagamento como boleto ou até mesmo se o cartão vencer -- *coisa que particularmente já aconteceu comigo*;
- Caso queria apenas fazer um teste mesmo, sem proteção de domínio não terá problema para o que será demonstrado aqui;

Não é necessário selecionar a opção de "comece seu site GRÁTIS" nem muito menos a de e-mail -- a não ser que deseje:

![g12624.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661603543550/vYgNFXff1.png align="left")

Apenas clique na opção de continuar:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661603579622/icpp6A0Pv.png align="left")

A parte da finalização da compra será como qualquer outra compra online que faça em outros sites, só prosseguir colocando suas informações e forma de pagamento.

Uma vez criado o domínio, será necessário configurar ele. Basta clicar nele na opção de "Gerenciar meu domínio" que aparecer na tela depois de finalizada a aquisição:

![g16076.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661603976855/40oUoe0wq.png align="left")

Depois so clicar na aba de "Domínio" no painel da esquerda e em "Gerenciar DNS":

![g16066.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661603991723/wkULQ729O.png align="left")

Na tela que abrir, basta procurar "Servidores de nomes" e clicar no botao de "Alterar":

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661443260035/i0gOB3vT4m.png align="left")

No "pop up" que aparecer, selecione a opção de "inserir meus próprios servidores de nome (avancado)":

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661443324026/aAAQvk6nn.png align="left")

E adicionar os seguintes valores no campo que aparecer:

- ns1.linode.com
- ns2.linode.com
- ns3.linode.com
- ns4.linode.com
- ns5.linode.com

E salvar:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661443950792/IraAQKxLW.png align="left")

Daí aparecerá uma tela de seguraça pedindo para confirmar as alterações, ela pedirá para entrar o seu token ou pedirá para clicar para que seja enviado um e-mail com a chave de segurança confirmando a operação.

Tal ação fará com que toda vez que alguém quiser entrar no seu domínio, como o GoDaddy já cadastrou o redirecionamento de resolução da requisição, isto fará que tal requisição seja redirecionada para o servidor de resolução do Linode, que é onde a infra estará sendo hosteada, e não o do GoDaddy. Claro que se for procurar subir a solução em outra infra de cloud, os passos até agora serão bem similares, só mudará o name server para outro; que são geralmente similares ao apresentado aqui.

![4034636727_0ec7a995da_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661429710491/GaLou5l4s.jpg align="left")

"[Cash Register](https://www.flickr.com/photos/10710442@N08/4034636727)" by [Steve Snodgrass](https://www.flickr.com/photos/10710442@N08) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Linode

O [Linode](https://www.linode.com/) é conhecido por ser a opção barata e de qualidade de hosteamento quando comparada com [Amazon Web Services (AWS)](https://aws.amazon.com/), [Azure](https://azure.microsoft.com/en-us/), [Google Cloud Plataform (GCP)](https://cloud.google.com/), [Oracle](https://www.oracle.com/cloud/), [Hetzner](https://www.hetzner.com/) e até mesmo a recente [Vultr](https://www.vultr.com/).

Mesmo o Linode oferecendo cupons de disconto que dão um kick-back pra aqueles que o divulgam, a ideia é fazer este texto sem conflito de interesses justamente porque como quem ja teve experiência com as três grandes -- AWS, Azure, GCP -- o Linode entrega:

- **Suporte execelente**: do mesmo nível para melhor em alguns cenários quando comparado aos três grandes, ainda mais por ser gratuito. Caso não tenha experiência com nuvem, muitas vezes você paga pelo serviço e pelo suporte ao serviço dependendo da requisição;
- **Baixa barreira de entrada**: a questão da simplicidade da dashboard deles reduz a dificuldade de se mexer no sistema para iniciantes da solução, fora que ele não ofertam serviços que canabalizam outras soluções ofertadas por eles mesmos;
- **Tempo de mercado**: fundado em 2003, sendo que a AWS em si foi fundada em 2006;
- **Cobrança clara**: produtos sem "venda casadas" não explícitas ou até mesmo com um cenário de caso de borda que faz a conta chegar muitas vezes mais cara no final do mês do que quotado;
- **Atendimento pro-ativo**: eles verificam mudanças a serem feitas na infra e já entram em contato com o cliente para auxiliar no processo de migração;
- **Service Level Agreement (SLA)**: robusto e de baixo downtime;
- etc;

Então se quiser correr atrás de um cupom de disconto atrelado a algum produtor de conteúdo que gostas, por favor, veja isto antes de continuarmos. Do contrário quando se cria uma conta você já ganhará 50 USD (R$ 250) para testes -- *sendo que há uma promoção na hora da escrita deste texto que sobe tal desconto para 100 USD (R$ 500)*  --, o que atende e ainda sobra para este tutorial.

O texto irá focar em ensinar o cenário mais laborioso de se fazer a configuração no Linode, permitindo que se você já utilize outra infra ou queria adaptar para rodar no seu homelab, possa adaptar o apresentado para seu cenário. Esta abordagem também evita vendor lock-in e entrega maior flexiblidade pro usuário.

Fora que o diferencial em si é que nenhuma documentação oficial do provedor mostra como configurar o Rancher com HTTPS e nem documentações de terceiros. Além do fator de como subir as aplicações para utilizar esta recém alocada infra.

![4503154179_1de233fe38_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661392842310/D0fwJL-SD.jpg align="left")

"[Titanic Blueprint](https://www.flickr.com/photos/28121598@N03/4503154179)" by [R~P~M](https://www.flickr.com/photos/28121598@N03) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

## Virtual Machine

**"A vantagem de usar Kubernetes é justamente não ter que se preocupar com o sistema operacional em si!"**

*Já dá para ouvir este argumento griatando e fazendo drift...*

Voltando, a ideia é apresentar o cenário mais laborioso e que permita iniciantes da tecnolgia transaladarem conhecimentos que já possuem. Caso não queria mexer desta maneira, puloe para o apêndice e veja como utilizar a solução pronta de Kubernetes do Linode.

Uma abordagem hands-on é muito mais fácil de ser processada por trabalhar com o que já se é mais """conhecimento básico"""; além de que Kubernetes puro por si só traz a sua própria série de configurações que podem afastar a pessoa que mais se benificiaria dele nao porque *"é difícil"* ou até mesmo *"porque não dá"*, mas sim porque sem se saber o que se quer atingir, fica difícil até de se saber como pesquisar sobre. E se tem uma coisa que Kubernetes tem é um excesso de configurações que podem afastar os nçao iniciados nele.

Uma vez que se mostra que se pode atingir um deploy completo 3min depois de subir a sua infra, esta pessoa verá mais valor na solução. O plano é mais ser um *Hello World* ao invés de ter que se preocupar com a onerosidade de uma """configuração perfeita""".

Fora que a vantagem desta abordagem é facilitar os backups por ser simplesmente backups da Virtual Machine (VM) e a melhor vantagem de todas é ser um ambiente isolado e fácil de se interagir, permitindo que uma vez que você estiver confortável em mexer com o Kubernetes nele -- *e brincar bastante principalmente errando em algumas coisas que procurar copiar da internet e não adaptar elas e quebrar a cara* -- poderá também migrar tudo para o Linode Kubernetes Engine em si. **Uma abordagem não excluí a outra**.

Após criar sua conta e lgoar nela, para criar uma VM basta clicar na barra superior no botão de "Create" e selecionar a opção de Linode, que é como são nomeadas as opções VMs do provedor:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661466494292/TA-IW-jKV.png align="left")

Uma vez nela, iremos selecionar a opção de uma imagem do sistema operacional Ubtuntu 22.04 LTS por ser a versão mais recente Long Term Support (LTS):

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661466693544/9UnPfbeLW.png align="left")

> outras opções de sistema operacional devem funcionar também, o intuito de se utilizar o Ubuntu em si é por ser um ambiente mais familiar para boa parte das pessoas não técnicas

Já na parte de Region, selecionar Fremont, CA (California):

![g3273.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661543851945/2nGn1wTm5.png align="left")

> esta região não foi escolhida arbitrariamente como o sistema operacional, a [latência](https://speedtest.fremont.linode.com/) dela pro Brasil é boa segundo o [speed teste](https://www.linode.com/pt/speed-test/) do próprio Linode, além de que a Caflifórnia tem leis mais rígidas de proteção de dados qaudno comparada aos outros estados norte americanos

Agora entra na parte que vai do que lhe interessa mais fazer com a sua infra, podendo escolher o conjunto que mais lhe convém em si subir sua operação para atender todas as suas necessidades; a parte da escolha do hardware é importante porque por mais que o pode-se subir a oferta dele depois não se dá para reduzir na oferta de VM. Mesmo o Kubernetes tendo um gerenciamento flexivel dos recuros dentro dele, ele ainda vai ser limitado pelo hardware que estiver rodando dentro da VM. Todavia para este tutorial uma opção de 8GB de CPU dedicada mais do que dá conta:

![g3299.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661543872003/yTHOXIvW4.png align="left")

> caso o sistema que vá subir em si sejam várias aplicações de páginas estáticas e/ou com pouco uso, as opções de CPU compartilhada (*Shared CPU*) são muito boas pelo preço; assim como se você for utilizar linguagens como Python e R que não possuem suporte *out of the box* muito bom para multi-cores, utilizar a aba das ofertas em Alta Memoria (*High Memory*) possam lhe atender melhor

Crie um label como algo do tipo "k8s-rancher":

![g4067.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661543890061/4xY35PO41.png align="left")

> tags são marcações caso queria amanhã ou depois subir vários serviços diferentes em VMs e poder marcar elas por algum termo chave em si e não só pleo nome como, por exemplo, "k8s", "database", "storage", etc

Crie agora uma senha forte porque será necessária para acessar o seu Linode depois:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661467480019/B62_AiRWq.png align="left")

Com relacao a SSH Keys nao sera necessário para este tutorial muito menos VLANs, já na opção de Add-ons, será selecionada a opção de IP privado (Private IP):

![g4831.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661543908004/qikq7hlZ4.png align="left")

> caso você vá executar aplicações que salvam dados em disco, é recomendado sim o backup deste linode uma vez que ainda será escrito sobre uma solução que removeria necessidade disto

Uma vez clicado no botão para criar o recurso, terá que esperar alguns segundos até o status de *provisioning* mudar para *running*:

![g4375.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661468073699/F-sdbQXf_.png align="left")

Agora basta copiar o comando de SSH para acessar no terminal da sua máquina o linode que foi criado agora:

![g6116.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661469009996/3_u1ABmT0.png align="left")

> o IP deste linode foi "escondido" mais em si para que as pessoas não tentem copiar ele igual para colocar na configurações deles... Vá por mim, já tive amigo que copiou até meu nome na hora de entregar o trabalho dele no Ensino Médio

Depois digitar no seu terminal e selecionar `yes` quando aparecer a conexão e, além disso, digitar a senha que foi criada no começo da alocação deste linode; uma vez finalizado, você deverá ver algo similar ao seguinte:

```shell
$ ssh root@XXX.XXX.XXX.XXX
The authenticity of host 'XXX.XXX.XXX.XXX (XXX.XXX.XXX.XXX)' can't be established.
ED25519 key fingerprint is SHA256:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'XXX.XXX.XXX.XXX' (ED25519) to the list of known hosts.
root@XXX.XXX.XXX.XXX's password:
Welcome to Ubuntu 22.04.1 LTS (GNU/Linux 5.15.0-43-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Aug 25 11:10:40 PM UTC 2022

  System load:           0.0
  Usage of /:            1.5% of 156.92GB
  Memory usage:          2%
  Swap usage:            0%
  Processes:             120
  Users logged in:       0
  IPv4 address for eth0: XXX.XXX.XXX.XXX
  IPv4 address for eth0: XXX.XXX.XXX.XXX
  IPv6 address for eth0: XXXX:XXXX::XXXX:XXXX:XXXX:XXXX

The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@localhost:~#
```

Caso não entenda de ssh ou como utilizar ele, tem um texto que foi escrito anteriormente aqui que pode lhe ajudar:

- [SSH através do navegador](https://fazenda.hashnode.dev/ssh-atraves-do-navegador)

Mas, de maneira simples, é uma maneira de se fazer acesso remoto a uma máquina por terminal; sistemas operacionais baseados em LInux e o Mac já vem com ela por padrão, já no Windows você poderá dar uma olhada no [PuTTY](https://www.putty.org/) para utilizar como ferramenta de acesso.

Uma vez com o seu linode alocado, você acaba de dar o passo mais "complicado" e trabalhoso deste tutorial na parte de infraestrutura. Considerando que o domínio só se registra uma vez, e a quandtidade de linodes vai depender da sua necessidade em si, daqui pra frente são passos mais fáceis de serem reproduzidos, que escalam com facilidade e com baixissimo custo. 

![8398480873_b3b390c501_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661388167208/EBF_HyQxA.jpg align="left")

"[Nièvre - Bourgogne - Matrioskas , sous la neige les poupées Russes !](https://www.flickr.com/photos/55307203@N04/8398480873)" by [serguei_30](https://www.flickr.com/photos/55307203@N04) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

### Firewall

**Este passo só é necessário porque resolvemos criar um linode e não utilizar a oferta de Kubernetestes própria da Linode.**

Com a criação do linode finalizada, se pulasse este passo e fosse direto para o cadastro do domínio em si você já conseguiria ter algo similar ao uma infra para poder subir seu próprio kubernetes. Todavia não conseguiria configurar a parte de TLS/SSL, fazendo com que sua aplicação ficasse com um cadeadinho vermelho indefinidamente porque o provedor do certificado, neste caso o Let's Encrypt,  não conseguiria acessar a sua máquina e prover os certificados necessários.

Isto porque o tráfego é bloqueado por padrao pelo Linode na porta de rede necessária com relação a comunicação de entrada. Então será necessário a criação de uma regra no Firewall do Linode para que não fique com este impeditivo. E caso algum dia tenha algum problema em outro cenário para conseguir o certificado de segurança, procure olhar se a porta na VM e/ou no firewall está liberada.

Para a criação da regra basta clicar na opção de Firewalls e clique em criar um novo:

![g6450.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661471607946/YpwMqF_3H.png align="left")

Dê um nome do tipo "TLS_SSL_rule", pesquise o linode do k8s-rancher que criamos para atrelar à ele esta configuração e depois clique em criar o firewall:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661471877879/WyY-2pSEg.png align="left")

Uma vez na tela da regra do firewall, iremos criar a regra de entrada de tráfego -- uma vez que o [cert-manager](https://cert-manager.io/) irá precisar capturar o que for enviado nela:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661618566911/-QLB4CfAs.png align="left")

Depois só selecionar o preset de HTTPS, que configura a porta 443 necessária para a tarefa, e criar a regra:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661784724211/Cg3VIIbP2.png align="left")

Uma vez tudo configurado, basta clicar na opção de salvar as modificações:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661472322135/YRGXq70lv.png align="left")

Caso amanhã ou depois queira entender mais sobre quais regras pode selecionar para fazer dadas modificações, é sempre bom olhar a documentacao do Linode. Porque provavelmente terá o mesmo problema se subir um banco de dados ou outros serviços que precisam capturar um tráfego enviado para uma porta em expecífica; este é o problema similar a expor um serviço localmente para outros consumirem uma demo na sua máquina na rede da empresa e não ter as permissões do sistema e/ou até mesmo expor o tráfego para um colega acessar sua demo da casa dele sem ter configurado o firewall que tem no seu modem para tal. Caso você tenha algum console antigo talvez já teve que ter feito configuração de rede para poder acessar os sistemas onlines deles por causa da questão de portas que o serviço precisa acessar no console para poder autenticar a conexão.

![2533576388_ca0e9a41cd_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661471168861/M6Dzo8oWN.jpg align="left")

"[Great Wall, China](https://www.flickr.com/photos/21202408@N07/2533576388)" by [d.i.](https://www.flickr.com/photos/21202408@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## Domínios

Uma vez com o IP do linode iremos atrelar ele ao sistema de domínios da Linode -- passo que complementa o que foi configurado no GoDaddy para redirecionar o tráfego para o Linode -- atrelando o domínio que foi contratado à este linode que foi criado:

![g6044.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661468695431/HkhTE1j7h.png align="left")

Agora basta abrir a aba de domínios (Domains) e selecionar a opção de criar um novo:

![g5154.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661518957273/LpI68pXEl.png align="left")

Na janela nova será colocado o domínio adquirido junto ao e-mail atrelado à ele:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661518773204/QCmuBt8sn.png align="left")

Uma vez com registro do domínio feito no Linode, será necessário agora criar um registro do tipo A/AAAA com ele:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661470111072/OAD9ccBtf.png align="left")

> Este tipo de registro tem a ver com o IPv4 e o IPv6, caso algum outro dia tenha que mexer com registros de e-mails e outros protocolos atrelados a este domínio, será nesta janela que o fará mas com os outros tipos de registros em si

Na caixa de opções que aprecer coloque `*` como hostname -- o que serve de um wildcard pra dar match em qualquer sub-domínio e no principalm em si --, junto com o IP do seu linode e o Time To Live (TTL) de cinco minutos:

![g6432.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661470336068/yJAGmc8l7.png align="left")

> O TTL de 5min foi colocado apenas por um exemplo recomendado em tutorial do Linode, sinceramente não sei o benefício prático dele ficar tão baixo

O que acontece agora uma vez que alguém digitar `seu.dominio` no navegador:

1. O GoDaddy atrelou o `seu.dominio` no nameserver do Linode;
2. O Linode com o GoDaddy cruzaram as informações para ver se o registro era válido;
3. Uma vez que alguém procurar o registro do domínio, será redirecionado para o namaserver do Linode;
4. O Linode irá cruzar o domínio ao IP atrelado a ele;
5. O Linode irá redirecionar o tráfego ao IP que alocou para recebê-lo;

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661784931071/H3_A-5yzZ.png align="left")

Todavia ainda não foi alocado o Kubernetes e não temos nenhum serviço rodando nele ainda, então de nada adiantaria liberar o link para alguém acessar algo.

Todas as etapas de configuração do Linode em si já foram feitas, daqui pra frente você não precisará mexer no painel dele mais.

![3030218590_bd233cd129_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661471023437/cI0Y3bhPR.jpg align="left")

"[papyrus](https://www.flickr.com/photos/57639875@N00/3030218590)" by [sukisuki](https://www.flickr.com/photos/57639875@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

# K3s

Assim como citado no texto [Kubernetes -- um boteco na Av Paulista
](https://fazenda.hashnode.dev/kubernetes-um-boteco-na-av-paulista), o Kubernetes (K8s) em si não é um "produto" mas sim um padrão que alguns provedores oferecem como produto a sua implementação, o é um deles [K3s](https://github.com/k3s-io/k3s).

Uma vez com a conexão de SSH ainda aberta com o seu linode, rode o seguinte comando para poder instalar nele o K3s:

```shell
curl -sfL https://get.k3s.io | \
  INSTALL_K3S_VERSION=v1.24.4+k3s1 sh -s - server \
  --write-kubeconfig-mode 644
```

Logo após isto terminar, uma mensagem similar deverá ser impressa no seu terminal:

```shell
[INFO]  Using v1.24.4+k3s1 as release
[INFO]  Downloading hash https://github.com/k3s-io/k3s/releases/download/v1.24.4+k3s1/sha256sum-amd64.txt
[INFO]  Downloading binary https://github.com/k3s-io/k3s/releases/download/v1.24.4+k3s1/k3s
[INFO]  Verifying binary download
[INFO]  Installing k3s to /usr/local/bin/k3s
[INFO]  Skipping installation of SELinux RPM
[INFO]  Creating /usr/local/bin/kubectl symlink to k3s
[INFO]  Creating /usr/local/bin/crictl symlink to k3s
[INFO]  Creating /usr/local/bin/ctr symlink to k3s
[INFO]  Creating killall script /usr/local/bin/k3s-killall.sh
[INFO]  Creating uninstall script /usr/local/bin/k3s-uninstall.sh
[INFO]  env: Creating environment file /etc/systemd/system/k3s.service.env
[INFO]  systemd: Creating service file /etc/systemd/system/k3s.service
[INFO]  systemd: Enabling k3s unit
Created symlink /etc/systemd/system/multi-user.target.wants/k3s.service → /etc/systemd/system/k3s.service.
[INFO]  systemd: Starting k3s
```

O que significa que tudo foi instalado direitinho e está funcioando como o esperado.

Agora copie o conteúdo do seu `k3s.yml` para poder mandar comandos através do kubectl de maneira segura pro seu cluster k8s:

```shell
cat /etc/rancher/k3s/k3s.yaml
```

Este comando irá imprimir no terminal o conteúdo do seu arquivo, algo do tipo:

```shell
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    server: https://127.0.0.1:6443
  name: default
contexts:
- context:
    cluster: default
    user: default
  name: default
current-context: default
kind: Config
preferences: {}
users:
- name: default
  user:
    client-certificate-data: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    client-key-data: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Copie o ele e crie um arquivo chamado `kubeconfig.yml` salvando em algum diretório que lhe for conveniente, depois poderá fechar a conexão com um simples comando `exit` no terminal. Agora será necessário editar este arquivo, na parte:

```yaml
...
    server: https://127.0.0.1:6443
...
```

Mude o IP de `127.0.0.1` -- *o famoso localhost* -- para o IP do seu linode em si, aquele `XXX.XXX.XXX.XXX` que foi gerado quando ele foi alocado:

```yaml
...
    server: https://XXX.XXX.XXX.XXX:6443
...
```

> como a configuração original era feita para o usuário mandar comandos "localmente" -- através do SSH neste caso ou até mesmo com acesso físico à máquina -- por isso que tinha o IP do localhost, como iremos mandar comando da nossa máquina para o cluster em si, temos que expecificar o IP dela justamente para não apontar para a nossa maquina em si, onde não há nenhum cluster kubernetes rodando nela

Uma vez feito isso, caso ainda não tenha instalado o [kubectl](https://kubernetes.io/docs/tasks/tools/), o poderá fazer com os seguintes comando -- caso esteja no Linux:

```shell
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
kubectl version --client
``` 

E caso tudo ocorra bem e/ou ja tenha instalado antes ele, basta agora rodar:

```shell
kubectl get nodes
```

Todavia este comando irá falhar:

```shell
Unable to connect to the server: EOF
```

Isto porque o arquivo `kubeconfig.yml` precisa ser salvo em uma pasta expecífica no sistema, geralmente na pasta do seu usuário. Caso esteja no Linux, para colocar o arquivo na pasta certa basta:

```shell
mkdir ${HOME}/.kube/
nano ${HOME}/.kube/config
```

> se for usuário Windows, veja como fazer isto lendo a documentação necessári [aqui](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#:~:text=By%20default%2C%20kubectl%20configuration%20is,kube%2Fconfig%20.)

E colar o conteúdo do seu `kubeconfig.yml` no editor que abrir no terminal, clicando Ctrl + s para salvar e Ctrl + x para sair. E rodar de novo o comando para ver o resultado do status do seu cluster no terminal:

```
$ kubectl get nodes        
NAME        STATUS   ROLES                  AGE   VERSION
localhost   Ready    control-plane,master   19m   v1.24.4+k3s1
```

Pronto, isto significa que conseguimos acessar o cluster direto da nossa máquina com sucesso sem se preocupar com login ou senha, apenas com este arquivo que faz toda a parte de autenticação e autorização de acesso ao cluster. Por isso se for desenvolvedor nunca commite este arquivo, seria como vazar as informações de acesso à um banco de dados se caíssem em mãos de terceiros.

Muitos tutoriais parariam aqui e sem mostrar a etapa de configuração do firewall, todavia ainda iremos configurar o Rancher para facilitar um pouco o acesso e visibilidade do cluster.

![910731417_54c3d83971_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661393198774/LtOUbOmnQ.jpg align="left")

"[Bicycle Frames in the Paint Shop](https://www.flickr.com/photos/42524897@N00/910731417)" by [tofugalaxy](https://www.flickr.com/photos/42524897@N00) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=openverse).

# Rancher

O primeiro texto publicado neste site foi sobre o [Rancher](https://rancher.com/): [Configurando Rancher em um ARM](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm); e desde então todos os textos que mostram como rodar algo self-hosted na pegada de homelab também utilizaram ele. Mas agora esta é a primeira vez que será falado sobre como utilizar ele na nuvem e considerando as alterações de versão que ocorreram nos últimos anos.

Com a próxima sequência passos será configurada a trindade deste tutorial:

- Rancher
- Traefik
- Let's Encrypt

Para dar deploy do Rancher no cluster que criou, basta no seu terminal rodar os seguintes comandos -- lembrando de antes substituri o `${YOUR_DNS_HERE}` pelo e-mail que utilizou para criar seu domínio e o `${YOUR_EMAIL_HERE}` pelo DNS que seu rancher em si estara rodando, neste caso sera o `rancher.seu.dominio`, sendo o `seu.dominio` o domínio que registrou:

```shell
kubectl create namespace cattle-system
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=${YOUR_DNS_HERE} \
  --set bootstrapPassword=admin \
  --set ingress.tls.source=letsEncrypt \
  --set letsEncrypt.email=${YOUR_EMAIL_HERE} \
  --set letsEncrypt.ingress.class=traefik
kubectl -n cattle-system rollout status deploy/rancher
``` 

> caso decida remover a opção de `--set bootstrapPassword=admin`, precisará rodar o seguinte comando para poder pegar a senha que será necessariá para configurar o rancher no próximo passo: `kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{ .data.bootstrapPassword|base64decode}}{{ "\n" }}'`

Agora só aguardar uns instantes -- *se tiver algum café que colocou para fazer recomendo ir pegar outro copo dele* --, caso tudo ocorra bem deverá ver a seguinte mensagem no seu terminal:

```shell
...
Happy Containering!
Waiting for deployment "rancher" rollout to finish: 0 of 3 updated replicas are available...
Waiting for deployment spec update to be observed...
Waiting for deployment "rancher" rollout to finish: 0 of 3 updated replicas are available...
Waiting for deployment "rancher" rollout to finish: 1 of 3 updated replicas are available...
Waiting for deployment "rancher" rollout to finish: 2 of 3 updated replicas are available...
deployment "rancher" successfully rolled out
```

Agora basta acessar o site `https://rancher.seu.dominio/` para ter uma tela igual a seguinte:

![g3015.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661546994498/aqx_urR4u.png align="left")

> caso tenha algum problema em conseguir o certificado -- *o cadeado ficar verde* --, procure refazer os passos na sua cabeça ate agora. Caso tenha feito tudo direitinho, espere uma hora e tente reiniciar seu servidor no painel do Linode, porque só podera pedir um novo certificado novo periodo de uma hora. Caso tenha errado algo, procure refazer os passos do erro até aqui

Agora digite a senha inicial de `admin` no campo de Bootstrap Password -- *ou a sua que tenha modificado ou a que o rancher gerou para ti automaticamente* --, depois selcione se irá utilizar a senha que foi gerada automaticamente ou se irá criar uma você mesmo e, por último, concorde com os termos de uso da aplicação. Lembrando que esta configuração é para o usuário admin do sistema.

Logo em seguida será recebido com a seguinte dashboard:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661475062364/xZX46LYh6.png align="left")

**Pela primeira vez aqui temos o Rancher em nuvem e rodando com HTTPS.**

É recomendado criar os usuários para não ficar utilizando o admin do sistema em si. Para tal basta clicar no menu hamburger do painel lateral esquerdo e selecione a opção de Users & Authentication:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661475307888/aieFQyeB3.png align="left")

> sim, na imagem anterior fica díficil de ver que tem a opção porque utilizo um plug-in de dark theme por padrão, o Rancher tem Dark Theme mode e pode ser conifigurado

Agora clique no botão de criar um novo usuário:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661475363854/JT-ZTLy8Y.png align="left")

Nesta tela de um nome pro seu usuário, crie a sua senha e de as sequintes permissões para ele:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661475617924/_Zn_djsst.png align="left")

Agora basta deslogar e logar de novo com seu novo usuário. Uma vez logado, clique no seu cluster local para poder ver os status dele:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661475786033/FaQrPtv4P.png align="left")

Você deverá ser apresentado com uma tela similar a seguinte:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661475820238/3xXbtweMQ.png align="left")

Como o Rancher por si so permite um altíssimo nível de configurações, opções de deploy e outras ferramentas para métricas, por ora hoje só será isto que será configurado na dashboard dele; alguns exemplos já publicados neste site podem ser aplicados para ser deployados aqui assim como outros serão exemplificados mais para frente.

**Pronto, sua infra já foi configurada!**

*Agora só falta publicar algumas aplicações nela...*

![6219637824_d3673e3068_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661393048309/yabQlfZyl.jpg align="left")

"[Splash Mountain Barn](https://www.flickr.com/photos/40708728@N04/6219637824)" by [Justin in SD](https://www.flickr.com/photos/40708728@N04) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

# RSMD

O [RSMD](https://github.com/Fazendaaa/RSMD/) é uma aplicação que é muito utilizada para tutoriais aqui como:

- [Análise de dados + Site + Banco de Dados? Tudo no isso seu PC e sem precisar instalar o R, Shiny e o Mongo](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo)
- [Site de análise de dados... Mas na verdade é um app no Android, Windows, Mac e no seu iPhone](https://fazenda.hashnode.dev/site-de-analise-de-dados-mas-na-verdade-e-um-app-no-android-windows-mac-e-no-seu-iphone)

E será utilizada novamente para ser publicada na infra que acabamos de subir. Para tal basta clonar o repositório:

```shell
git clone https://github.com/Fazendaaa/RSMD/
cd RSMD
```

Abrir o `k8s.rancher.yml` e modificar todas as vezes que aparecem `rsmd.fazenda.solutions` para `rsmd.seu.dominio` -- sendo logicamente o `seu.domonio` o domínio que registrou.

Depois rodar:

```shell
kubectl apply -f k8s.rancher.yml
```

Caso tiver com o painel ro Rancher aberto, poderá ver a aplicação em Workload:

![g5746.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661787216790/krt0sJkjW.png align="left")

Caso clique nos três pontos, poder acessar o log da aplição:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661786483743/KYQpWv4dN.png align="left")

E ver que ela esta executando:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661786528055/4NoAoLQWF.png align="left")

Para ver se o registro de domínio da sua aplicação foi feito com sucesso basta abrir Service Discovery:

![g5754.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661787227687/6b6ImJJW_.png align="left")

Agora basta acessar `https://rsmd.seu.dominio/` para ver o deploy feito:

![g18918.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661621007383/m38tNkEw2.png align="left")

E como está rodando no mesmo K3s que subimos anteriormente, na prática ambas as requisições dos registros feitos serão tratadas assim:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661705762461/9pVupy7Kp.png align="left")

Caso queria olhar este exemplo rodando: https://rsmd.fazenda.solutions/

E esta finalizado o setup de ponta a ponta, desde:

1. Registrar um domínio;
2. Subir a infra necessária para ele;
3. Configurar um ambiente pronto integrar várias aplicações e manter elas;
4. Dar deploy de uma aplicação;

E no caso do RSMD em si, por ele ser um [Progressive Web App (PWA)](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps), um dos requisitos é que ele tenha conexão por HTTPS para poder ser "instalável" no sistema do cliente. Asssim como mostrado aqui:

![rsmd](https://media2.giphy.com/media/vUMEUT1qu0ofWq3Ztg/giphy.gif?cid=790b7611057597c14ffca468b07dbf3c840e8990cb4f837c&rid=giphy.gif&ct=g align="center")

E este "aplicativo site" pode ser publicado na Play Sotre, Microsoft Store e virar um applicativo em iOS também.

![13905987989_e0f86b33e8_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661394060696/QzEr8EBEu.jpg align="left")

"[Large lecture college classes](https://www.flickr.com/photos/12836528@N00/13905987989)" by [kevin dooley](https://www.flickr.com/photos/12836528@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Buckle Up

Para voltar ao exemplo dado na introdução deste texto, agora que já possuí tem sua infra elaborada, poderá subir os seguintes exemplos dos textos aqui escritos e rodar eles:

- ['Nova Aba' universal, em qualquer aparelho e navegador](https://fazenda.hashnode.dev/nova-aba-universal-em-qualquer-aparelho-e-navegador) > [heimdall.rancher.yml](https://gist.github.com/Fazendaaa/431daaf587fe37cc5f7a7bfc80dd3f72)
- [Tire o pó dos filmes parados, eles serão sua nova Netflix... E 33 vezes mais barato!](https://fazenda.hashnode.dev/tire-o-po-dos-filmes-parados-eles-serao-sua-nova-netflix-e-33-vezes-mais-barato) > [streama.rancher.yml](https://gist.github.com/Fazendaaa/dd51c8bf567650e28ab037b0240265e4)
- [Streaming de Retro Games... DE GRAÇA e em dois passos](https://fazenda.hashnode.dev/streaming-de-retro-games-de-graca-e-em-dois-passos) > [retroarch.rancher.yml](https://gist.github.com/Fazendaaa/06c7ff5625433543c382e4a19030f405)

Basta baixar os respectivos arquivos `*.rancher.yml` em uma pasta, abrir eles, editar a parte que estiver `seu.dominio` para colocar o domínio que registrou. Depois com o terminal aberto, nesta mesma pasta, publicar eles com:

```yaml
kubectl apply -f nomeDoArquivoAqui.rancher.yml
```

> lembrando de subistituir 'nomeDoArquivoAqui' por: heimdall, streama e retroarch; fazer isto uma de cada vez

Heimdall:

![g6303.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661858611439/hq4zZLlMt.png align="left")

Streama:

![g6312.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661858622164/oxfz9lgAx.png align="left")

RetroArch:

![g6319.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661858631473/HTVzYHfsm.png align="left")

Lembrando que mesmo com cada novo deploy, as aplicações ficarão isoladas umas das outras no seu cluster:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661720581749/a2PxS4KM8.png align="left")

E caso queira atualizar elas direamente do painel do Rancher, basta abrir a desejada no painel de Workloads, clicar no botão de editar a config:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661792162163/eh8nt2Afg.png align="left")

Clicar na aba de container e lá poderá atualizar o deploy para uma nova versão quando ela se tornar diponível e só salvar:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661792340070/zSHbzEiQa.png align="left")

Visto que pode adaptar esses arquivos para subir vários serviços que existem encapsulados e prontos para você consumir na interet, a sua imaginação e necessidades são o limite. Sem contar que se estiver pronto para um desafio, poderá você mesmo subir um serviço que até então não tinha sido containerizado para poder consumir depois como mostra o texto: [CDs parados = seu próprio Spotify de graça](https://fazenda.hashnode.dev/cds-parados-seu-proprio-spotify-de-graca). Texto este que mostra como se configurar um banco de dados no Rancher para ser utilizado para uso no K8s, sem precisar utilizar um arquivo de deploy.

Caso a ideia seja subir aplicações que sejam realmente utilizáveis em um ambiente profissional, duas que são recomendadas são as que os seguintes textos cobrem:

- [Nuvem de terceiros quando você pode ter a sua própria em casa com o clique de um botão?](https://fazenda.hashnode.dev/nuvem-de-terceiros-quando-voce-pode-ter-a-sua-propria-em-casa-com-o-clique-de-um-botao)
- [Chega de Jira](https://fazenda.hashnode.dev/chega-de-jira)

Segundo que a primeira mostra como subir uma aplicação similar a uma suit como Google Drive ou o Office 365 e a segunda a uma alternativa ao [Jira](https://www.atlassian.com/software/jira).

Fora que os custos operacionais daqui pra frente só caem toda vez que subir um sistema novo. E vale ressaltar que tudo isto de maneria gratuita, sendo que no GoDaddy estava exposto na home page o custo do SSL era de 200 reais ao ano; imagine ter que multiplicar isso pelo número de aplicações que utilizasse... **SÓ** pelo SSL.

![10231951383_d6a4431aa4_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661714953668/L-Ucs_6aE.jpg align="left")

"[New York Comic Con 2013 - Saturday](https://www.flickr.com/photos/89154305@N00/10231951383)" by [EagleEyez](https://www.flickr.com/photos/89154305@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=openverse).

# Em suma

A ideia nunca foi cobrir "tudo" nexte texto porque se tornaria um livro, mas muitos dos assuntos apenas tocados podem ser alcancados com facilidade se der uma olhada no Apendice e nas referências aqui apresentadas.

Fora que não se iluda, a solução em si apresentada não se trata algo "production ready" porque tanto o Rancher quanto o Kubernetes em si não estão em High Availability (HA), o que dificultaria com percalços que aparecessem em um ambiente de muito tráfego. Todavia o processo básico foi exposto e não é difícil configurar para alta disponibilidade ambos uma vez que há alguns tutorais sobre este ponto que são muito bons na internet. O que foi apresentado hoje, para uso pessoal, familiar ou até mesmo de uma pequena empresa, o sistema dá conta; o problema é esperar que isto aguente alguns milhares de usuários em todos os sistemas ao mesmo tempo.

Este texto ficou grande porque era necessário explicar de uma maneira concisa e coesa todas as partes dessa integração para justamente se sustentar por si só e não deixar nenhuma ponta solta que pudesse dar problemas amanhã ou depois, além de se centralizar tudo em um só artigo para já poder entregar algo funcional no final dele. Do contrário, separar este texto em várias publicações não entregaria diferença significativa para quem o seguisse porque seriam etapas soltas que não constroem um conhecimento agregado por si só.

A vantagem da segmentação apresenta é justamente evitar um vendor lock-in e poder dar a flexbilidade de mudança de provedor para manter custo baixo; o que foi aqui apresentado facilmente se aplica em outros provedores.

A ideia será automatizar este processo em completo se possivel um dia -- o que atualmente não é --, compartilhando todas atualizações atraves do repositório [LETLKRGD](https://github.com/Fazendaaa/LETLKRGD/) e cricando um StackScript pro Linode pra facilitar o deploy pros usuários da infra.

Caso queira entender como fazer um container, é recomendado ler [este](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo) texto, uma vez que esta etapa não foi tratada agora mas sim previamente. Agora com relação a como otimizar uma distribuição de um sistema em K8s, isto sera abordado mais para frente.

Caso esteja um pouco perdido, recomendo e muito estes episódios do pocastas da Lambda3 sobre [microsserviços](https://www.lambda3.com.br/2019/08/podcasts-sobre-microsservicos/) e dar uma olhada no documentário [Kubernetes: The Documentary](https://youtu.be/sVP8xb9BrhM) para entender as origens do projeto e qual problema em si o K8s procura resolver. E caso seja uma das pessoas que ficara "orfã" uma vez que o [Heroku irá remover produtos gratuitos](https://news.ycombinator.com/item?id=32594533), talvez de uma chance para o apresentado.

**E não se esqueça de remover os recursos que criou no Linode neste ttorial para não consumir todo o credito que tem neles e acabar por debitar no seu cartão ou ficar com uma fatura em aberto.**

![2371430944_16939a74b9_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661393948718/y3WfdXTFt.jpg align="left")

"[Bank Safe](https://www.flickr.com/photos/47016060@N00/2371430944)" by [Gmonkey](https://www.flickr.com/photos/47016060@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

# Apêndice

Este apendice é recomendado apenas para profissionais da área de computação, isto porque os pontos básicos ja foram apresentados no texto e o cenário apresentado aqui agora tem mais a ver com quem terá que ter um olhar mais abrangente pra tecnologia apresentada. Mas caso tenha gostasdo do que foi apresentado ate agora, algumas recomendações de fontes de informações que possam auxiliar a ver o quão grande este mundo é em si:

- [Bret Fisher Docker and DevOps](https://www.youtube.com/c/BretFisherDockerandDevOps)
- [Techno Tim](https://www.youtube.com/c/TechnoTimLive)
- [Seytonic](https://www.youtube.com/c/Seytonic)
- [Lawrence Systems](https://www.youtube.com/user/TheTecknowledge)
- [Level1Techs](https://www.youtube.com/c/Level1Techs)
- [ByteByteGo](https://www.youtube.com/c/ByteByteGo)
- [ServeTheHome](https://www.youtube.com/c/ServeTheHomeVideo)
- [The Digital Life](https://www.youtube.com/c/TheDigitalLifeTech)

E o texto de hoje auxilia a que você possa derivar como vários termos novos nasceram, como:

- [DevSecOps](https://www.redhat.com/en/topics/devops/what-is-devsecops)
- [MLOps](https://blog.nvidia.com.br/2020/09/08/o-que-e-mlops/)
- [DataOps](https://en.wikipedia.org/wiki/DataOps)
- *E algum outro termo para vender curso que termina com Ops...*

Por mais que seja um texto bem simples, foram horas e horas de experiência, pesquisa, prática e frustrações para poder combinar tudo isso. Fora que muitos dos textos utilizados para referência até chegar este ponto mostram as solucoes de maneira isolada, sendo que isso dificulta para um iniciante ter a perspectiva de que tal cenário apresentado é plausível e que possível.

Dito isto, este apêndice porvavelmente vai levar mais tempo pra ser processado do que o texto em si e ele por si só poderia ser um texto a parte. Todavia é importante construir e derivar em cima do apresentado para não ser uma leitura "insuficiente" para aqueles que conhecem um pouco mais da área.

E caso queria ler algo que vai de contra ao que foi apresentado aqui, há o seguinte index de textos chamado [When microservices fail](https://docs.google.com/spreadsheets/d/1vjnjAII_8TZBv2XhFHra7kEQzQpOHSZpFIWDjynYYf0/edit#gid=0). Fora o texto já publicado aqui: [O Inferno de Dante do Cloud Native](https://fazenda.hashnode.dev/o-inferno-de-dante-do-cloud-native)

![3005650135_f3fabbe642_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661430066308/X4YmebChW.jpg align="left")

"[pencil and eraser on paper](https://www.flickr.com/photos/59077136@N00/3005650135)" by [shawncampbell](https://www.flickr.com/photos/59077136@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## Origem

Este texto hoje em dia é dado muito gracas ao curso que fiz do [Jonathan Baraldi](https://twitter.com/BaraldiJonathan). O curso dele excepcionalmente bom e altamente recomendado ser seguido principalmente por cobrir muitos conceitos na parte de AWS, caso vá subir uma infra voltada para este provedor.

Uma das diferenças do curso pro que será apresentado aqui no apêndice é a inversão de responsabilidade entre o `Ingress` e `IngressRoute`; sendo que o primeiro é o conceito básico do K8s e o segundo uma representação do Traefik. No caso de se seguir pela primeira rota talvez fique mais limitado uma vez que na mudança de versões do K8s a sua configuração de deploy talvez quebre -- *como aconteceu quando o LKE foi da 1.21 pra 1.23 que será elaborada em [K3s](#K3s)* --, já na segunda ficaria mais elaborado mudar do Traefik para outro provedor.

![3204692832_35540b3455_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661433066707/uot3hyzV0.jpg align="left")

"[Greyhound Racing](https://www.flickr.com/photos/50247722@N00/3204692832)" by [Mamboman1](https://www.flickr.com/photos/50247722@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

## Perspectivas

Uma das vantagens da utilização de K8s é justamente poder ter uma segmentação de aplicações sem precisar segmentar o ambiente. Dado o exemplo que foi apresentado no texto, se pode ter facilmente uma aplicacao rodando como `https://hom.rsmd.seu.dominimo/` que seja feita com dependências diferentes das presentes em `https://rsmd.seu.dominimo/`; isto porque o ambiente próprio segmenta as aplicações para que uma não sabia que outra existe.

O que não foi apresentado no texto em si mas será comentado mais pra frente no apêndice, é a questão de que um cluster K8s é formado por um conjunto de nodes. Sendo que cadá node representa um ambiente em si, seja ele físico ou virtualizado.

Ou seja, isso permitiria que voce tivesse três VMs com capacidades diferentes, por exemplo:

- **Demo**: um Nanonode de 1GB por 5 USD ao mes;
- **Homologacao**: um Linode de 2GB por 10 USD ao mes;
- **Producao**: um Dedicated de 4GB por 30 USD ao mes;

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661702940616/jxn-Dvjww.png align="left")

Ou seja, com 45 USD ao mês -- em torno de 230 reais ao mês --, daria para subir algumas aplicações simples e ter todo o ciclo de vida delas com ambientes que atendessem a necessidade de maneira clara. Fora que você sempre pode também limitar a aplicação em si para ela consumir apenas aquilo que lhe for atribuido e não tudo disponível.

Fora que se quiser subir ao invés de três nodes diferentes mas sim três clusters diferentes para garantir uma alta disponiblidade, vocÊ poderia fazer e segmentação simliar a apresentada, lhe permitindo entregar maior robustez.

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661703912441/Do4y4sa2p.png align="left")

Lemrando que mesmo no exemplo dado no texto com um cluster K8s com um node, é possivel replicar a mesma aplicação para que a carga seja distribuida entre suas instâncias. Apresentando uma solução assim:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661719589012/0jKuneS22.png align="left")

Há textos que ainda serão publicados que elaboraram alguns pontos não comentados aqui mas que não necessariamente precisarão de conhecimento aqui exposto, mas sim leituras suplementares de como aplicar e fazer ajustes finos para tais cenários e o porquê deles.

Com a versao 1.25 do K8s [anunciada](https://youtu.be/lCkRDMFqg0U) esses dias, pode ter certeza que a vantagem do que foi apresentado aqui é utilizar tal metodologia para subir um ambiente com um cluster rodando a versão nova para testar enquanto os outros ainda se encontra na versa atual, a 1.24.

![29473088427_7bd87f512e_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661393770921/aPHEQpUYl.jpg align="left")

"[Naryn River, Kyrgyzstan](https://www.flickr.com/photos/37583176@N00/29473088427)" by [Ninara](https://www.flickr.com/photos/37583176@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## Domínios

Como conmentado no texto, o importante é comentar sobre o Freenom que é citado no curso do [DevOps Ninja](https://www.udemy.com/course/devops-mao-na-massa-docker-kubernetes-rancher/) como teve um "escandalo" divulgado no [Hacker News](https://news.ycombinator.com/item?id=27951785); basicamente o serviço tem um comportamento bem esporádico, além de não ofercer uma boa operação por si só quando funciona, levando muitos a questionar a validade de ser gratuito sendo que suas dores de cabeça por si só são inpeditivos maiores que tudo.

Duas opções que me foram recomendadas como alternativas ao GoDaddy foram o [Google Dominios](domains.google.com/) e o [Porkbun](http://porkbun.com), mesmo nunca tendo utilizado eles, outros profissionais os recomendaram. Todavia não é possivel traçar um paralelo dos prós/contras com a solução aqui apresentada.

Mesmo sendo brasileiro e o [Registro.br](https://registro.br/) ser um nome que todo mundo conhece e lembra nessas horas quando o assunto é domínio, é altamente desaconselhado utilizar ele. O sistema é instável para salvar alterações, de baixa integração, complicado para compartilhar acesso e, pelo menos quando utilizei, não tinha como enforcar 2FA para alterações. O que não passa confiança ainda mais quando o serviço as vezes é consideravelmente mais caro que as soluções aqui apresentadas.

![60425703_41dd01c16f_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661433543715/RHiCLv0x_.jpg align="left")

"[Trash](https://www.flickr.com/photos/29792164@N00/60425703)" by [dmireault](https://www.flickr.com/photos/29792164@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

## HTTPS?

Na opção apresentada no texto o sistema está disponível em ambas as manerias de acesso, seja com `http` ou `https`; todavia na próxima maneira de configurar o K8s será mostrado que você pode escolher como vai querer subir o sistema, se só em uma das duas ou nas duas manerias. Por mais que possa ser contra-intuitivo de se subir um sistema com `http` em pleno 2022, há alguns cenários que isso faz total sentido ao invés de se manter uma oferta baseada em `https` apenas.

Alguns cenários de exemplo para se deixar o acesso por HTTP disponível:

- **Caso você tenha um site de página estática como um blog**: terá vantagem do cacheamento em firewalls isto facilita os usuários que acessem muito o conteúdo a sempre pregarem do cache, reduzindo o overhead pro servidor, podendo desenvolver uma infra bem simples e que dará conta;
- **Evita o uso de Content Delivery Network (CDN)**: pelo ponto anterior você acaba reduzindo a necessidade de apontar o seu conteúdo em si primeiro para uma CDN para facilitar a distribuição geográfica dele. VocÊ ainda pode usar uma CDN, mas ela irá repousar sobre o seu conteúdo e não ao contrário, como seria com HTTPS; 
- **Acessibilidade**: facilidade de acesso em aparelhos antigos, isto portque padrões muitos restritos de HTTPS não funcionam mais em alguns celulares de alguns pares de anos atrás;
- etc;

Claro que isso é para aplicações náo críticas, caso tenha uma aplição mais séria você pode configurar os headers de redirecionamento de HTTP para HTTPS ou até mesmo não permitir o acesso por HTTP.

![7437021478_d6db3e40d3_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661434215859/gZJaVxqzQ.jpg align="left")

"[Light On Power Off](https://www.flickr.com/photos/28160971@N03/7437021478)" by [Nick Bianco](https://www.flickr.com/photos/28160971@N03) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

### Por que utilizar *.app?

Em um primeiro momento, soluções com `*.com`, `*.com.br`, `*.net`, etc, não parecem ter diferenças em si; isso porque no caso do `*.br` em especial a solução não precisa nem estar rodando em um servidor localizado fisicamente no Brasil, ele pode estar rodando nos EUA, por exemplo; tudo isso leva a acreditar que as terminações do domínios não possuem nenhum tipo de restrição. Mas algumas terminações tem diferenças técnicas e elas valem a pena darem uma olhada, uma delas sendo o `*.app`.

Criado pelo Google, o `*.app` eh um padrão de domínio que entrega um grande nível de segurança pro usuário uma vez que não se podem ter conexões por HTTP nele, ou seja, ele só permite HTTPS. O que faz sentido uma vez que um blog ou qualquer outro site que fosse uma página estática seria estranho ter tal terminação; ela induz ao usuário pensar que terá um [WebApp](https://en.wikipedia.org/wiki/Web_application) ou até mesmo um [Single-Page Application (SPA)](https://en.wikipedia.org/wiki/Single-page_application), evitando que o ele seja exposto a tentativas de ataques por intermediários para coletarem suas informações como um [HTTP Strict Transport Security (HSTS)](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security) por exemplo.

A vantagem da abordagem hoje apresentada é que ela não exclui o que eh apresentado aqui, vai ser elaborado mais em um próximo tópico aqui, mas você poderia muito bem ter um `http://blog.seu.dominio` e um `http://rsmd.seu.dominio.app`, apontado pro mesmo cluster K8s criado; evitando que tivesse uma redundância de infra só para poder subir isoladamente aplicacões de acordo ao uso delas:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661861165435/UfPnYD6EZ.png align="left")

Isto porque a regra é que um registro de domínio tem que estar atrelado a um ou mais IPs, mas nada diz que eles tem que ser exclusivos dle. Pense no IP como um CPF, ele é único seu como indivíduo, mas você é conhecido pelo seu nome, como seus colegas de trabalho te chamam, como seus amigos de colégio chamam pelo apelido de quase 20 anos e etc. Nada impede um IP em si de ter mais de um domínio atrelado à ele.

![2165112419_0db5334d76_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661431105080/0KDxjqbL0.jpg align="left")

"[Immigration.](https://www.flickr.com/photos/38543156@N00/2165112419)" by [nromagna](https://www.flickr.com/photos/38543156@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## Linode Kubernetes Engine

Agora, para dar um passo além, e mostrar como configurar o Linode Kubernetes Engine (LKE) para ser gerenciado no painel do Rancher.

Para tal basta selecionar a opção de Kubernetes do Linode e nela criar um novo Cluster:

![g5194.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661520072971/oPcKm4Net.png align="left")

De o nome de "k8s-applications", selecionadno Fremont de novo e a versao 1.23 do motor:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661520146688/qt_8DOjr2.png align="left")

Como para subir o K3s pegamos uma CPU dedicada, desta vez iremos pegar uma compartilhada e do linode de 4GB para mostrar um outro cenário apenas:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661796860833/Rf6c1Vpvf.png align="left")

> com o LKE ele já atribui um número minimo de três instâncias por padrão, você pode colocar menos ou mais do que isto, mas sempre é recomendado utilizar numeros ímpares para poder se ter quorum

Como se trata de um tutorial o High Availabity não será necessario, então basta criar cluster:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661796971645/ljClCO4P1.png align="left")

No painel que abrir, espere que os status das suas máquinas fiquem como "running":

![g403.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661797183995/EKphyRNNk.png align="left")

Agora, copie os IPs das suas máquinas, neste exemplo são os `XXX.XXX.XXX.XXX`, `YYY.YYY.YYY.YYY` e `ZZZ.ZZZ.ZZZ.ZZZ` para serem adicionados ao painel de domínios do Linode assim como mostrado na configuracao do linode criado anteriormente para o seu `seu.dominio`.

Crie de novo um registro do tipo A/AAAA. Na caixa de opções que aprecer, coloque `*` como hostname para podermos redirecionar todos os subdomínios a serem alocados pelo Traefik mais pra frente nesta máquina em si, junto com o IP do seu linode e o TTL de cinco minutos:

![g6432.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661470336068/yJAGmc8l7.png align="left")

Agora repita o mesmo passo para os IPs do `YYY.YYY.YYY.YYY` e `ZZZ.ZZZ.ZZZ.ZZZ`.

Agora de volta no painel do LKE criado, clique no botão de vizualizar o `kubeconfig.yaml`:

![g438.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661797297245/1ty9K6iug.png align="left")

Copie o conteudo dele:

![g17210.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661526131830/6nD_b-ZaG.png align="left")

Com o conteúdo que foi aberto copiado, sobrescreva o que voce tinha do K3s criado com ele da seguinte maneira caso esteja no Linux:

```shell
mv ${HOME}/.kube/config ${HOME}/.kube/config.old
rm ${HOME}/.kube/config
nano ${HOME}/.kube/config
```

Agora cole o conteúdo que copiou do painel do LKE, não se preocupe que a configuração do K3s foi copiada e renomeada como `config.old` para quando precisar dela. Agora rode o seguinte comando:

```shell
kubectl get nodes
```

Para ter certeza que o seu cluster LKE foi registrado, algo similar a seguinte deve aparecer:

```shell
NAME                           STATUS   ROLES    AGE   VERSION
lke70105-108509-6308ca19cf77   Ready    <none>   43m   v1.23.6
lke70105-108509-6308ca19f611   Ready    <none>   43m   v1.23.6
lke70105-108509-6308ca1a1d97   Ready    <none>   41m   v1.23.6
```

Agora você nao precisará mais mexer no painel do LKE do Linode. Mas iremos registrar este cluster no Rancher para ele poder gerenciar e endereçar as aplicações rodando nele.

![3813555772_59239de599_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661672414633/870wZxXBE.jpg align="left")

"[Great Wolf Lodge Water Park](https://www.flickr.com/photos/61963330@N00/3813555772)" by [CliffMuller](https://www.flickr.com/photos/61963330@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

### Rancher

Para tal abra novamente o seu paneil do Rancher na home page e clique na opção de importar um cluster:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661524092168/7c0Hu0Gq0.png align="left")

Selecione a opçãoo de genérico:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661524134471/vsJYjpbu9.png align="left")

Nomei-o como "k8s-application" e clique em criar:

![g9574.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661524224630/6PwUG5BL_.png align="left")

Na tela que aparecer, copie o primeiro comando exemplificado:

![g15015.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661524638928/hbMSaT2Kv.png align="left")

> caso voce nao tenha feito a configuração de HTTPS do Rancher funcionar ou ate mesmo estiver usando por IP mesmo, rode o segundo comando

Com o comando copiado, o rode no seu terminal:

```shell
kubectl apply -f https://rancher.seu.dominio/v3/import/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxx.yaml 
```

Você deverá ver uma mensagem como a seguinte:

```shell
clusterrole.rbac.authorization.k8s.io/proxy-clusterrole-kubeapiserver created
clusterrolebinding.rbac.authorization.k8s.io/proxy-role-binding-kubernetes-master created
namespace/cattle-system created
serviceaccount/cattle created
clusterrolebinding.rbac.authorization.k8s.io/cattle-admin-binding created
secret/cattle-credentials-5c451df created
clusterrole.rbac.authorization.k8s.io/cattle-admin created
Warning: spec.template.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms[0].matchExpressions[0].key: beta.kubernetes.io/os is deprecated since v1.14; use "kubernetes.io/os" instead
deployment.apps/cattle-cluster-agent created
service/cattle-cluster-agent created
```
> não se preocupe com warnings caso eles apareçam. Não sé desta vez mas assim com o tempo de uso verá que são muitas peças em movimento e sempre terá alguma mensagem de warning caso uma ferramenta esteja uma versão na frente da outra ou vice-versa; se for fazer este tutorial daqui dois meses provavelmente seja que não warnings ou que sejam completamente diferentes

Uma vez configurado, você deverá ver uma tela similar a esta:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661524994267/qXEiIvl8g.png align="left")

O que significa que foram registradas as três máquinas que configuramos no LKE; para poder ver a dashboard dela, basta clicar no menu lateral esquerdo e selecionar o cluster "k8s-application":

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661525181117/AdkzWL83s.png align="left")

E deverá ver uma tela similar ao do cluster que registramos anteriormente com o K3s.

Uma vez que foi decidido que este cluster sera o responsável pelas aplicações que serão executadas, poderiamos subir ja aplicações nele assim como mostrado em tutoriais aqui escritos como:

- [Minecraft + Docker + Kubernetes = Servidor de jogos na sua casa](https://fazenda.hashnode.dev/minecraft-docker-kubernetes-servidor-de-jogos-na-sua-casa)
- [Tenha seu próprio smart mirror](https://fazenda.hashnode.dev/tenha-seu-proprio-smart-mirror)
- [Carregar uma biblioteca onde for? E escrever um livro?](https://fazenda.hashnode.dev/carregar-uma-biblioteca-onde-for-e-escrever-um-livro)

Todavia a conexão não seria criptografada, não teria um DNS atrelado a ela, muito menos seria distribuída; você teria que utilizar IPs e portas para tal. Para ter algo como do tipo:

- `https://minecraft.seu.dominio/`
- `https://calendar.seu.dominio/`
- `https://library.seu.dominio/`

O próximo passo será necessário, que é onde configuramos o Traefik.

![2601582256_d81ea425ce_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661520729050/jDqVON1zf.jpg align="left")

"[Start your engine](https://www.flickr.com/photos/15505023@N02/2601582256)" by [pobre.ch](https://www.flickr.com/photos/15505023@N02) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

### Traefik

Se você acompanha as publicações aqui feitas, o [Traefik](https://traefik.io/) não é um termo novo para ti:

- [HTTPS para desenvolvimento local](https://fazenda.hashnode.dev/https-para-desenvolvimento-local)
- [Traefik + Rancher => Homelab Upgrade](https://fazenda.hashnode.dev/traefik-rancher-greater-homelab-upgrade)

Todavia para os novatos, o Traefik eh o responsável pelo tráfego de rede, ele é uma ferramenta similar ao NGINX caso conheça ela.

Mas você pode estar também se perguntando o porquê de aparecer ele de novo neste texto, ele já foi passado como opção na ora de configurar o Rancher com K3s. O Traefik agora será configuardo em um outro cluster, o cluster do LKE  que será configurado é o que será necessário para dar deploy das aplicações neste cluster depois em outros clusters. Por isto tenha em mente que as configurações a serem feitas agora serão no cluster do LKE que criamos no passo anterior; assim como as configurações que foram feitas no K3s são expecíficas dele, o enderecamento de configurações nos clusters é único.

Para garantir que estamos apontado para o cluster certo, rode o seguinte comando de novo:

```shell
kubectl get nodes
```

Algo similar deve aparecer:

```shell
NAME                           STATUS   ROLES    AGE   VERSION
lke70105-108509-6308ca19cf77   Ready    <none>   94m   v1.23.6
lke70105-108509-6308ca19f611   Ready    <none>   94m   v1.23.6
lke70105-108509-6308ca1a1d97   Ready    <none>   92m   v1.23.6
```

Para instalar o Traefik dentro do cluster basta rodar os seguintes comandos:

```shell
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v2.8/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v2.8/docs/content/reference/dynamic-configuration/kubernetes-crd-rbac.yml
```

Caso vários warnings aparecam, basta rodar os comandos de novo para ver que estar tudo configurado como esperado:

```shell
customresourcedefinition.apiextensions.k8s.io/ingressroutes.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/ingressroutetcps.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/ingressrouteudps.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/middlewares.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/middlewaretcps.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/serverstransports.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/tlsoptions.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/tlsstores.traefik.containo.us configured
customresourcedefinition.apiextensions.k8s.io/traefikservices.traefik.containo.us configured
clusterrole.rbac.authorization.k8s.io/traefik-ingress-controller unchanged
clusterrolebinding.rbac.authorization.k8s.io/traefik-ingress-controller unchanged
```

Agora abra seu terminal e digite:

```shell
nano traefik.yml
```

E no editor que aparecer copie o seguinte conteúdo:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: traefik
spec:
  ports:
    - protocol: TCP
      name: web
      port: 80
    - protocol: TCP
      name: admin
      port: 8080
    - protocol: TCP
      name: websecure
      port: 443
  selector:
    app: traefik

---
apiVersion: v1
kind: ServiceAccount
metadata:
  namespace: default
  name: traefik-ingress-controller

---
kind: Deployment
apiVersion: apps/v1
metadata:
  namespace: default
  name: traefik
  labels:
    app: traefik
spec:
  replicas: 1
  selector:
    matchLabels:
      app: traefik
  template:
    metadata:
      labels:
        app: traefik
    spec:
      serviceAccountName: traefik-ingress-controller
      containers:
      - name: traefik
        image: traefik:v2.8
        args:
        - --entrypoints.web.Address=:80
        - --entrypoints.websecure.Address=:443

        - --providers.kubernetescrd

        # Let's Encrypt Configurtion.
        - --certificatesresolvers.default.acme.tlschallenge
        - --certificatesresolvers.default.acme.email=<YOUR_EMAIL_HERE>
        - --certificatesresolvers.default.acme.storage=acme.json

        - --accesslog=true
        - --log=true
        - --metrics=true
        - --metrics.prometheus=true

        ports:
        - name: web
          containerPort: 80
          hostPort: 80
        - name: websecure
          containerPort: 443
          hostPort: 443
        - name: admin
          containerPort: 8080
          hostPort: 8080
        securityContext:
          capabilities:
            drop:
            - ALL
            add:
            - NET_BIND_SERVICE

---
apiVersion: traefik.containo.us/v1alpha1
kind: TLSOption
metadata:
  name: default
  namespace: default

spec:
  maxVersion: VersionTLS13

---
apiVersion: traefik.containo.us/v1alpha1
kind: TLSOption
metadata:
  name: maxtls12
  namespace: default

spec:
  maxVersion: VersionTLS12
```

Lembrando de modificar de novo o valor de `<YOUR_EMAIL_HERE>` aqui para o e-mail que utilizou para registrar seu domínio, ele que sera utilizado pelo Let's Encrypt. Depois basta salvar e sair do arquivo.

Agora execute o seguinte comando:

```shell
kubectl apply -f traefik.yml
```

Ele irá aplicar o Traefik no seu cluster como mostra o output dele:

```shell
service/traefik created
serviceaccount/traefik-ingress-controller created
deployment.apps/traefik created
```

Caso ainda esteja com o Rancher aberto e apontando para o cluster do LKE, poderá ver que o recurso do Traefik foi alocado no seu cluster:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661799743667/Mxi3ocYBe.png align="left")

Agora toda requisição do tipo `https://exemplo.seu.dominio/` irá seguir os seguintes passos:

1. O navegador faz a requisição do domínio;
2. O nameserver do Linode ira distribuir a requisição para os IPs atrelados ao domínio;
3. O Traefik irá verificar se existe algum registro igual ao solicitado;
4. Uma vez encontrado o registro esperado o Traefik ira direcionar pra um dos nodes do cluster;
5. A requisição será tratada;

Pronto, a partir de agora você esta com o Traefik instalado e poderá fazer no próximo passo um deploys da maneira exemplificada no passo anteiror. Há um deploy de exemplo para tal configuração no projeto do RSMD.

Basta abrir o arquivo `k8s.lke.yml`, editar a seguinte linha:

```yaml
...
  - match: Host(`lke.rsmd.fazenda.solutions`)
...
```

Para -- substituindo `seu.dominio` pelo dominio que adquiriu:

```yaml
...
  - match: Host(`lke.rsmd.seu.dominio`)
...
```

E deployar com:

```shell
kubectl apply -f k8s.lke.yml
```

Uma vez que terminar o deploy poderá abrir a sua aplicação rodando no link `https://lke.rsmd.seu.dominio/` que, neste caso, só esta disponível por HTTPS mesmo.

A arquitetura da solução atualmente apresentada em conjunto com a já elaborada no texto fica assim: 

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661705189971/8hdFL0Z4w.png align="left")

E com isso você terá a possiblidade de subir todas aplicações para ter uma resiliência de distribuição de acessos ao sistema desta maneria. Lembrando que diferentemente do apresentado no texto, desta maneira não precisariamos passar o tráfego pelas configrações feitas pelo Rancher uma vez que esta configuracao do Traefik foi feita por nós mesmo, então o deploy é diferente do que foi anteriormente no texto. Isto permite que este tipo de abordagem seja independentemente do Rancher, podendo que se suba até a mesma aplicação sem se linkar este cluster ao painel do Rancher em si. Vale ressaltar isto para ficar claro que cada cluster precisaria, nesta abordagem, do seu próprio reverse proxy para tratar as requisições uma vez que elas **não** passam pelo K3s para serem redirecionadas.

Isso facilita princpalmente porque como Rancher em si não foi alocado em HA, se ele ou o K3s círem, isto não irá gerar indisponibilidade as aplicações que estão no ar pelo LKE.

Fora que como comentado anteriormente, você pode fazer as configurações necessárias no deploy e depois acabar suportando no cluster outra instância do Traefik para poder, desta maneira, endereçar à este cluster outro domínio completamente diferente.

![29115453676_d7846e286b_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661393463932/IroTYXzmY.jpg align="left")

"[HAY-QUEUE](https://www.flickr.com/photos/8340348@N07/29115453676)" by [johnb/Derbys/UK](https://www.flickr.com/photos/8340348@N07) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

### 100% LKE

Como pode ter visto, subir uma solução com LKE é mais prático, requer menos configurações e já tem a parte de HA direto na dashboard como opcional. Há um valor intrínseco agregado na oferta do serviço, sendo que tudo isso para uma operação comercial trás retorno por não precisar de uma equipe altamente treinanda nem um time grande para gerenciar o exemplo dado com VMs, Firewall e K3s. O custo que poderia ser economizado procurando gerir tudo no braço não vale a pena porque deixar aberta a empresa para ter que refazer um SLA e não poder utilizar o do provedor do serviço em si.

Caso tivessemos seguido o passo de subir o Rancher com o LKE e selecionando o HA, já teríamos uma infra pronta para produção, isto porque ela teria como distribuir o acesso entre os nodes, além de garantir a estabilidade da aplicação caso um dos nodes ficasse fora do ar. Ou seja, com o que foi visto aqui no apêndice você já consegue combinar o conhecimento adquirido e agregar uma solução capaz de atender as necessidades de muitas empresas. Fora outro detalhe que é um ponto forte do LKE, mesmo se tivesse alocado um cluster LKE e subido o Rancher nele sem ter selecionado o HA, bastaria clicar no botão de de upgrade para HA no painel do LKE depois para que o próprio sistema se reiniciasse e configurasse a infra para disponibilizar tal garantia, permitindo que ajude a com o tempo que se eleve a solução para a necessidade que lhe atende melhor, sem custo e percas de tempo desnecessárias.

Além de tudo isso, outros fatores importantes de se considerar o LKE ao invés da solução VM + Firewall + K3s são:

- **Configuração de rede**: já preparada de maneira correta para se utilizar o K8s sem precisar mexer no firewall ou até mesmo se preocupar com outras configurações não detalhadas aqui;
- **Suporte**: a própria Linode lhe ofereceria o suporte do LKE enquanto no caso do K3s você teria que correr atrás do suporte da Rancher -- *sim, são eles os responsáveis pelo sistema* --, além de ter que se preocupar com manter o sistema operacional, fazendo patches de segurança, análise de uso, até mesmo um suporte para validação de ambiente e certificação de seguranca, suporte do provedor de sistema operacional, etc;
- **Alta disponibilidade**: não precisar se preocupar com o status dos nodes do cluster, sua distribuição e replicação;
- **Disponibilidade de integração**: o LKE possui drivers pro Rancher, que são maneiras de alocar novos clusters direto do painel do Rancher, aumentando mais ainda a comodidade de seu uso. Caso queria saber mais sobre, clique [aqui](https://www.linode.com/blog/kubernetes/linode-kubernetes-engine-cluster-driver-rancher/);
- **Elasticidade de hardware**: isto sem downtime da da aplicação como um todo, o que evita riscos de precisar suportar uma cagar esporádica de uso e derrubar o sistema por um todo ou ter que sair correndo para se alocar VMs que serão pontualmente utilizadas e podem ser esqeucidas de serem removidas;
- **Piloto automático**: similar ao ponto anterior, só que no ponto anterior o hardware era alocado sendo supervisionado, no LKE há uma opção dele analisar o tráfego e subir e/ou derrubar a necessidade de uma infra mais parruda de maneira totalmente não supervisionada;
- etc;

O LKE, sem sombra de dúvidas, entrega mais retorno que uma solução na qual o usúario terá que manter mais peças da operação sem necessariamente ter a mesma segurança, estabilidade e suporte que uma oferta feita para aquilo. Ainda mais no caso de empresas que contratam terceiros para subir e supervisionar a infra deles mesmo em um cloud provider, o LKE é a melhor maeira de um consultor apresentar resultados para o cliente dele sem precisar que ele mantenha uma operação muito onerosa e/ou que tenha que pedir para o cliente contratar um funcionário ou até mesmo outro terceiro para poder supervisionar o sistema de VM + K3s + Firewall. O que faz até o profissional mais Übermensch retornar a máxima de: *"custo não se reduz, só se transfere... E custo transferido sem a agregação de valor é o grito da eloquência da burrice".*

![201715020_84ca29cad6_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661433723315/_EYxo16-Z.jpg align="left")

"[Boxing ourselves in?](https://www.flickr.com/photos/79729522@N00/201715020)" by [Bohman](https://www.flickr.com/photos/79729522@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

### Futuro do Linode?

Em [Fevereiro de 2022](https://www.linode.com/blog/linode/linode-and-akamai/) foi anunciado que o Linode, que até então era a maior cloud provider independente, seria adquirido pela [Akamai](https://www.akamai.com/), que se trata de uma empresa de CDN. Atuando em edge-computing a empresa tem "um pézinho" já dentro de muitas infra-estruturas de clientes, atuando principalmente com hardwares praticamente feito para atender uma soluções específica, com sistemas feitos para os grandes players.

Com a aquisição do Linode, a Akamai poderá fazer o que a Microsoft fez praticamente, de migrar clientes que já a utilizam durante anos suas soluções in-house para a nuvem; mas isso não quer dizer que eles irão competir diretamente, muito menos isso significa dizer que, por exclusão,  a Akamai irá competir com a Amazon, que procura agora entrar cada vez mais em edge-computing para poder converter clientes para a AWS. O "principal" competidor da Akamai + Linode seria a Oracle por ter o legado da Sun e já ter empresas geralmente mais voltadas para o ramo de tecnologia do que de atuação mais geral no mercado como os clientes da Microsoft e da Amazon.

Como a Akamai atuava em outra área completamente diferente, isso torna dois players com soluções complementares juntando forças, o que axuliaria clientes atuais do Linode que queiram comecar a penetrar em edge-computing sem precisar recorer para soluções quase que *"Do It Yourself (DIY)s"* ou até mesmo nos competidores. 

Caso trabalhe em um empresa grande, com um player a mais no mercado isso vai acabar colocando pressão nos outros competidores para poder manterem seus clientes e não os perderem para a nova pareria, assim como essa nova parceira trará a oferta de novos serviços que abrangerão uma pletora de mais de oportunidades. 

![6807602571_1c9e482be1_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661710480304/jH8gCKeBM.jpg align="left")

"[Crystal Ball](https://www.flickr.com/photos/54771619@N05/6807602571)" by [UnnarYmir](https://www.flickr.com/photos/54771619@N05) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## VMs

*VMs e K3s não são inerentemente bons ou ruins, tudo depende de como são utilizados, se a maneira é a mais inteligente ou não dado os recursos e a utilização deles para atingir o resultado esperado.*

Este disclaimer é necessário para alinhar que depois do vai e volta deste texto apresentar diversas combinacões para voltar no ponto inicial; isto faz parecer mais um rodeio de ideias do que um planejamento estratégico por natureza. Todavia, VMs foram apresentadas no texto como a forma mais "simples" de alguém entender o que estava sendo feito e mostrando o que tem por trás da necessidade de se subir um cluster K8s.

Agora, há cenários que a utilização de VMs para rodar o cluster fazem sentido:

- **Segurança da informação**: ter controle a nível de kernel para garantir que as aplicações rodando neles serão isoladas de tentativas de ataques por atores que residam ou tenha acesso ao bare metal e/ou ao supervisor de virtualização;
- **Buscar alternativas**: se familiarizar com outro provedor de K8s, o que facilitará caso decida realmente aplicar multi-cloud e/ou sair do seu provedor atual;
- **Utilização de infra atual**: Se soluções como VMWare já são utilizadas, dificilmente um hardware bare-metal estaria disponível para ser alocar um cluster K8s;
- **Desenvolvimento K8s**: *não o desenvolvimento de containers em si*. Caso estiver desenvolvendo uma solução para K8s ou para ele em si, virtualizar várias instâncias para poder comunicar entre elas e ate testar cenários diferentes é a maneira mais prudente para tal do que desinstalar um OS toda vez para ter um ambiente limpo ou até buscar escalar precisando de mais bare-metal;
- **Treinamento de pessoal**: assim como o pontuado em alguns trechos do texto durante seu percorrer, há times não familiarizados com a tecnologia de contaienrs, permitir um espaço didático que particularmente muito ludico de aprendizado, acelerá a migração da estrutura legado para a nova;
- etc;

Assim como o bare-metal não desapareceu depois que as VMs apareceram e geraram flexibilidade para se desenvolver aplicações, elas também não irão desaparecer agora que existem os containers, pensar de maneira contrária seria um suicídio mental. Containers surgiram para resolver problemas de aplicações enquanto VMs surgiram para resolver problemas de virtualização de hardware; muitas soluções eram distribuidas com VMs porque, até então, não existiam soluções baseadas em containers.

Rodar uma aplicação em VM que não precisa dela pe como ter um carro apenas para dirigir duas quadras: da casa para o serviço e vice-versa. A ferramenta atinge o objetivo mas de maneira sub-ótima, quando andar ou até mesmo uma bike poderiam entregar o mesmo resultado. Containers irão ser, neste exemplo, a bike para quem esta dirigindo para fazer um trajeto curto; porém ainda há pessoas que precisam de carro para ir pro trabalho porque carregam com elas o equipamento de serviço e, além disso, muitas vezes a área de atuação é do outro lado da cidade.

![14180081488_31f64dc837_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661431313872/zKDIsExrO.jpg align="left")

"[Kelly Ramsey Building Construction](https://www.flickr.com/photos/24311648@N00/14180081488)" by [mastermaq](https://www.flickr.com/photos/24311648@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

## K3s

Assim como pontuado anteriormente, o K3s é uma das soluções do Rancher Labs além do Rancher apenas. Uma das suas principais vantagens na competição de provedores de K8s é a flexbilidade e as otimizações para rodar em edge-computing. O K3s é mais uma solução de uma empresa com tradição em desenvolvimento para soluções voltadas para a Cloud Native que que busca ser aberta em tudo o que faz, trazendo credibilidade e facilitando a penetração de mercado.

Além da praticidade de se criar um cluster K3s -- *literalmente uma linha de comando só* --, ele também apresenta outros pontos fortes: 

- **Controle do ambiente**: fallback caso precise fazer um upgrade de versão e seus deploys quebrem, você poderá voltar para uma versão estavel;
- **Testar uma nova versão**: testar releases candidates;
- **Suporte para as mais diversas arquiteturas**: suportando desde um x86 até ARM;
- **Edge computing**: ter um sistema rodando no [SOHO](https://en.wikipedia.org/wiki/Small_office/home_office), com aplicabilidade de expor APIs localmente ou através de uma Virtual Private Network (VPN) mas gerenciando a gestão delas;
- etc;

O primeiro ponto é algo que a experiência foi prática: quando o Linode atualizou o LKE da versão 1.21 para 1.23 de maneira automática, as aplicações rodando nele ficaram indisponíveis porque algumas das diretrivas foram descontinuadas entre versões; fazendo com que se não fosse a trativa de subir o K3s na versao 1.21 em uma VM para trazer a operação de volta ao ar, o downtime seria maior do que procurar redeployar tudo na nova versão. Mas um disclaimer importante é que a Linode avisou através de vários e-mails durante meses que iriam fazer isto, foi uma falta de planejamento para se adaptar que culminou neste cenário caótico.

Já a pluaridade de arquiteturas faz com que muitas soluções de borda permitam que até sistemas embarcados com potência suficiente possam para rodar um cluster K3s, facilitando o controle e acesso a informação que neles é produzida.

![4012739993_081f0fac05_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661729537967/Td0SuzvZS.jpg align="left")

"[Burlington Chicago Pocket Watch](https://www.flickr.com/photos/26354629@N02/4012739993)" by [alexkerhead](https://www.flickr.com/photos/26354629@N02) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## Rancher Labs

O Rancher além de ser uma solução comôda e prática, também é robusto, conseguindo escalar com praticidade para endereçar vários clusters. Há quase dois anos foi feita uma demo pro lancamento da versão 2.5 no gerenciaram 1 milhão de clusters. 

A Rancher Labs, empresa responsável pelo desenvolvimento da solução, foi adquirida pela [Suse](https://www.suse.com/) em Dezembro de 2020. Nesta hora duas empresas com DNA completamente diferentes se uniram, uma sendo o fornecedor de sistema operacional baseado em Linux mais antigo em operação e a outra uma das mais novas ferramentas de Cloud Native no mercado. Com essa injeção de know how e capital, os clientes de um terão suporte e acesso a consultoria de outra além de que a carteira de clientes será compartilha.

Similar a junção de Akamai e Linode, Movimentos assim mostram que a indústria de tecnologia está se verticalizando cada vez mais.

Diferentemente do que foi mostrado aqui, do cluster que já vem com a instalação dele ou o LKE que foi linkado depois, há como criar clusters pelos mais diversos provedores atraves do Rancher. Para ver mais sobre das opções, clique em Criar na home page:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661795790738/I12qnZ4EG.png align="left")

E como poderá ver, vários provedores aparecem, isso já reduziria a necessidade de fazer o processo mostrado aqui para ter o mesmo resultado:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661795908866/DWBvt-Bu7.png align="left")

> lembrando que configurações inicais de acesso do Rancher ao painel de cada uma das provedoreas será necessário para depois só se utilizar o painel dele para alocar recursos

Ou seja, dessa maneria você poderá ter uma oferta de multi-cloud em suas mãos. Além disso:

- **Segurança**:
  - Delegar acesso baseado no usuário;
  - Procurar sugerir sempre a melor maneira de se manter uma operção;
- **Flexbilidade**:
  - Trabalhar com o melhor que o mercado tem a oferecer;
  - Endereçar quase todas as opoes possíveis sem restrições;
- **Observabilidade**:
  - Poder visualizar métricas da operação direto em uma dashboard;
  - Integração com ferramentas de supervisão para poder delegar a monitoria do sistema para automatizar ela;
- **Estabilidade**:
  - Não precisar compartilhar e gerenciar arquivos `kubeconfig.yml` na sua máquina
  - Gerenciar processos repetitivos e que podem quebar a operação;
- etc;

Além do Rancher e do K3s, a empresa ainda oferece outros produtos:

- [K3d](https://k3d.io/): que eh uma versão do K3s em contaienr, o que facilita para desenvolvimento e testes locais na máquina de desenvolvimento por exemplo;
- [Rancher OS](https://rancher.com/docs/os/v1.x/en/): sistema operacional com a camada necessária apenas para se rodar um cluster K8s;
- [Longhorn](https://longhorn.io/): sistema de armazenamento de dados em K8s;
- [RKE](https://rancher.com/docs/rke/latest/en/installation/): versão mais completa que o K3s de um cluster K8s;

O Rancher se posiciona no meracdo de software como uma empresa de "logística" de aplicações, porque não importa qual etapa de distribuição de sfotware ou se até mesmo a cadeia toda irá utilziar ferramentas deles, o core da empresa é estar presente e ativa no desenvolvimento independentemente da etapa. Visão esta que vai longe ao ponto de doar algumas das soluções desenvolvidas para a Cloud Native Fundation a fim de separar a questão do conflito de procurar vender uma solução propria mas sim deixar a solução livre para se tornar padrão de mercado e oferecer suporte baseado nele.

Devido a essa integração e controle, no futuro terá um texto aqui publicado que basicamente lhe mostrara *"how to become your own serverless provider -- with extra steps"*.

![33023773581_4771986875_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661673100777/-HSQNUcui.jpg align="left")

"[SpaceX Water Deluge Test at Pad 39A](https://www.flickr.com/photos/108488366@N07/33023773581)" by [NASAKennedy](https://www.flickr.com/photos/108488366@N07) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

## Edge computing

O termo edge computing foi citado repetidas vezes durante este texto mas principalemte no apêndice mas não foi elaborado o que possa ser. De maneira resumida, o termo representa qualquer tipo de computação feito por servidores que ficam entre uma empresa e a internet pública, mas fisicamente presentes no local de operação desta mesma empresa.

Há vantagens para tal tipo de decisão de arquitetura:

- **Redução de custos**: sendo um dos maiores custos operacionais a transferência de informações para processamento, seja em questão de  preço e até mesmo de tempo;
- **Segurança**: porque não vai expor diretamente as aplicaçõos desnecessariamente na rede pública;
- **Economia**: uma vez com os outros dois pontos em dia, a possibilidade de se executar tarefas não criticas em uma infra de edge já alocada reduz o custo operacional de subir ela na nuvem sem um benefício claro para a operação;
- etc;

Com o cenário apresentado aqui o Rancher poderia ser utilizado para gerenciar um cluster K8s que roda na infra da empresa, gerenciando um banco de dados e uma API que expoem os dados para um outro cluster rodando na nuvem que possui uma dashboard para poder mostrar as informações das análises feitas por uma API de terceiro sendo que a dashboard em si foi desenvolvida por um quarto.

E com edge-computing e multi-cloud, empreasas como a Racnher Labs terão penetração de mercado nos grandes players porque eles vão tratar direto com o cliente procurando atender a da melhor maneira a necessidade que ele tem, se se preocupar em vender um produto em si ou até mesmo querer dar um vendor lock-in. Quando o incentivo é claro, consultorias conseguem atender melhor os seus clientes, diferentemente de empresas de nuvem que o interesse é entregar os produtos deles e não suportar o que o cliente precise caso isto saía muito do que eles ofertam.

![35835069773_ce7ed4d2da_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661672956470/RzBlAFyrF.jpg align="left")

"[Live on stage](https://www.flickr.com/photos/12389974@N06/35835069773)" by [PelGren](https://www.flickr.com/photos/12389974@N06) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=openverse).

## Let's Encrypt

Voltando ao ponto de como funciona uma tradução de um domínio em um IP, na micro visão pode ser que uma requisição de resolução de um domínio que seja feita, o name server que geralmente pode tratar tal requisição seja o da sua provedora de internet; não existe um só nameserver na internet, existem vários para poder reduzir a latencia da requisição e poder atender a tradução para o usuário no menor tempo possível. E caso esta tadução seja interceptada e modificada no meio do caminho, a requisição pode apontar para outro IP completamente diferente: 

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661783034062/PmOPJCMjl.png align="left")

O Let's Encrypt (LE) é uma dessas entidades que confirmam que o domínio e o IP estão atrealados, servidno de terceiro que tem o interesse em certificar a segurança para o usuário. Basicamente o processo é o seguinte:

1. Rodase-se um agente no servidor para ele falar com o emissor de certificados e provar que aquele servidor com aquele IP está pedindo um certificado em nome do portador do domínio;
2. O LE identifica o pedido e cria uma chave de comunicação com o servidor;
3. O servidor passa pro LE o tipo de desafio que irá realizar com aquela chave para que o LE consiga assegurar que esta tudo direitinho quando for validar o servidor;
4. Uma vez confirmado o desafio, o LE procura realizar ele e validando com a chave que foi gerado no passo 1;
5. Desafio realizado, é gerado um certificado pro servidor;
6. Servidor armazena este certificado;

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1661782444104/5HphuG7OF.png align="left")

E a importância disso tudo é que para quando um usuário for se conectar ao servidor por HTTPS este certificado é validado cruzado com a entidade que emitiu para se ter certeza que aquele IP é quem realmente diz quem é, para eque então o usuário possa criar uma conexão segura com o site; este vídeo [aqui](https://youtu.be/67kItGjvRs0) auxília com essa parte de enteder o processo.

O passo 3 é o motivo de ter sido feita a configuração de firewall liberando acesso a porta 443 no servidor, para que o LE conseguisse enviar uma requsição pro agente rodando no K3s validar o desafio uma vez que HTTPS é trafegado por padrão pela porta 443 enquanto HTTP é trafegado por padrão na porta 80. Apesar de o processo ser o mesmo nos exemplos explicados neste tutorial, a diferença entre eles é a seguinte:

- No caso do K3s + Rancher, é o cert-manager responsável pela emissão do certificado e da renovação dele, mesmo o Traefik sendo o reverse-proxy;
- No caso do LKE, o Traefik é o responsável pelo gerenciamento do certificado além de ser o reverse-proxy; 

O LE não é a única entidade que gera certificados, como próprio texto comenta previamente o GoDaddy tem a opção de gerar certificados por 200 reais e algumas cloud providers tem opções de 10 vezes este preço.

Outra vantagem que o LE oferta é a geração de maneira automática, os agentes que geram o certeifcado inicial neste processo feito pelo K8s os procuram renovar quando necessário. Isto porque todo certificado quando gerado tem um período de expiração que é determinado quando criado, no LE os certificados duram três meses e os agentes procuram renovar antes de expirar para já ter um novo antes mesmo da data de expiração chegar; o que do contrário poderia deixar seus sistemas mesmo que no ar com o famoso "cadeadinho vermelho" da noite pro dia, gerando insegurança da parte do usuário.

![16106648125_0ca022a8da_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661672765769/yc8V2upkQ.jpg align="left")

"[Abandoned Belt Wheels](https://www.flickr.com/photos/99649389@N02/16106648125)" by [darkday](https://www.flickr.com/photos/99649389@N02). is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## RSMD

O RSMD por si só é falho, e os próximos textos irão tocar em como remediar os problemas de se trabalhar com uma solução que precisa ir pra produção e se tem pontos criticos a serem tratados.

Não existe software perfeito; existe software que é consciente de suas falhas e procura tratar elas e os que não fazem isto. Isto porque por se tratar de algo "vivo" e com muitas partes em movimento, a margem pra novas falhas aparecerem é grande.

O importante também é ressaltar que o [Mongo](https://www.mongodb.com/) será tambem deployado como uma aplicação do próprio K8s, para se mostrar como se gerir um banco de dados em em um cluster K8s. A ideia é atrelar ele ao [longhorn](https://longhorn.io/) pra ter estabilidade de desenvolvimento/validação do sistema, salvando as informações no storage da Linode.

Se uma aplicação não tem analises de tecnologias a priori ela é fadada a ter problemas a serem tratados ou ser um projeto "nati-morto" que nasce mas não consegue ser distribuído depois por não cumpirir requisitos **MÍNIMOS** de segurança. Além de que algumas não possuem um diálogo aberto para debater as falhas delas, o que dificulta mais ainda as coreções, ficando para o pessoal responsável operacional ter que remediar isso; sendo que isto encarece e muito o custo o custo total da solução sem estar no planejamento incial previsto. 

![1520399_a08561baae_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661430631228/AtM5SJ4FB.jpg align="left")

"[bull's head, 1943](https://www.flickr.com/photos/45029785@N00/1520399)" by [lawa](https://www.flickr.com/photos/45029785@N00) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=openverse).

## Pout Pourri

Antes de tudo gostaria de agradecer se chegou até aqui, este texto é virtualmente sete vezes maior que qualquer outra coisa que já escrevei aqui anteriormente, o que o torna quase impossível de ser processado de uma vez só, muito menos escrito de uma vez só. Meu muito obrigado pela atenção de ler tudo.

Agora, alguns pontos que são observações e/ou ideias para próximos textos que serão elaborados aqui ainda: 

- Caso tenha subido um cluster K8s poderá vercomo subir o seu próprio clone de GitHub e ter nele centralizado seu código, com o texto elaborado [aqui](https://fazenda.hashnode.dev/seu-proprio-github-em-casa-e-de-graca). Além de que o mesmo se aplicar caso queria fazer similar com o [Docker Hub](https://hub.docker.com/) o e outras ofertas de hosting de ferramentas para desenvolvedores.
- Na parte do atrelar o IP da máquina alocada ao registro A/AAAA no painel de domínio do Linode, caso fosse utilizar uma VM pra cada serviço que subisse teria que manter também um registro para cada IP no painel do domínio, colocando um ponto a mais pra ter que dar manutenção e dar possível falha do processo, replicando um processo repetitivo;
- Independemente da macro visão de resolução de domínios em IP apresentado aqui, é importante ressaltar que isso é feito na primeira requisição ao domínio em si; nas requisições subsequentes um cache da resolução é utilizado, uma vez que na primiera uma cópia é feita em alguns níveis:
  - Navegador;
  - Sistema Operacional;
  - Modem;
- Caso faça muitas requsições erradas para o LE, você pode por tomar um ban de até dois dias de novas requisições;
- Assim como VMs não desapareceram com o surgimento de containers, containers não irão desaparecerer com adoção de mercado de WebAssembly (WASM). Por mais que seu primo viciado em RUST diga que o WASM vai dominar o mundo, ele talvez esteja limitando muito a visão de mundo dele, do que sendo a reinicarnação de Nostradamus... Até porque a vantagem de VMs e Containers são o encapsulamento enquanto o WASM é uma conversão para um formato que, teoricamente, é universal; ou seja, toda ferramenta terá que, em tese, ter seu próprio compilador pra WASM, tendo um paradigma similar a aos sistemas de serverless, onde funcionam muito bem para aqueles  que conseguem falar aquilo que se espera, para os que não conseguem resta a penas o famoso: "só lamento"
- Recomendo ler um pouco sobre [DNS over HTTPS](https://en.wikipedia.org/wiki/DNS_over_HTTPS) para poder entender mais sobre uma etapa importante que gerou discussões técnicas e até movimentação da comunidade de tecnologia há uns dois anos quenado o Firefox [anunciou](https://blog.mozilla.org/en/products/firefox/firefox-continues-push-to-bring-dns-over-https-by-default-for-us-users/) que traria por padrão;
- Caso o Linode seja uma opção que não lhe interesse por não ver valor em pagar para aprender a mexer neles mesmo com o cupom inicial, a Oracle oferece uma [conta gratuita](https://www.oracle.com/cloud/free/) com bastante poder de processamento;
- Uma das vantagens de se aprender a mexer na configuração de firewall, sejam ele do provedor o até mesmo do sistema operacional em si, é aprender a fazer uma regra de se mexer por fechada e não trafegar nada pela rede pública em si, grantindo em infra algo que a aplicação pode ter como requisito;
- Segurança:
  - Grupo de hackers russos chamado [fancy bear utiliza o K8s](https://portswigger.net/daily-swig/russian-hacking-group-apt28-conducting-brute-force-attacks-against-organizations-worldwide) para poder gerir alguns ataques;
  - Traefik tem a opção de configurar os certificados SSLs, que será mostrado em conjunto com o texto de remediação das vulnerabiliades do RSMD;
- Multi-cloud: a ideia vai ser mostrar uma combinação de Linode mais a Oracle no plano gratuito dela depois, o que faz muito sentido caso queira subir um ambiente de testes que nem foi o citado aqui para fazer configuraçõeses e ajustes para nova versão do K8s;
- Esta abordagem de Kubernetes permite expandir mais ainda a questão de multi-cloud:
  - Economia de operação com um time reduzido para gerir tudo;
  - Dar deploy em uma infra fisicamente próxima ao cliente;
- Repositórios privados: caso esteja trabalhando com um hub.docker.com ou até mesmo outra solução -- *mesmo self-hosted *--, um dos problemas será compartilhar o imagens privadas pro cluster poder acessar, uma saída é compartilhar as suas credencias com o cluster em si para que elas sejam utilizada na hora de puxar as imagens:

```shell
kubectl create secret generic regcred \
   --from-file=.dockerconfigjson=$HOME/.docker/config.json \                                                 
   --type=kubernetes.io/dockerconfigjson
```

- No Rancher, caso tenha um problema de ver os logs do seus containers depois de ter mudado o tamanho de linhas, leia [[bug][v2.6.5] Blank is displayed when viewing Pod logs #6009](https://github.com/rancher/dashboard/issues/6009)
- Caso ainda tenha dúvidas de redes, uma rápida revisão ou introdução seria os [videos do Akita sobre isto](https://www.youtube.com/watch?v=0TndL-Nh6Ok&list=PLdsnXVqbHDUcTGjNZuRYCVj3AZtdt6oG7).

![14623635699_d69daa5482_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1661672212675/8hT51MZER.jpg align="left")

"[Histria](https://www.flickr.com/photos/9019841@N08/14623635699)" by [fusion-of-horizons](https://www.flickr.com/photos/9019841@N08) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Referências

- [Traefik & CRD & Let's Encrypt](https://doc.traefik.io/traefik/user-guides/crd-acme/#ingressroute-definition)
- [Arthur Conan Doyle > Quotes](https://www.goodreads.com/author/quotes/2448.Arthur_Conan_Doyle#:~:text=%E2%80%9CWhen%20you%20have%20eliminated%20all,%2C%20must%20be%20the%20truth.%E2%80%9D&text=%E2%80%9CIt%20is%20a%20great%20thing,which%20are%20your%20very%20own.%E2%80%9D&text=%E2%80%9CThere%20is%20nothing%20more%20deceptive%20than%20an%20obvious%20fact.%E2%80%9D)
- [Install kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [Kubernetes: Where is my default Kubeconfig file?](https://blog.marcnuri.com/where-is-my-default-kubeconfig-file)
- [View the Issuers and ClusterIssuers in your cluster](https://www.ibm.com/docs/en/cpfs?topic=certificates-viewing-cert-manager-resources#issuers)
- [Provide Businesses with a Developer-friendly and Massively-distributed Platform to Build, Run and Secure Applications](https://www.linode.com/press-release/akamai-to-acquire-linode/)
- [SUSE Completes Acquisition of Rancher Labs](https://www.suse.com/news/suse-completes-rancher-acquisition/#:~:text=LONDON%20and%20CUPERTINO%2C%20Calif.,market%20leader%20in%20Kubernetes%20management.)
- [How It Works](https://letsencrypt.org/how-it-works/)
- [Advantages and disadvantages of Edge Computing](https://www.kionetworks.com/en-us/blog/data-center/advantages-and-disadvantages-of-edge-computing)
- [Install/Upgrade Rancher on a Kubernetes Cluster](https://rancher.com/docs/rancher/v2.6/en/installation/install-rancher-on-k8s/)
- [Failed to download "jetstack/cert-manager" #1931](https://github.com/jetstack/cert-manager/issues/1931)
- [Linode - Common DNS Configurations](https://www.linode.com/docs/guides/common-dns-configurations/)
