# Testes vs Sondagem

foto de capa: "[Bungee Jumping II](https://www.flickr.com/photos/8070463@N03/19558346556)" by [Tambako the Jaguar](https://www.flickr.com/photos/8070463@N03) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=openverse).

> *"Whatever you lose, you’ll find it again. But what you throw away you’ll never get back."* — Kenshin Himura (Rurouni Kenshin: Meiji Kenkaku Romantan)

## Intro

Em desenvolvimento de software, existem várias palavras chaves que fazem com o que até então pessoas seculares sejam vistas como algo digno de um ser que detém toda proficiência que uma arte possa oferecer; uma delas é o domínio de testes.

Testes em desenvolvimento de software podem ser:

- Métricas (qualitativas/quantitativas)
- Ferramentas de automação
- Instrumento de manutenção
- Critério de aceitação
- etc

**Testes tem a ver com comportamento**. Implementação por si só pode ofuscar a importância do comportamento do código uma vez que critérios como: parâmetros de entrada, variáveis de execução, tempo de execução, casos de borda, etc, dizem mais sobre a amplitude de uso do que se usar uma matrix ou data frame para representar o resultado é a melhor maneira de apresentar os dados analisados.

Por isso que o TDD (Test Driven Development) influência muito ao evitar que testes "póstumos" -- após o código ser implementado -- possam carregar o viés de como ele foi implementado em si para a bateria de validação, o que acarretaria com que seja verificado aquilo que foi implementado, propagando um viés de confirmação pra codabase. Uma vez que os testes são delimitados antes do código em si, as possibilidades de uso ficam claras desde o inicio, impedindo que o código entregue de menos ou que entregue mais do que o esperado -- o que pode ser um cenário ruim quando critério de aceitação é tempo para uma feature nova estar no ar.

A partir do momento que o que é esperado de um código fica claro e determinado com casos de testes para validar ele, isso pode ser utilizado como um "cronograma" de entregas do sistema, sendo a ideia de o planejamento sempre vir primeiro para poder auxiliar nas etapas de desenvolvimento.

Testes além de serem uma "filosofia" que pode ser transladada de linguaguem para linguagem com menos atrito do que sair de um paradigma para outro, como, por exemplo, de orientados a objeto para funcional; eles também permitem que alguns frameworks possam derivar e suplementar sua composição, apresentando desta maneira um ambiente mais amigável onde plugins se comunicam entre si para apresentar análises diferentes do mesmo cenário. Tal abordagem entrega resultados mais rico do que o ferramental de outras stacks de desenvolvimento -- como ERPs, waearables, mobile, etc -- que buscam proativamente não se comunicarem entre si ou até mesmo deprecaraem métodos antigos para forçar o usuário a atualizar para uma versão nova. Criando assim um ciclo de muito esforço de manutenção de código para um retorno que, em muitos cenários, não entrega um benefício claro pra codebase.

![9264179792_50db301af7_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660705763122/9niE8JUed.jpg align="left")

"[reflexion/reflection](https://www.flickr.com/photos/44284392@N04/9264179792)" by [-MRGT](https://www.flickr.com/photos/44284392@N04) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

## Conto de fada

Um exemplo, por mais fictício que seja, de problemas como esse é no livro [Jurassic Park](https://www.amazon.com/Jurassic-Park-Novel-Michael-Crichton/dp/0345538986). O sistema de contagem de dinossauros não reparou que havia mais dinos no parque do que deveria, isto porque o sistema em si foi feito para contar até o número limite que eles determinaram; ou seja, quando os dinos comecaram a se reproduzir entre si para os gerenciadores do parque eles não sabiam da superpopulação justamente porque o sistema foi feito com a mentalidade de "conte o número de dinossauros que fizemos" ao invés de "conte o número de dinossauros que tem no parque".

No livro não falam se há ou não testes, mas se tivesse um teste que mudasse o número de dinossauros no parque para algo absurdo como 500 mil e o sistema so retornasse 100, pegaria uma falha de implementaçõe desta; justamente por isso que um teste tem que ser desacoplado da implementação. 

![30740898616_8d75f5f970_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660580977617/t5rUTulkG.jpg align="left")

"[ASCF2886](https://www.flickr.com/photos/22238578@N06/30740898616)" by [Lucas Falcão](https://www.flickr.com/photos/22238578@N06) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

Além da assertividade de novas entregas em um sistema de porte grande sem quebrar requisitos já implementados, a bateria de testes pode garantir algo grande como uma mudança de ferramentas de implementação ou dependências em si mas assegurando a compatiblidade de comportamento.

No caso de uma bateria de testes de uma API, uma vez que seus endpoints e comportamentos são claros, a implementação dela em si pode ter mudado durante os anos. No exemplo apresentado do livro, vamos dizer que o sistema em si tinha sido implementado em [Ada](https://www.adacore.com/about-ada) e será reimplementado em [Python](https://www.python.org/); uma rescrita linha por linha do código carregaria o erro de implementação original. Se, neste período, houvesse uma bateria de testes -- escrita em [Node](https://nodejs.org/en/) por exemplo --, a reimplementação do código poderia ser validada pelo consumo das APIs independentemente da linguagem em si -- uma vez que o erro apresentado fosse corrigido.

## Primeira linha de frente

Algumas pessoas na comunidade de desenvolvimento consideram linters e sistemas de tipagem como ferramentas de testagem por ser uma primeira validação de confromidade. Todavia, particularmente neste texto, este tipo de aboradagem não será defendido; não porque tais ferramentas não tenham o seu valor em si, mas sim porque testes, como aqui aprensentados, são a conformidade de entradas e saídas de um processo sem se preocupar necessariamente com a implementação. A partir do momento que ferramentas de normalização de escrita são colocadas como "testes" isto abre margem pra dizer que se um código foi escrito com as interfaces necessárias e seguindo a norma especificada mas não entrega aquilo que deveria -- seja qualitativamente ou quantitativamente --, isso seria um código testado por definição; o que não é o intuito dos testes em si.

Outro detalhe importante é que um código testado não significa necessariamente é um código "certo". Uma função de soma que recebe 1 e 1 e retorna 3 pode ter sido implementada seguindo guidelines de linters, com casos de testes e passa pela bateria de validação, mas estar completamente errada em princípio. Os casos de testes facilitam uma vereficação do comportamento do código em alguns cenários mas não necessariamente a correctitude das respostas. Ou seja: **validação não significa estar certo**.

![4315346778_3b843a7660_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660590408935/OfiYjpamop.jpg align="left")

"[Battle Front](https://www.flickr.com/photos/40645096@N04/4315346778)" by [United States Forces - Iraq (Inactive)](https://www.flickr.com/photos/40645096@N04) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=openverse).

## A soma das partes

Testes podem ser segmentados em:

- Unitários
- Integração
- Carga/stress
- Ponta a Ponta
- etc

Todos esses cenários e muitos outros servem para analisar com qual "lente" o código será avaliado.

Um código legado que foi escrito de maneira não prudente pode não ter testes unitários mas isso não o impediria de ter testes de integração, para garantir que pelo menos uma versão nova do sistema não quebraria em casos conhecidos. Já ponta a ponta garantiria que ao subir uma nova build de API, o sistema iria se comportar com o mesmo tipo de chamada definida pela build nova do app mobile, salvando determinada informação como o esperado no banco de dados.

Uma das vantagens justamente da pluraridade de testes é poder mais do que simular casos de uso, é tambem "documentar" a experiência de vida do código.  Além de tudo isso, eles permitem também distribuir a própria etapa de validação e aplicar análises derivadas dela que tem a ver com a qualificação do código.

Tais tipos de validação permitem até que um cliente teste o código sem necessariamente ter acesso a implementação dele, servindo até como um documento de entrega para garantir que o que foi entregue é o esperado.

Outra parte importante dos testes é a não redundância de implementação, algumas ferramentas utilizam os testes de código para ver se testes similares entre si representariam consequentes reimplementações de código.

![9408028555_78328e818e_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660602206030/8xuBVpE4Q.jpg align="left")

"[Sharpest tool in the shed](https://www.flickr.com/photos/43117091@N00/9408028555)" by [Lachlan](https://www.flickr.com/photos/43117091@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## A Roupa Nova do Rei

Sondagens são pseudo-metodologias de validação de código, são procedimentos sem valor nenhum pra vida do código como critério de garantia de que o comportamento está como o esperado, fora que também não agregam nenhuma métrica qualitativa ou quantitativa, muito menos tem valor de delimitadores de escopo/responsabilidade.

Uma vez que sondagens não atuam como critérios de aceitação do código por não serem reproduzíveis por outros a não ser aquele mesmo que a aplica, acabam por se tornar um dos principais pontos de falha de um código por ter um conflito claro de interesses uma vez que o indivíduo que tem que liberar esta "aceitação" do código é o único que pode aplicar ela. Além de que muitas vezes este mesmo sondador não é nem um Project Owner (PO) que não teve contato com o codebase; deixando ainda mais claro o interesse de aplicar esta bateria para que possíveis erros de implementação passem pelo filtro aplicado.

Uma vez que tal abordagem ainda não mantem um registro de mudanças e a aplicação atual não necessariamente condiz com as anteriores, critérios se tornam mais ainda subjetivos do que já eram.

Assim como no conto do rei que acreditou na roupa invísivel que só os especiais poderiam ver ela, o metódo de sondagem é apenas uma repaginação para desenvolvimento de software onde só aqueles que acreditam naquilo que não existe de mensurável que conseguem justificar tal atrocidade dessas.

*Se a sondagem aborda e entrega tudo, ela não aborda e entrega nada.*

![6080827214_2fef11892d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660663242545/QHX5--wQM.jpg align="left")

"[The Mechanical Turk](https://www.flickr.com/photos/34635043@N04/6080827214)" by [Catablogger](https://www.flickr.com/photos/34635043@N04) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

## Exemplo

O projeto de exemplo será o [RSMD](https://github.com/Fazendaaa/RSMD), que ja é utilizado para exemplificar muitos dos textos aqui trabalhados:

- [Análise de dados + Site + Banco de Dados? Tudo no isso seu PC e sem precisar instalar o R, Shiny e o Mongo](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo)
- [Site de análise de dados... Mas na verdade é um app no Android, Windows, Mac e no seu iPhone](https://fazenda.hashnode.dev/site-de-analise-de-dados-mas-na-verdade-e-um-app-no-android-windows-mac-e-no-seu-iphone)
- [Cansado de pagar caro com o shinyapps.io? Nada mais de 'vendor lock-in'](https://fazenda.hashnode.dev/cansado-de-pagar-caro-com-o-shinyappsio-nada-mais-de-vendor-lock-in)

Para rodar os testes na sua máquina basta abrir seu terminal e:

```shell
git clone https://github.com/Fazendaaa/RSMD
cd RSMD
make test
```

Um exemplo de teste do tipo unitário é a bateria descrita em `tests/testthat/test.histogramModel.R`:

```R
test_that('histogram model 1000', {
    expect_equal(histogramModel(1000), 1000)
})
```

Já um outro exemplo de teste de integrção seria na mesma codebase seria `tests/testthat/test.api.R`:

```R
test_that('Eratosthenes Sieve 1000', {
    result <- c(
        2,   3,   5,   7,  11,  13,  17,  19,  23,  29,  31,  37,  41,  43,  47,
        53, 59,  61,  67,  71,  73,  79,  83,  89,  97, 101, 103, 107, 109, 113,
        127, 131, 137, 139, 149, 151,157, 163, 167, 173, 179, 181, 191, 193,197,
        199, 211, 223, 227, 229, 233, 239, 241, 251,257, 263, 269, 271, 277,281,
        283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359,367, 373,379,
        383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457,461,463,
        467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563,569,571,
        577, 587, 593,599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653,659,
        661, 673, 677, 683, 691, 701,709, 719, 727, 733, 739, 743, 751, 757,761,
        769, 773, 787, 797, 809, 811, 821, 823, 827,829, 839, 853, 857, 859,863,
        877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953,967, 971,977,
        983, 991, 997
    )

    expect_equal(eratosthenesSieve(1000), result)
})
```

Uma vez executado o comando `make test`, você poderá ver um resultado assim no terminal:

```shell
ℹ Loading RSMD
ℹ Testing RSMD
✔ | F W S  OK | Context
✔ |         1 | test.api [0.1s]
✔ |         1 | test.histogramModel

══ Results ═════════════════════════════════════════════════════════════════════
Duration: 0.2 s

[ FAIL 0 | WARN 0 | SKIP 0 | PASS 2 ]
>
>
```

O importante é ressaltar que neste caso o teste de integração só funcionam porque estamos rodando os eles atravé do [docker-compose](https://docs.docker.com/compose/), que por si só ira alocar a estrutura de API que o código se comunique e consiga fazer o request para o third-party, recebendo o resultado de volta. Esta abordagem permite que a granularidade do ciclo do software cresca, quebrando em três ambientes:

- Desenvolimento (local)
- Homologação (validação em nuvem)
- Produção (software publicado)

![6940633029_8417a1a9e3_b.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660609913291/Co2FGjhib.jpg align="left")

"[diy pallet furniture](https://www.flickr.com/photos/33534994@N00/6940633029)" by [©HTO3](https://www.flickr.com/photos/33534994@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

## TL;DR:

Testes são:
- Acessíveis
- Baixa barreira de entrada
- Reproduzíveis
- Baratos
- Validáveis
- Escaláveis
- Distribuidos
- Não lineares por natureza
- Facilitadores de automação de:
  - upgrades de dependências e versão da linguagem
  - integração de código
- Delimitadores de escopo
- Independentes -- não precisam ser supervisionados
- Verificadores de comportamento em ambientes diferentes

Sondagens são:
- Caras
- Não reproduziveis/Critérios arbitrários
- De alta barreira de entrada -- Requerer pessoal com alto conhecimento do codebase
- Muitas vezes irrelevantes pra aplicação -- por não atacar o core da aplicação em si
- *Face value* -- você tem que acreditar no que foi repassado/feito sem poder necessariamente questionar
- Difíceis de escalar
- Não distribuíveis
- Lineares
- Não versionados
- Não independentes -- precisam ser supervisionados
- "Travados" -- só funcionam em um ambiente

TL;DR: *sondagens são localizadas e centralizadas enquanto testes são distribuidos e descentralizados*

![28014928767_291bb51d17_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660606929544/yKNxZl-6R.jpg align="left")

"[Swiss precision work](https://www.flickr.com/photos/98786299@N00/28014928767)" by [PeterThoeny](https://www.flickr.com/photos/98786299@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

## Em suma

Testes são como ativos da sua empresa enquanto sondagem sé agrega um passivo depreciativo pra toda operação, ainda mais pelo situação de não escalar e gerar um gargalo de produção. Testes manuais não são sondagem, testes manuais são documentados e reproduzíveis; sondagens são maneiras abritárias de dizer que o código foi verificado sem outras pessoas poderem reproduzir o que foi feito com o inutito de quem aplica ganhar certa credibilidade por isto e não entregar valor ao código por si só.

O intuito do texto não é ser um "Guia Definitivo" sobre testes nem nada do tipo, muito mais foi deixado de fora do que tocado pelo texto em si; mas a ideia é pontuar benfícios da abordagem e, ao mesmo tempo, poder explanar cenários e argumentos para que eles sejam mais amplamente utilizados, além de pincelar mais sobre os dois estilos que mais são comentados: unitários e integração; sendo que o primeiro é mais interessante para aqueles que desenvolvem uma biblioteca, uma vez que o seu trabalho pode ser consumido de várias manerias diferentes e uma validação prévia auxlia no desenvolvimento a priori da entrega dele, já o segundo há mais a vantagem de agregar valor para aqueles que consomem vários sistemas diferentes e os integram entre si.

Testes também auxiliam a evitar o famoso: *"na minha máquina funciona"*. Fazendo com que desenvolvedores entreguem código de uma maneira distribuida e que também tenham uma compreensão maior do código que acabaram de receber para poder mexer.

Eles auxiliam o desenvolvedor a ter uma noção de como o código poderá ser utilizado depois e planejar otimizações ou não, além de sugerir novos cenários. O que dá uma visão quase que total da cadeia do código, evitando assim o famoso profissional "apertador de parafuso", assim como é mostrado em [Tempos Modernos](https://www.youtube.com/watch?v=6n9ESFJTnHs).

E uma nota válida de ser ressaltada é que: *desenvolvimento de software por si só não entrega garantia de qualidade*.

![46220107282_cb4f865da0_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660602400367/mlbgPwZAh.jpg align="left")

"[Four different spaceships | Vier verschiedene Raumschiffe](https://www.flickr.com/photos/72482589@N07/46220107282)" by [Astro_Alex](https://www.flickr.com/photos/72482589@N07) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

## Apêndice

A leitura dos apêndices é recomendada para estudantes de computação ou profissionais da área, caso você esteja apenas começando ela pode acabar sendo um pouco "largada" demais por não elaborar muito os pontos, nem sequer direcionar, muito menos se auto-explicar. Isto é porque outros textos irão elaborar mais sobre isso; alguns que serão complementares ao apresentado aqui tocarão em assuntos como:

- Continuous Integration (CI)
- Continuous Deployment (CD)
- Publicar um pacote
- Pentest
- Canary development
- Chaos Monkey
- etc

E caso você tenha lido o código do RSMD e visto diferença da sua verão atual com a anterior por causa do [renv](https://rstudio.github.io/renv/articles/renv.html), isto ainda será tratado em um texto futuro.

![5833015535_3973acaffb_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660709754811/rrCdsTk8P.jpg align="left")

"[Macro fork](https://www.flickr.com/photos/29468339@N02/5833015535)" by [@Doug88888](https://www.flickr.com/photos/29468339@N02) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

### Quando não usar testes

Ir de chinelo na padaria da esquina é diferente de ir de chinelo em uma entrevista de emprego. O uso de testes também pode ser visto de maneira similiar.

Alguns cenários que eu, particularmente, não colocaria testes:

- Estou aprendendo uma linguagem e tenho pouca familiariadade com programação -- por mais que testes ajudem um veterano a pular de linguagem a linguagem, à um iniciante ele pode um empecilho por ser um ponto a mais de aprendizado, o framework de testes pode trazer muitas configurações que distanciam o iniciante do código/aprendizado em si;
- Um script simples que tem um propósito igualmente simples, não tem planejamento de ser derivado ou coisa do tipo. Por exemplo: os códigos compartilhados no gist/StackOverflow, geralmente por mais que o que é entregue seja considerado elaborado, o contexto é limitado, fora que tem que ser de "custo" baixo porque elaborar demais a solução não retornaria valor para quem precisa de ajuda e para quem responde uma vez que o problema em mãos é o foco da discussão;
- Trabalho em grupo de faculdade que muito provavelmente não vão parar no currículo. Geralmente nem todo mundo na faculdade é familizariado com testes, similar com a abordagem de não se apresentar testes a um novato, apresentar testes à um time não homogêneo pode gerar mais atrito e desfocar do objetivo que é a entrega do trabalho;
- etc

Todos esses pontos são em cenários muito de baixo risco caso não tiver testes, seria quase como fazer pastel em casa sem usar luvas e/ou ver um video de alguem fazendo isso no YouTube da mesma forma. Todavia, assim como fazer pastéis feitos sem luva pode parecer algo simples, se fosse em uma operação industrial e/ou um professor em um curso, isto não seria tolerado. Isto porque testes são ferramentas de integridade de processo, falhas em escala minúscula são aceitáveis; já em escalas grandes mesmo a minúscula das falhas pode gerar problemas enormes.

Assim sendo, um ambiente empresarial onde o código/solução tem muito retrabalho, casos de testes poderiam auxiliar a delimitar onde a falha do desenvolvimento em si aconteceu e previnir que outras acontecam. O famoso cenário onde o "*tempo é dinheiro*".

![18861947790_251efe23fa_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660606762643/TZHO3qhdx.jpg align="left")

"[swiss knife](https://www.flickr.com/photos/38176611@N04/18861947790)" by [MANYBITS](https://www.flickr.com/photos/38176611@N04) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=openverse).

### Análise

Ferramentas de testes que isolam os dados do caso de teste em si facilitam também a reimplementação do sistemas em outras linguagens por facilitar tambem a migração da bateria de testes. Além de que alguns testes como os de integração não precisam ser feitos com a linguagem de implementação, como mostrado aqui; por exemplo um teste de integração pode ser verificar se o servidor de páginas realmente está no ar com um script que válida os endpoints após uma versão nova subir, caso tenha alguma inconsistência voltar para versão antiga -- fazendo assim parte do CD.

Testes ajudam tambem a delimitar o que está ou não implementado no código através do comportamento esperado, deixando claro de uma maneira não extremamente técnica o que o código entrega.

E em criterios técnicos, mesmo que se tenha uma codebase em [C](https://en.wikipedia.org/wiki/C_(programming_language)) -- uma linguagem famosa por seu baixo nível --, se os testes forem totalmente implementados nela mesma e tiver um time diverso com diferentes graus de conhecimento e linguagens diferentes utilizando este sistema, outras equipes que consumam esses serviços escritos não necessarimente conseguiriam reproduzir um caso de erro ou sugerir melhorias de performance através de um cenário de testes. Escrever a bateria de teste em Python poderia ser uma maneira de agilizar o processo de depuração do código e facilitar a integração dos times.

![24531532668_ef3ec964f7_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660606839275/sdROfaHGD.jpg align="left")

"[Precision panel placement](https://www.flickr.com/photos/7821771@N05/24531532668)" by [WSDOT](https://www.flickr.com/photos/7821771@N05) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

### Recomendações

- Ler sobre o [TAP](https://testanything.org/);
- Procurar ler sobre linters para entender o que a verificação de implementação pode trazer de benefício para a codebase ficar mais homogênea;
- Se tiver interesse em colocar aquelas badges de README de Github mostrando o status da build, porcentagem de cobertura de testes, etc; um [texto](https://medium.com/@Fazendaaa/como-construir-um-bot-para-telegram-com-node-ts-testes-ci-e-deploy-para-o-heroku-e763b83fc44e) MUITO antigo pode te ajudar com este processo;
- [Test & Code in Python podcast](https://testandcode.com/): nenhum episódio em si em espefício, o feed todo é bom mesmo para assuntos não necessariamente 100% atrelados à testes;
- O livro do Kent Beck sobre TDD: [Test Driven Development: By Example](https://www.amazon.com.br/Test-Driven-Development-Kent-Beck/dp/0321146530);
- Procurar ler sobre [BDD (Behavior Driven Design)](https://cucumber.io/docs/bdd/) para ajudar a entender como evitar refatoração desnecessária e planejar melhor a parte de TDD;
- [DDD (Domain Driven Design)](https://martinfowler.com/bliki/DomainDrivenDesign.html#:~:text=Domain%2DDriven%20Design%20is%20an,through%20a%20catalog%20of%20patterns.) pode auxiliar caso goste de BDD;
- Caso não tenha entendido a foto do Turco Mecânico, a [leitura](https://en.wikipedia.org/wiki/Mechanical_Turk) sobre ele é recomendada para poder entender o paralelo de como o sistema foi feito para ludribridiar.

![6803716862_2401b456ac_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660610102378/P1tdXE_Yb.jpg align="left")

"[Library](https://www.flickr.com/photos/31813931@N03/6803716862)" by [dlebech](https://www.flickr.com/photos/31813931@N03) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=openverse).

## Referência

- [15 testing methods all developers should know](https://circleci.com/blog/testing-methods-all-developers-should-know/)