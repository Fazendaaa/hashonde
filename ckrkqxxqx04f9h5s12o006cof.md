# API first

foto de capa: ["is arriving..."](https://www.flickr.com/photos/72396314@N00/3844539449) by [OiMax](https://www.flickr.com/photos/72396314@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

> "Cresça independente do que aconteça" - Quero Ser Feliz Também, Natiruts

## Intro

Nos mais diversos textos apresentados aqui a ideia sempre foi de encapsulamento em nível de código. Todavia há um cenário que encapsulamento nem sempre é a melhor abordagem; esse cenário é quando há necessidade de:

- Flexibilidade de escalar a aplicação
- Desenvolvimento com muitas entregas em períodos curtos
- Limitar desenvolvimento devido ao orçamento
- Eficiência de tirar o melhor proveito do hardware disponível

Isso do ponto de vista mais de computação da aplicação, entretanto APIs trazem uma grande vantagem de negócio com relação à matriz de *faça para um e venda para vários*.

Assim como por mais caras que sejam as máquinas que fabricam as peças de LEGO, a empresa consegue reduzir o custo de cada unidade devido ao alto volume de peças fabricadas as APIs conseguem se comportar de maneira similar. Fora que além de custo baixo as peças são similares à uma API por poderem gerar objetos diferentes com a mesmo conjunto de peças, o que só aumenta seu valor agregado sem necessariamente subir o custo.

![5827273812_8dcfc687f9_o(1).jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627259448843/N0wAq8d8F.jpeg)

["Visit to Lego Factory!"](https://www.flickr.com/photos/67478164@N00/5827273812) by [Rufus Gefangenen](https://www.flickr.com/photos/67478164@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## O que é API?

API significa *Application Programable Interface*... Mas isso não responde o que ela é propriamente dito.

Você pode ver a API como um conjunto de protocolos de comunicação, geralmente por rede, que servem como camadas de um bolo que interligam várias outras camadas diferentes. A diferença é que as camadas de bolo tem duas conexões apenas: uma com a camada superior e outra com a inferior; enquanto a API pode ter várias camadas programáveis.

Você pode ver APIs como se fossem bonecas matrioskas, e que você quer brincar de bonecas contando uma história com elas. Nesta história, se todas as bonecas estão encapsuldas uma dentro da outra, você, como quem tem acesso há elas, só vai poder brincar com a mais externa. Agora se você deixa cada uma independente vai poder ter acesso à todas, podendo brincar com elas todas ao mesmo tempo. 

![148365336_01e0d46696_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627222974078/TixtndXKN.jpeg)

["Topless grumpy"](https://www.flickr.com/photos/47262904@N00/148365336) by [longwayround](https://www.flickr.com/photos/47262904@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Álgebra Relacional

Álgebra Relacional é a teoria por trás da definição de muitos bancos de dados que surgiram depois dos anos 70 -- lembrando que até então COBOL reinava com sua mais de uma década de mercado -- para servir como ferramenta de desenvolvimento e modelagem de sistemas. Sendo também uma das áreas mais seculares da computação.

Porém ela vai além do SQL e a abordagem de segmentação de código que foi utilizada no projeto a ser aqui apresentado; há um texto complementar a este que será publicado logo em seguida. Boas práticas de código e de arquitetura aqui utilizadas são derivadas de conceitos da área uma vez que aplicações e dados serão os fatores que determinam a implementação e não ao contrário. O que pode ser visto como uma relações finitas do ponto de vista matemático.

Delimitar dados assim como código através de relações facilita níveis de granularidade e reduz o acoplamento além de não deixar a implementação sobrecarregada, o que dificulta a manutenção e consequente adição de novas features.

![104251236_8c2f7cacd2_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627224839449/yJzXPyekB.jpeg)

["Math everywhere..."](https://www.flickr.com/photos/88288684@N00/104251236) by [thowi](https://www.flickr.com/photos/88288684@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Código

[sieveR](https://github.com/Fazendaaa/sieveR) se trata de uma implementação do Crivo de Erastosthenes que, por sua vez, é um dos métodos de se calcular todos os números primos até certo número considerado o limite da análise. Por se tratar de algo que não tem uma fórmula fechada e depender muito em estruturas de dados e iterações, ele foi justamente escolhido pois apenas essa função por si só pode acabar consumindo muito recurso se colocada junta de outra aplicação.

A API desenvolvida de exemplo para este texto se trata de uma interface de comunicação com um código em C++ no qual o R o chama sem necessidade de expor C++ diretamente para o mundo poder utilizar.

O código da API é resumido nas seguintes linhas:

```R
#* @get /sieve
#* @post /sieve
function(limit) sieveR::erastosthenesSieve(as.numeric(limit))
```

Basicamente se trata da notação do [plumber](https://www.rplumber.io/) que, similar a do  [ROxygen](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html), demarca metavalores para a função descrita por ela. Neste caso está sendo declarado o endpoint -- que nada mais é que um "ramal" -- no qual a API ouvirá por requisições e redirecionará para esta função; já a definição de `get` e `post` são referentes ao tipo de método no qual tal endpoint pode ser acessado -- assim como se fossem "formulários" de acesso. Caso queria ver como o Crivo foi implementado, basta ver [aqui](https://github.com/Fazendaaa/sieveR/blob/master/src/erastosthenesSieve.cpp) o código. 

Agora, o código que disponibiliza a API através de um servidor dela:

```R
library(plumber)

host <- if ('' == Sys.getenv('PLUMBER_HOST')) '0.0.0.0' else Sys.getenv('PLUMBER_HOST')
port <- if ('' == Sys.getenv('PLUMBER_PORT')) 80 else Sys.getenv('PLUMBER_PORT')

pr("inst/sieve.R") %>% pr_run(host = host, port = port)
```

Este ainda é mais elaborado do que o do exemplo da documentação, daria para fazer tudo isso em uma linha apenas. Todavia ele lê a definição do endpoint declarada anteriormente e a expõe para ser consumida por qualquer um que quiser. Para rodar o código sem precisar instalar e/ou configurar nada, basta rodar o seguinte comando no seu terminal:

```shell
docker run --rm --publish 80:80 fazenda/siever
```

E, logo em seguida, acessar o endereço `http://127.0.0.1/__docs__/` no seu navegador. Nesta tela você conseguirar ter uma interação com o sistema -- basta clicar no botão **Try it out** e digitar algum valor limite para se calcular todos os números primos até ele:

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1627261102858/RVXf59vFU.png)

Basta reparar que a resposta se encontra em formato um conjunto de valores:

```
[
  2,
  3,
  5,
  7
]
```

Que são realmente todos os números primos até o número 10 do exemplo. Além disso o sistema mostra qual foi a requisição feita para que o sistema calculasse isto `http://127.0.0.1/sieve?limit=10` -- caso queira é só abrir uma nova aba e colocar tal valor nela para ver o resultado impresso na sua tela --; caso ainda tenha alguma dúvida se isto tem a ver com o seu navegador, pode tentar em outros ou até mesmo no terminal com o seguinte comando:

```shell
curl "http://127.0.0.1/sieve?limit=10"
```

Lembrando que, em teoria, este sistema poderia estar rodando em um servidor e não na sua máquina e você não saberia:

- Qual linguagem/framework ele foi desenvolvido
- Quantas releases foi feita
- Qual é arquitetura de processador ele está utilizando com o quanto de RAM e etc.
- Qual tecnologia o provedor utiliza para hostear ela: *virtual machines*, *containers* ou *bare metal*
- etc.

![11396544633_2d3614662d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627262142283/oIQ6aHxWI.jpeg)

["Green Network Cables"](https://www.flickr.com/photos/47121680@N00/11396544633) by [joncutrer](https://www.flickr.com/photos/47121680@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich) 

## Por que API?

Pode parecer que esta pergunta já foi repondida anteriormente pelo texto, mas na verdade a perspectiva agora é mais qual benefício a abordagem de API trás para quem a usa e não as vantagens para quem desenvolve ela:

- Escalabilidade: horizontalmente ao invés de vertical
- Sedimentação: uma vez que o código fique pronto, ele beira a "imunidade" do sistema operacional e consequentes atualizações que quebrem a aplicação uma vez que uma API pode muito bem estar rodando de maneira similar em um Windows XP assim como ela rodaria em um Windows 10 
- Desenvolvimento concorrente: várias equipes podem desenvolver diversas camadas do sistema, uma vez que a API é uma interface de comunicação comum, ela mantem cada time "honesto" nos requisitos que recebem e nos valores que devem retornar
- Pague pelo o que consome: muitas APIs tem a granularidade tão alta de seu serviço que frações de centavos conseguem ser cobradas por milisegundo de processamento
- Cacheamento: dependendo da maneria que você desenvolve sua API, os resultados podem ser amarzenados para estarem de pronta disponibilidade para todos os usuários
- Competição: muitos provedores de APIs acabam utilizando meios de comunicação praticamente idênticos, o que facilita ao desenvolvedor trocar de um provedor para outro praticamente sem nenhum esforço necessário

Elaborando o penúltimo tópico, no exemplo citado se algum usuário pedisse o todos os primos até 100 000 -- o que leva por volta de 1h dependendo do hardware --, o sistema levaria uma eternidade para calcular tal valor; todavia, se alguém pedisse o mesmo valor logo após ter sido calculado ele seria servido instantaneamente.

E partindo do ponto de vista da escala, a API permita que você faça o melhor uso do seu dinheiro, o colocando onde mais precisa atenção para os recursos. Caso amanhã ou depois um sistema complexo no qual 80% dele fosee apenas o código desta API precisasse ser escalado para conseguir dar conta da demanda, os outro 20% também seriam escalados. Isto demonstra um disperdício de recursos ao ter que escalar partes do processo que não são necessárias.

![113596431_63b3f82285_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627226202963/nmu_WMkvc.jpeg)

["Ant Party"](https://www.flickr.com/photos/30674396@N00/113596431) by [tarotastic](https://www.flickr.com/photos/30674396@N00) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

## Em suma

A ideia por trás de tudo isso é explicar um conceito simples e subaproveitado, não como se fosse para atacar o *zeitgeist* do desenvolvimento de bindings que, muitas vezes, intermediam a comunicação por ABIs (Application Binary Interface); que foi o método no qual o código em C++ se comunica com o R -- assim como se tivessemos deixado apenas uma matrioska chamada C++ dentro de outra chamada R quando fomos brincar de boneca, nenhuma das outras matrioskas conseguem ter acesso a C++, apenas a R.

E API não é uma definição escrita em pedra e que não pode ser mudada, até porque em primeiro lugar existem vários tipos de APIs, a demonstrada aqui se chama [REST](https://www.redhat.com/en/topics/api/what-is-a-rest-api). E assim como as peças de LEGO de quase 40 atrás se encaixam com as atuais, a camada de rede com o modelo OSI tem sua vantagem por:

- Disponibilidade para todos os diversos cenários uma vez que as interfaces de comunicação em rede podem ser consideras onipresentes e onipotentes nas mais diversas linguagens estáveis
- Baixo custo de desenvolvimento uma vez que existem frameworks que muitas vezes facilitam a adoção
- Hardware/Sistema Operacional agnóstico: um celular, uma Alexa dot, um Kindle, um iPad, um smarwatch e etc se conectam na internet seja por WiFi, cabo ou até mesmo um 4G.

A segmentação permite com que chame agora dentro do seu código Python esta implementação de código em R, só que não te prende a ele; caso amanhã ou depois queria chamar esta mesma implementação de R em Rust, C#, FORTRAN, C e etc, você conseguirá... Faça uma vez, e faça bem feito para não ter que sempre ficar refazendo por não ter considerado acoplamentos desnecessários.

> Comunique, não encapsule

![6065211711_ef33a2ce10_o.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1627228614207/wWUD0wCM9.png)

["Reality is the Sum of all Perspectives 4/4"](https://www.flickr.com/photos/65462440@N06/6065211711) by [entirelysubjective](https://www.flickr.com/photos/65462440@N06) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Apêndice I

APIs não são perfeitas, primeirmente há vários fatores que possam limitar sua adoção:

- REST, SOAP, GraphQL e etc... Qual utilizar?
- Nível do time de desenvolvimento: por mais que seja relativamente simples desenvolvimento com APIs, depurar eles não necessariamente o será para um time que nunca mexeu com isso anteriormente
- Boas práticas de desenvolvimento para garantir a idempotência da arquitetura
- Caso de uso: para evitar overengineering de exportar apenas uma função com um desenvolvimento para algo que vai rodar como app em um celular
- Segurança: uma vez que sua aplicação estará exposta para a rede, caso não tiver sistemas de segurança implementados riscos de DDoS e outros são reais
- etc.

No caso do cenário citado neste texto e no próximo a questão de segurança é relavada uma vez que as aplicações estarão se comunicando apenas entre elas e não expostas para consumo por terceiros. Fora que muitas dessas questões realmente se aplicam se o sistema começar a se tornar API para terceiros e não para um sistema próprio; desenvolvimento de APIs não requer que, necessariamente, o cliente tenha que acessar elas diretamente.

E, além disso, a abordagem apresentada no texto pode parecer *overkill* por se tratar de apenas uma função em um código R. Todavia se partimos do princípio que o pacote R tivesse várias funções, muitas vezes todas essas funções se encontrariam fechadas apenas para desenvolvedores R e em aplicações feitas em R.

![14106046544_aa1ea6bd15_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627298925283/UnFoIIG2yC.jpeg)

["Suspendu - Moment of doubt"](https://www.flickr.com/photos/96092563@N08/14106046544) by [Max Sat](https://www.flickr.com/photos/96092563@N08) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)  

## Apêndice II

Um dos cernes para se construir uma boa API pode ser transaladado do príncipio F.I.R.S.T

- Fast (*Rápido*): teste lerdo acarretará em uma correção mais lerda ainda, o que vai acabar deixando o código apodrecendo
- Independent (*Independente*): quando um teste depende em outro, a falha em no primeiro irá causar um efeito cascata de erros, dificultando o processo de depuração
- Repeatable (*Repetível*): rodar nos mais diversos ambientes buscando simular diversas possibilidades pro códgio se comportar de maneiras não previstas
- Self-validating (*Auto-Validativo*): o teste passa ou não passa
- Timely (*Oportuno*): testes vem primeiro e o código vem depois

O último tópico será melhor explorado com as bases de Test Driven Development (TDD) e suas três regras básicas em um texto já em produção.

Linguagens vem e vão, mas aplicações boas ficam: o Google começou o Translate em C++ e reescreveu ele em Go, só que não supreederia ainda ter código em C++ pelos mais diversos motivos ainda sendo chamado em Go por meio de APIs. Hoje várias aplicações também podem chamar tais APIs, sejam elas feitas em TypeScript + Node como o [AnlistBot](https://github.com/Fazendaaa/AnilistBot) ou até mesmo em um sistema embarcado como o Google Home/Nest Mini na hora que você invoca um *"hey, Google..."*

![7989100872_30f0546723_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1627228344260/Lfo6TiwHm.jpeg)

["warning sign"](https://www.flickr.com/photos/29233640@N07/7989100872) by [Robert Couse-Baker](https://www.flickr.com/photos/29233640@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Refêrencias

- [What is an API?](https://www.redhat.com/en/topics/api/what-are-application-programming-interfaces)
- [The Economics of LEGO](https://youtu.be/zsHXFEOV83g)
- [The Pragmatic Programmer](https://www.amazon.com.br/Pragmatic-Programmer-journey-mastery-Anniversary/dp/0135957052)
- [Relational and Algebraic Methods in Computer Science](https://www.springer.com/gp/book/9783319062501)
- [FarmNotes](https://fazendaaa.github.io/FarmNotes/)
- [the actual osi model](https://computer.rip/2021-03-27-the-actual-osi-model.html)
- [Finitary relation](https://en.wikipedia.org/wiki/Finitary_relation) 
