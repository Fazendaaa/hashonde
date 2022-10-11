# Kubernetes -- um boteco na Av Paulista

foto de capa: ["Pub"](https://www.flickr.com/photos/97715891@N00/14380754710) by [Kamal H.](https://www.flickr.com/photos/97715891@N00) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

>  "Água, 35 litros. Carbono, 20kg. Amônia, 4 litros. Cal, 1,5kg. Fósforo, 800g. Sais, 250g. Salitre, 100g. Enxofre, 80g. Flúor, 1,5g. Ferro, 5g. Silício, 3g. E outros quinze elementos em pequenas quantidades. Todos esses elementos fazem um corpo humano adulto. Esses ingredientes podem ser comprados em um mercado com a mesada de uma criança. Seres humanos são tão baratos". -- ELRIC, Edward

## Intro

%[https://youtu.be/VjczZvz-z24]

Chef é um filme que conta a história de um cozinheiro que procurou cuidar de todas as etapas do processo de desenvolvimento do que fazia na sua carreira:

- Procurar os ingredientes direto nos produtores que se adequariam melhor ao seu estilo
- Montar a sua cozinha da maneira mais eficaz e entregar o produto de maneira
- Atender melhor a necessidade seus consumidores
- etc.

*Basicamente um engenheiro de DevOps que gostava mais de ficar na cozinha do que no computador.*

Por trás de cada prato existe uma cadeia de processos para ele chegar até ti, desde a época que nossos ancestrais pararam de ser catadores para se tornarem produtores dos próprios alimentos há mais ou menos 12 mil anos atrás durante o neolítico.

Para se colocar em perspectiva, a invenção da escrita sistematizada apareceu por volta de 3.5 mil anos antes de Cristo; ou seja, quando a escrita foi inventada a pessoa que viviva naquela época estava mais próxima de nós, o ser humano atual, que andamos de Metrô, fazemos pedido na Amazon Prime para chegar no mesmo dia e conseguimos falar com alguém no Japão simultaneamente do que do dia quando os primeiros fazendeiros andaram pela terra.

**O ser humano está mais acostumado a produzir o que consome do que está acostumado a ler e escrever.**

![15841506301_469d32d450_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623723249776/h7ExeVZ7M.jpeg)

["Terrace Farming. Chinchero, Peru."](https://www.flickr.com/photos/55648226@N03/15841506301) by [Shawn Harquail](https://www.flickr.com/photos/55648226@N03) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

E pra "piorar" um pouco as coisas, computação -- a cultura DevOps para ser mais expecífico -- trata de pegar algo, fazer e entregar tudo isso só que através da escrita... Juntanto os dois pontos da história da humanidade citados anteriormente. A diferença que os primeiros papiros foram feitos há quase 5 mil anos enquanto os primeiros computadores da maneira que conhecemos como hoje foram por volta de 1970 -- e a máquina de escrever foi feita quase 100 anos antes.

Todavia, computação não é tão homogênia como pode parecer... E você pode ver isso mais como a *aplicação* da computação do que ela por si só; assim como uma farinha na cozinha italiana pode virar uma pizza e um macarrão, a mesma farinha quando aplicada na cozinha japonesa pode ser transformada em um goyza ou tempurá... O mesmo cálculo que está por trás da compactação de imagens no formato [PNG](https://compress-or-die.com/Understanding-PNG) pode ser utilizado para o formato [MP3](http://www.mp3-tech.org/tech.html).

Assim como Sam Witwicky disse uma vez que *"você é muito mais do que aquilo que os olhos podem ver"*, a computação e a cozinha podem ser vistas como maneiras diferentes de se aplicar o mesmo conhecimento básico.

![278768722_304ba73886_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623726433169/47-lUcffa.jpeg)

["Wasabi Sushi Chef - Fayetteville"](https://www.flickr.com/photos/16638697@N00/278768722) by [eschipul](https://www.flickr.com/photos/16638697@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Docker

Nesse oceano de textos da internet sobre o Docker e os containers, o que seria cada no mundo da cozinha?

- *Container = pote*
- *Docker = Tupperware*

*Sim, isso mesmo... Containers são "potes"*.

![19724691945_13d9363118_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623728146387/m2Fhn37b6.jpeg)

["Packed lunch for tomorrow #curry #curryclub"](https://www.flickr.com/photos/58563973@N00/19724691945) by [western4uk](https://www.flickr.com/photos/58563973@N00) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

Potes esses onde o programador encapsula tudo o que precisa pra funcionar o que fez, você poderia ver ele como a famosa marmita que você faz: dentro dela você vai ter tudo o que colocar e sem precisar fazer nenhuma cocção quando chegar no trabalho, tudo já foi preparado previamente, nada de ter que cozinhar o feijão porque veio só a semente crua, nada de ter que colocar mais arroz porque colocou pouco, nada de ter que medir as coisas para ver se tem a mais ou a menos porque já colocou as medidas em colheres ou balança mesmo que queria, não tem como alguém pegar seu pote e colocar mais coisas ou tirar elas... Só basta aproveitar.

Mas assim como todos os potes não são criados iguais, nem todos os containers são necessariamente iguais... Digamos que você só quer comer parte do seu prato e sabe que se ele vier todo misturado pode acabar estragando a comida mesmo na geladeira por estarem em contato uma com a outra; da mesma maneira que um pote comida pode ser em divisórias como uma caixa de bentô, um container pode ser segmentado para que ele possa ser visto como um conjunto de objetivos -- assim como um bentô possa ser visto como um conjunto de saladas, carnes, molhos e etc.

![2872123_181f41544a_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623727469234/PxAVPWHpQ.jpeg)

["Bento Box"](https://www.flickr.com/photos/31956880@N00/2872123) by [Route79](https://www.flickr.com/photos/31956880@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

*"E onde entra o Docker em tudo isso?"*

Muitas vezes uma marca que se torna sinônimo de um produto que fabrica:

- Ping-Pong no tênis de mesa
- Band-Aid em curativos
- Miojo em lamen instantâneo
- Danone em iogurte
- Durex em fitas adesivas
- Jet Ski em moto aquática
- etc.

Docker é a "marca" que ofusca qualquer outra de containers... Assim como a Tupperware nos potes.

## Docker-Compose

Você pode ver o [Docker-Compose](https://docs.docker.com/compose/) como organizar a festa junina da família... Você pode até fazer a carne louca para comer com seus sobrinhos(as), tios(as) e avós, mas vai ter que pegar o refrigerante pronto, o vinho pronto e coisas como a pipoca vai ter que no máximo colocar sal nela. O Docker-Compose funciona um lista de pratos e quitutes que descrevem o que precisa para funcionar a festa -- *mas nesse caso seriam serviços prontos ou pré-preparados que são necessários pro seu sistema funcionar como banco de dados, reverse-proxy, caches em memória e etc. e lista como eles integram com o seu serviço*.

![5809399299_3d388023e9_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623754778421/Y8KByzefJ.jpeg)

["French shopping list"](https://www.flickr.com/photos/73491156@N00/5809399299) by [Éole](https://www.flickr.com/photos/73491156@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Kubernetes (K8s)

Tudo que foi falado até agora de [Docker](#docker) e [Docker-Compose](#docker-compose) pode ser considerado como do ponto de vista de uma pessoa só, meio que para um "uso pessoal" e/ou pequena escala. Uma só pessoa consegue dar conta de fazer marmitas para ela e a família dela com certa praticidade, já agora essa mesma pessoa não consegue dar conta sozinha de fazer todos os [bentôs para uma estação de trem no Japão](https://www.youtube.com/watch?v=eBPsaa0_RtQ).

Assim como um food-truck, boteco e um restaurante com estrelas no Guia Michelin são exemplos de cozinhas profissionais. Há uma certa "equivalência" que será colocada aqui para você parar e pensar antes de continuar a ler:

- *Food-truck = K8s rodando na sua máquina*
- *Boteco = K8s rodando em um servidor*
- *Restaurante = K8s rodando em vários servidores*

![35024305156_59d707e9d2_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623759268437/c87uiZV4r.jpeg)

["Colors Of the Night - LA Food Truck"](https://www.flickr.com/photos/45958601@N02/35024305156) by [Joey Z1](https://www.flickr.com/photos/45958601@N02) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Procurar ter um gostinho de cozinha profissional pode muito bem começar com um food-truck, você pode na maioria das vezes ter ele até como uma espécie de "renda extra" de final de semana; todavia há limitações:

- Não necessariamente você vai conseguir dar conta se tiver um número alto de clientes
- Seu cardápio geralmente é limitado por questões físicas, de tempo e recursos disponíveis
- Sem você o seu food-truck não funciona

A pegada de food-truck pode muito bem suprir suas necessidades e até ser utilizada para rodar um projeto pessoal seu com um toque de profissionalismo e mostrar que você conhece o básico do ambiente profissional de K8s.

![6780129892_f0e996e941_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623759584451/89V0NBn-y.jpeg)

["Bar at the Reindeer pub Norwich"](https://www.flickr.com/photos/10630857@N04/6780129892) by [Roger Blackwell](https://www.flickr.com/photos/10630857@N04) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Já a abordagem de boteco entra no cenário dos famosos botecos de esquinas de faculdade:

- Eles muita vezes possuem um profissional no bar para dar conta de todos os pedidos
- O cardápio é mais diferenciado por ser um espaço melhor
- Suporta mais cliente devido ao espaço dedicado para a operação

O boteco pode ter mais de um funcionário assim como um servidor de empresa pode ter duas máquinas que dão conta de todos os serviços utilizados por aquela empresa -- assim como o boteco geralmente dá conta de todos os alunos que querem beber quando saem da aula da universidade ao lado.

Todavia esta abordagem também possuí suas limitações e geralmente elas são relacionadas a processo:

- Por não ter funcionários dedicados a tarefas em expecífico o boteco pode acabar perdendo performance no seu dia-a-dia porque a pessoa que prepara os dinks muitas vezes cuida dos pedidos e comandas.
- O fluxo do boteco geralmente, neste exemplo, é só depois das aulas acabarem, o que acaba gerando uma ociosidade. Assim como os servidores empresariais ficam muitas vezes sem ter o que fazer finais de semana e fora do horário comercial por ninguém precisar utilizar serviços que rodem neles. E durante os horários de pico o atendimento pode ficar congestionado.
- Um boteco geralmente tem "baixo valor agregado" porque se amanhã ou depois a faculdade em si fechar o boteco pode acabar indo a falência... Um servidor de uma empresa serve para atender as necessidades daquela empresa.

A vida em um boteco é uma eterna renovação seja de ambiente ou de cardápio para poder atender as constantes mudanças dos clientes; é um ambiente que não tem a flexibilidade de um food-truck de poder se mudar uma vez que o ponto fique fraco e, ao mesmo tempo, não tem o expertise todo e o alto valor agregado de um restaurante que as pessoas vão até ele pela experiência sem dores de cabeça.

![3953731351_20b6b62eb4_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623760114642/dpAMFkQe7.jpeg)

["Dumpling House Restaurant kitchen workers"](https://www.flickr.com/photos/82568321@N00/3953731351) by [fortinbras](https://www.flickr.com/photos/82568321@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

A parte que todo mundo vê com mais glamour chega agora... **O Restaurante**.

Antes de continuarmos, por favor, pare e imagine a cozinha da sua casa, procure se lembrar de cada detalhe, cada ferramenta e cada tamanho de tudo que tem nela... Díficil, né? Agora imagine ficar boa parte do seu dia nesse ambiente... Seria mais díficil ainda. Restaurantes estão no topo da cadeia assim como fábrica de alimentos uma vez que em alguns cenários elas funcionam 24h por dia, sete dias por semana.

Um ambiente extremamente profissional requerer as mesmas ferramentas mas modificadas para atender a demanda apresentada:

- Em um restaurante se um atendente falta, outra pessoa é colocada no lugar
- Uma faca de corte não é a mesma que você tem em casa porque em um dia ela deve cortar mais o que você corta em um mês todo para cozinhar pra sua família
- O sistema de agendamento e distribuição por mesas permite um uso eficiente e eficaz do espaço -- *diferentemente da sua casa na qual se sua avó e sua tia resolverem te visitar ao mesmo tempo não vai ter cadeira pra todo mundo sentar*

Este nível de precisão de um relógio suíço traz também outras vantagens similar quando comparado aos modelos de quartz do boteco e do food-truck:

- O conhecimento desenvolvido aqui é de ponta e normalmente replicado nas outras camadas
- O diferencial apresentado faz com que não sejam apenas "mais um", catapultando o valor agregado
- Profissionais de ponta nos quais, muitas vezes, equivalem por *n* outros colegas em outras camadas

![4968501656_e906d92c69_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623767543318/NRNb176b3.jpeg)

["Restaurant"](https://www.flickr.com/photos/26428343@N04/4968501656) by [Hallenser](https://www.flickr.com/photos/26428343@N04) is licensed under [CC BY 2.0](https://www.flickr.com/photos/26428343@N04)

Todos os cenários citados são cozinhas profissionais, cada um tendo que seguir regras sanitárias, locais e de clientela. O diferencial é qual o público e qual a escala que eles querem atender... Existir food-trucks não significa que isso é o fim dos restaurantes assim como uma pessoa que come em restaurantes não significa que ela não possa beber e petiscar em um boteco.

K8s é a cozinha profissional em os seus mais diversos níveis, se trata mais de um conjunto de regras do que uma marca ou produto. Toda cozinha tem:

- **Pedidos**: que seriam os `pods` do K8s explicando quais são as quantidades, ponto da casa, molho e etc. definidas de cada coisa pra aquele serviço
- **Sous-chef**: que seria o seu `control-plane` do seu K8s, organizando e distribuindo da melhor maneira as tarefas
- **Cozinheiros**: que são os seus `workers` no cluster K8s
- **Estoquistas**: que seriam os `etcds` reponsáveis por armazenar e retornar dados
- etc.

Os `nodes` neste exemplo seriam os funcionários e a cozinha, no final do dia, é seu cluster.

A granularidade pode ser muito mais alta assim como muito mais baixa, vai depender do cenário e da necessidade de cada tarefa... No final do dia o [MASP - A Baianeira](https://masp.org.br/abaianeira), o [Riviera Bar](https://riviera.deliveryem.casa/home) e o [Calçadão Urbanoide - Comida de Rua](https://www.facebook.com/calcadaourbanoide/) são cozinhas profissionais, sem nenhuma delas poderem chamar apenas ela de cozinha em detrimento das outras.

![33799361834_034946d8f8_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623769051175/dw5dU5_dF.jpeg)

 ["They mixed up our food order so they brought us a free sampler. Fine by me."](https://www.flickr.com/photos/35034358042@N01/33799361834) by [iChris](https://www.flickr.com/photos/35034358042@N01) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Rancher

Até agora você já deve ter ficado com fome -- *e muita provavelmente* --, normalmente quando você está em casa e não tem nada pra comer o que geralmente faz?...

Em tempos quase que longínquos era comum pessoas procurarem na lista telefônica por telefones de lanchonetes para pedir comida, ter que ligar, fazer o pedido, pagar em cartão quando chegar e ter que pagar, em algumas vezes, a parte o entregador em dinheiro... Hoje em dia você simplesmente abre o [iFood](https://www.ifood.com.br) ou [Uber Eats](https://www.ubereats.com/) já pega logo na entrada do app uma promo que já foi debitada no seu cartão sem nem precisar pagar a pessoa da entrega quando chegar.

![34719224782_0e53d729d7_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623753984914/khPdyi4_r.jpeg)

["UBER Eats Delivery Cyclist Riding Through a Busy Oxford Road in Manchester"](https://www.flickr.com/photos/155237687@N06/34719224782) by [shopblocks](https://www.flickr.com/photos/155237687@N06) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Assim como explicado anteriormente dos clusters K8s serem empresas que procurarm entregar da melhor maneira o que eles fazem, você ainda vai ter que se adaptar um pouco há elas, entender suas peculiaridades, ter que abrir o site para ver qual que é o horário de funcionamento, procurar no rodapé para ver as formas de pagamento e, além de tudo, ter que ver se tem que ligar lá pra pedir ou tem alguma área de pedido no site... As coisas foram feitas para facilitar o lado da empresa que fornece o serviço, não o seu.

Já o [Rancher](https://rancher.com/), assim como os apps de pedido de comida já citados, procura atender as suas necessidades como consumidor, ele procura centralizar e facilitar a sua experiência independentemente das peculiaridades de cada provedor no qual ele se conecta. Isso acaba também facilitando experiência e uso da plataforma/tecnologia porque reduz a fricção do processo.

## Em Suma

Assim como toda viagem ao redor do mundo começa com um passo, para poder fazer tudo isso comentado aqui você vai ter que molhar seus dedos na água e dar uma chance para si mesmo. Tudo já está lá pronto para ser usado, basta você ir e pegar aos poucos tudo e ir indo adaptando para ti e seus casos de uso... Assim como uma receita que você pode gostar de colocar mais pimenta do que o escrito nela pode te levar a desenvolver novos pratos juntando outras receitas já feitas ou até começar do zero; sistemas não são muito diferentes disso, você pode começar pegando uma coisa pronta e adptar ela pra ti, quando for ver já tem a sua própria franquia *a la* Robinson Shiba.

A vantagem da aplicação do "mesmo modelo" em diferentes camadas permite que as modificações em uma sejam copiadas pelas outras e o processo como um todo melhore para todos contemplados.

O importante ressaltar é que no final do dia, seja Docker, Docker-Compose, K8s e Rancher, o diferencial é entender que todos falam "container" no final do dia; este é um padrão claramente  [definido](https://github.com/container-storage-interface/spec/blob/master/spec.md) e respeitado pela indústria. Seria como uma unidade de medidas com seu sistema bem definido: *"Um container pode ter 5 'unidades de container' sendo que essas 'unidades de container' são únicas e utilizadas por todos que trabalham com ela".* -- não é como antigamente que a medida de *pé* variava antes de 1959 por país até definirem ela baseada com relação ao metro.

Agora que já "entendeu" como funciona essa cadeia toda, por favor fique de olho nos próximos textos, eles irão destrinchar passo-a-passo o dito aqui, dando prós e contras, análises de mercado, retornos de invesitmentos, perspectivas de segurança, custo de propriedade e etc. sobre três áreas da computação que este blog sempre procurou tratar:

- DevOps em casa
- Sistemas híbridos
- Sistema de multi-provedores

E, caso queira dar umas risadas, este é um dos poucos textos que a leitura do [apêndice](#apendice) é recomenda à todos, uma vez que ela vai tratar:

- [O melhor negócio é o pior negócio](#o-melhor-negpcio-e-o-pior-negocio) 
- [Helm charts são as festinhas de aniversário](#helm-charts-sao-as-festinhas-de-aniversario)
- [Fast-foods são a Nuvem multi-provedores](#fast-foods-sao-a-nuvem-multi-provedores)

![4250159996_7c98ef5894_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623756074428/3DQCjNGiq_.jpeg)

["Short Order Cook"](https://www.flickr.com/photos/41266898@N04/4250159996) by [atmtx](https://www.flickr.com/photos/41266898@N04) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Apêndice

Assim como um episódio do MasterChef mostra que várias pessoas tem diferentes backgrounds e procuram trazer a perspectivas delas para cada tarefa e entregar o melhor em cada prato que fazem, as vezes pode parecer díficil e  para procurar ajudar nisso alguns posts já publicados aqui podem te ajudar a ver as coisas mais claras:

1. [Análise de dados + Site + Banco de Dados? Tudo no isso seu PC e sem precisar instalar o R, Shiny e o Mongo](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo)
2. [HTTPS para desenvolvimento local](https://fazenda.hashnode.dev/https-para-desenvolvimento-local)
3. [Configurando Rancher em um ARM](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm)

![5085115983_5fe7f4c0d0_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623756772600/G9x-ldkYy.jpeg)

["Chef school"](https://www.flickr.com/photos/45810515@N03/5085115983) by [angietorres](https://www.flickr.com/photos/45810515@N03) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

### O melhor negócio é o pior negócio

Assim como citado por Bradley Cooper no filme *Burnt* durante a cena do Burger King:

%[https://youtu.be/aCXIyygYb90]

Consistência é algo que, do ponto de vista de negócio, é a melhor coisa para desenvolver o a solução; é o modelo de produção em escala, é algo que desde o Taylorismo o mundo vem buscando aprimorar em cada uma de suas iterações ainda mais agora com as fragilidades apresentadas durante a pandemia...

Todavia, essa mesma consistência, é o pior negócio para um desenvolvedor; isso porque ele não toma riscos, ele não tem como aprender uma maneira nova e procurar crescer e fazer a sua diferença e deixar a marca no meio de tantos outros.

Parafraseando a cena de abertura de Flashpoint:

*Aprenda o que tem que aprender, se arrisque no que tem que se arriscar... E, o mais importante, saiba diferenciar entre os dois*

### Helm charts são as festinhas de aniversário

[Helm charts](https://helm.sh/docs/topics/charts/) são "combos" de serviços... Sabe quando você vai em um Mc Donalds, Habbibs, The Fifities e etc., e sempre tem uma opção de festa de aniversários? Então, esses são os Helm charts; são a maneira mais simples de se entregar coisas extremamente complexa tirando o ônus de quem quer o serviço e dando a flexbilidade do provedor alavancar seus pontos fortes e tirar proveito disso.

![5254522198_d912f010d2_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623766071510/yTezHTf0J.jpeg)

["Now Serving Birthday Parties"](https://www.flickr.com/photos/17237319@N00/5254522198) by [rachaelvoorhees](https://www.flickr.com/photos/17237319@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Eles expandem a noção que já foi trabalhada no [Docker-Compose](#docker-compose) anteriormente de um manifesto que declara o conjunto da obra; mas a vantagem é que eles não jogam a responsabilidade de uma alta granularidade de configuração pro cliente -- neste caso o dono do serviço -- assim como o Docker-Compose fazia, ele permite que o provedor -- o seu K8s -- atenda a necessidade da melhor maneira que ele achar necessário. Um exemplo:

- *Uma festa que atenda 30 pessoas*
- *Que possua uma flexibidade para aguentar mais 5 de ultima hora*
- *E que seja apenas para uso de pessoas com a identificação necessária*

Agora troque a questão de festa por um banco de dados SQL.

### Fast-foods são a Nuvem multi-provedores

Escute-me por um segundo, será a última analogia deste texto e te ajudará ver valor no que os próximos textos irão tratar sobre...

*"Rodar sua aplicação na Amazon Web Services (AWS), Azure, Google e etc. é a mesma coisa que ter uma franquia"*

![7023443493_b4a9bd4ff0_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623766755226/hLtLqSh3K.jpeg)

["RIO - O Quiosque Coca-Cola"](https://www.flickr.com/photos/42333408@N02/7023443493) by [Felipe_Borges](https://www.flickr.com/photos/42333408@N02) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Hoje em dia, se você quiser abrir um ponto de uma casa de chá, chocolate ou fast-food, você pode simplesmente ser franquiado de uma marca e utilizar dela para construir o seu negócio ao invés de ter que fazer tudo do zero você mesmo; e, para a marca, isso é um benefício porque à ajuda a crescer e espalhar mais o nome dela.

A questão de nuvem de multi-provedores é quase que a mesma coisa:

- Você, detentor do sistema, precisa de um lugar para rodar ele mas não tem como subir servidores físicos ao redor do mundo
- O seu produto é um atrativo para pessoas que tem o conhecimento e/ou vontade de fazer fazer a sua marca crescer e elas crescerem com isso
- Seu produto fica "blindado" de escrutínio uma vez que a busca de parceiros te faz entender melhor o mercado local e não injetar premissas falsas e adaptar a melhor ação para aquele cenário

Só para lembrar as aulas de biologia do colégio: *isso é uma relação de simbiose* -- ou se você simplesmente viu o filme ou leu as histórias em quadrinhos do Venom vai entender, mesmo conceito.

A vantagem da abordagem cloud-native é igual a da Domino's que há aqui perto de casa; ela é, literalmente, um conjunto de containers onde as maior parte das pizzas são montadas lá e há entregas e atendimentos no local:

- Amanhã ou depois se o dono da marca quiser não quiser que o franqueado trabalhe mais com eles, o franqueado poder mudar para outra marca o ponto.
- Assim como se o problema for o ponto, eles podem facilmente migrar a estrutura para outro canto da cidade.
- E se a demanda crescer é só colocar "mais containers" para atender tal demanda

![5365683421_ed80c1fa9a_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1623764467938/Uov6JLAOu.jpeg)

["Domino's Pizza en Tuxtepec"](https://www.flickr.com/photos/23548142@N02/5365683421) by [reyesbaglietto](https://www.flickr.com/photos/23548142@N02) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Caso queria ver um pouco mais do ponto de mercado o que isso significa, algumas recomendações:

- [NerdCast 606 - Segredos dos Restaurantes ](https://jovemnerd.com.br/nerdcast/segredos-dos-restaurantes/): episódio que conta como diferentes níveis de cozinhas profissionais em cenários e públicos diferentes possuem tanta coisas em comum
- [The Founder](https://www.imdb.com/title/tt4276820/): filme sobre a origem da cadeia do Mc Donald's
- [Why Starbucks is Actually a Bank](https://youtu.be/mr039xnco-8): o título já explica tudo
- [Super Size Me 2: Holy Chicken!](https://www.imdb.com/title/tt7215262/): como funciona para, nos dias atuais, ser o fornecedor de frango para as cadeias de fast-foods

## Referências

- [O que é franquia e como funciona? Entenda ao pé da letra](https://www.portaldofranchising.com.br/franquias/o-que-e-franquia/)
- [11 marcas que viraram sinônimos de produtos](https://exame.com/marketing/11-marcas-que-viraram-sinonimo-de-produtos/)
- [The Development of Agriculture](https://web.archive.org/web/20160414142437/https://genographic.nationalgeographic.com/development-of-agriculture/)
- [Uma breve história da escrita](https://www.ufmg.br/espacodoconhecimento/historia-escrita/)