# Cansado de pagar caro com o shinyapps.io? Nada mais de 'vendor lock-in'

foto de capa:  ["Free as in Reflection"](https://www.flickr.com/photos/37996646802@N01/28913995283) by [cogdogblog](https://www.flickr.com/photos/37996646802@N01) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

> BYOD... "Bring Your Own Docker"

Com US$: 39 por mês -- aproximadamente R$: 209.39 segundo o Google enquanto esta matéria é escrita -- você pode ter:

- **APENAS** 500 horas de serviço por mês -- quase 21 dias se você tiver apenas **UMA APLICAÇÃO** rodando 24h, 7 dias por semana
- "Premium" **E-MAIL** suporte -- ou seja, nada de um chat no site deles caso sua aplicação fique fora do ar sábado às 7h AM
- *Vendor lock-in* -- o que basicamente significa que você tem dificuldade de sair do sistema deles para outras soluções

![3212174290_51c9d529ea_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594863053049/ntBxScRmV.jpeg)

 ["Snow day"](https://www.flickr.com/photos/65772999@N00/3212174290) by [indigo_veil](https://www.flickr.com/photos/65772999@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Antes de continuar, se você se sente confortável com tudo isto e não se sente "ultrajado" por tais termos, por favor, este texto não é para você. Alguns pontos que quero mostrar são os seguintes:

- A plataforma é cara para o que entrega
- Caso amanhã ou depois o sistema tenha que rodar na infra de um cliente, provavelmente terá dores de cabeça para fazer funcionar
- Falta de um "analytics" avançado do sistema rodando

E só um lembrete: não conheço as pessoas que trabalham na empresa nem tenho nada contra elas e/ou a empresa em si -- não dúvido que seja um lugar incrível para seus clientes e talvez até ótimo para os funcionários --; a ideia deste texto é evitar com que você gaste dinheiro desnecessariamente, seja para fazer ele rodar quando a aplicação crescer ou até mesmo com o port dela para rodar em outro tipo de infra depois.

Assim como você pode usar muitas vezes uma chave de fenda no lugar de uma Philips, tudo bem, isto funciona... *"Mas você deveria fazer isso?"* R: em ambos os casos uma hora vai espanar.

Como [esta palestra](https://youtu.be/Wy3TY0gOmJw) mostra belamente, muitos problemas ao usar o framework em si são """crônicos""" dele e não de onde você roda sua aplicação.

Se você só tem que rodar uma demo de alguns dias ou até mesmo um projeto de faculdade/pesquisa, por favor vá em frente e use sim o [shinyapps](shinyapps.io) (SA); do contrário, aproveite o texto.

## Os tiers

![3505700025_2c5095208a_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594863313390/EvSfkLOhb.jpeg)

 ["On the Level"](https://www.flickr.com/photos/22375189@N08/3505700025) by [aaronHwarren](https://www.flickr.com/photos/22375189@N08) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

I. Caso o seu caso de uso seja realmente um 'hobbyista', a galera do SA possue uma oferta gratuita que te permite subir até cinco aplicações durante 25h por mês.

II. Caso as 25h não sejam o suficiente, você pode ter até 100h e 25 aplicações por US$: 9,00 --aproxiamadamente R$: 48.34 -- por mês

III. A opção citada no começo do texto te permite um número ilimitado de aplicações. Mesmo que se você rodar as 25 limitantes da úlima opção, com as 500h disponíveis, você teria menos de 9h por mês para cada aplicação ficar online

O plano *Basic* que é o citado no terceiro item é o que aparece em destaque na página do SA, mas ainda há dois planos "superiores" à ele.

IV. Por US$: 99 -- aproximadamente R$: 531.61 -- por mês o sistema sobe para 2 000h, o que são aproximadamente 3 dias apenas caso ainda tenha as 25 aplicações rodando por mês

V. E por US$: 299 -- aproximadamente R$: 1,605.56 -- por mês o sistema sobe para 10 000h, o que seria "meio" mês para as mesmas 25 aplicações

Um ponto importante, principalmente para quem vai colocar uma aplicação em produção, é que mesmo nas duas últimas opções **o suporte ainda é por e-mail.**

Seguindo a ideia de *"The Good, The Bad  and The Ugly"*:

- Good: I
- Bad: II
- Ugly: III, IV, V

![4123460657_48b42d2441_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594862782025/A6SNPxwEg.jpeg)

 ["Shared Loneliness"](https://www.flickr.com/photos/40568175@N07/4123460657) by [Vassilena](https://www.flickr.com/photos/40568175@N07) is licensed under [CC BY-NC-SA 2.0 ](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

O modelo de serviço oferecido pelo SA muitas vezes lembra o modelo de "pulsos" a mais que você pagava por uso a excedente de internet no começo dos anos 2000; no final do mês você sabe -- tem certeza -- que vai acabar pagando o "extra" atrelado ao seu pacote.

## A competição

> Ela é inexistente

O sistema de host ofertado pelo shinyapps é "o melhor" não por mérito próprio, mas sim por falta de competição para este mercado. A ideia do pessoal do SA é um sistema "serverless" onde você só manda o código e eles fazem ele rodar. Este modelo de serviço fez e faz várias empresas crescerem no mercado assim como:

- [Heroku](https://www.heroku.com/)
- [DigitalOcean](https://www.digitalocean.com/)
- [Firebase](https://firebase.google.com/)

Todavia, essas empresas cresceram pensando em rodar serviços Java, Node.js, Ruby, Python e etc. Em R +Shiny basicamente só a galera do SA pega o mercado como um todo.

### Docker

![2218589271_22922b32a7_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594876821934/hKXQ1utZp.jpeg)

 ["Containers"](https://www.flickr.com/photos/21204656@N05/2218589271) by [s_volenszki](https://www.flickr.com/photos/21204656@N05) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

Caso você parta para uma abordagem baseada em Docker, poderá ter uma tecnologia que até 2022 será a coluna vertebral de mais de 75% dos serviços em produção; maior a demanda, maior a oferta, menores preços. Alguns das grandes empresas no cenário são:

- [Azure](https://azure.microsoft.com/pt-br/)
- [Google Cloud Plataform (GCP)](https://cloud.google.com/)
- [Amazon Web Services (AWS)](https://aws.amazon.com/)

Agora, com relação as vantagens de se escolher o Docker:

- A máquina do desenlvovedor, nuvem e a infra do cliente falam a mesma língua -- nada mais de "mas na minha máquina roda"
- Menos consumo de recursos, menos consumo de energia, menos hardware potente... Em suma: menos gastos e, em alguns casos, por 1/3 do preço atual
- Facilidade de atualizar a aplicação sem quebrar o host e vice-versa
- Ao mesmo tempo que empodera o desenlvovedor, flexibliza a vida do time da infra que for rodar o sistema porque conseguem verificar, validar e executar tudo com maior nível de segurança, disponibilidade e redundância
- Caso tenha que portar para outros ambientes de produção como Virtual Machines (VMs) ou até mesmo o SA, vai conseguir com facilidade pois o Docker roda baseado no `Dockerfile` -- um arquivo de texto com a listagem de dependências de sistema
- etc

Estes provedores permitem que você tem uma granularidade, em nível de infra, muito maior e possa sim fazer análise delas mais intensas com o [Kubernetes](#Kubernetes), mesmo que você só envie um `Dockerfile` ou um `docker-compose.yml` para eles, muito provavelmente eles estarão rodando um orquestrador como o citado para gerenciar todos os serviços de todos os clientes.

### Kubernetes

> Não é 100% do mercado, mas é a tendência

![29357900440_e85964a368_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594868563282/xib1hbDe9.jpeg)

 ["I Remember When the Future was Unevenly Distributed"](https://www.flickr.com/photos/37996646802@N01/29357900440) by  [cogdogblog](https://www.flickr.com/photos/37996646802@N01) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich) 

Se você subir na nuvem ou até mesmo rodar na infra local, Kubernetes é normalmente o orquestrador de containers utilzado para poder gerir os recursos compartilhados entre as máquinas. Caso você esteja no Windows ou Mac, ele já vem com o seu Docker Desktop.

**TODAVIA**... Não desenhe sua aplicação pensando do zero como um *"serviço que deva ou que vá rodar em Kubernetes"*, comento isso porque as dores de cabeça que fazer querer rodar algo no Kubernetes que não precisa ou que não """deveria""" rodar nele, pode trazer mais dores de cabeça do que respostas.

Caso queria "brincar" com Kubernetes em casa, recomendo começar com um  [Rancher](https://rancher.com/) e, `coincidentemente`, todos os meus textos postados aqui até então te permitem fazer isso e na ordem que foram postados. A vantagem do Rancher é que seja on cloud e/ou on premise, você consegue de gerenciar de maneira simples os seus clusters.

## Baixa performance

Como já citado anteriormente, o [`shiny`](https://shiny.rstudio.com/) em si não é o framework potente como um [`express` pro Node.js](https://expressjs.com/), [`HUGO` pro Go](https://gohugo.io/), [`Django` para o Python](https://www.djangoproject.com/) e etc... Mas esta não é a ideia dele, nunca foi e, pelo jeito, nunca vai ser; a ideia é permitir com que pessoas de um alto conhecimento técnico de outras áreas sem ser Ciências da Computação voltada para web como **Química, Física, Engenharia e etc**, consigam fazer um sistema web completo.

Caso você já tenha um projeto em `shiny`, rode na sua máquina -- idependente de Docker ou não -- e abra um navegador baseado em Chromium para poder ver o output do [Lighthouse](https://developers.google.com/web/tools/lighthouse):

![image891.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594870107774/Ll333gHgr.png)

Este é o output do projeto [`R + Shiny + Mongo + Docker`](https://github.com/Fazendaaa/RSMD), que basicamente é um "hello, world!" dos projetos com esta stack e, mesmo assim, a performance foi baixa.

Este ponto pode não ser importante para ti, mas para muitas pessoas que vão ter que rodar tais sitemas em uma rede 3G pode ser um grande problema.

### Flexibilidade

Independentemente de onde escolha rodar sua aplicação, caso a demanda aumente, sempre se lembre que normalmente há dois tipos de se aumentar a oferta para um sistema:

1. *Scale up* -- dê mais poder a cada instância
2. *Scale out* -- instancie mais recursos

Como sempre ressaltado pelo excelente [Elemar Jr](https://twitter.com/elemarjr) nos podcasts, vídeos e textos dele, a ideia de se utilizar a palavra "elasticidade" para representar a ideia de "escala" de uma aplicação é importante; isto porque muita pessoas pensam em escala como sendo algo apenas com um coeficiente maior que um, ou seja, como se algo apenas cresce. A palavra elasticidade neste contexto é importante para poder representar a ideia de uma aplicação que cresce também pode ser reduzida, ela é *elástica*.

Qualquer uma das duas abordagens são claras para quem utiliza um sistema cloud native, se você utilza apenas um container na nuvem ou se tem o seu próprio cluster Kubernetes on premise.

## Onde o diabo mora?

> Nos detalhes

![2800818_0ae1e982b2_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594879968365/6HKKme1EE.jpeg)

 ["Crosswalk devil"](https://www.flickr.com/photos/70991854@N00/2800818) by [Arlette](https://www.flickr.com/photos/70991854@N00) is licensed under [CC BY-NC-SA 2.0 ](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Por se tratar de um serviço com pagamento em dólar apenas eu posso infereir com certo nível de segurança que o sistema não possuí servidores no País, por isso utilizei três empresas de exemplo que possuem servidores por aqui pelos seguintes pontos:

- Países
- Leis
- Impostos
- Suporte
- Eventos
- etc

Voltando, se você chegou até está parte do texto e não é uma empresa, alguém que leva fazer Shiny além para aprender como rodar Shiny + Docker -- seja por prazer ou semi-profissionalmente --, não são estes pontos citados que vão te fazer sentir na pele de quem por motivos principalmente empresariais pensariam o seguinte ao ler cada um desses tópicos:

- Países: *"sou uma empresa local mas preciso fazer deploy para um cliente na Índia. Como vai ficar a latência se eu subir em um servidor fora de lá?..."*
- Leis: *"devo me preocupar com LGPD/GDPR?..."*
- Impostos: *"vou pagar os impostos do cartão de crédito apenas? Meu cliente que paga eles? Como fica?..."*
- Suporte: *"Meu time de desenvolvedores não fala inglês, como meu ficaria se precisararmos de ajuda?..."*
- Eventos: *"Shiny eu sei que tem uma comunidade forte. Mas existe documentação boa para o shinyapp.io? E em português?..."*
- etc: *"quais mais coisas que ele não falou que são importantes?..."*

## "Não há almoço de graça"

Em suma, mais do que chegar em uma "conclusão" *per se*, mas sim levantar pontos como:

- Existem outras possibilidades
- Há como se chegar ao mesmo resultado desenhado de formas diferentes os caminhos
- Levantar o aviso que com a oferta de Docker subindo, você pode salvar gastos
- Evitar processos custosos como ports de aplicações
- etc

Mesmo se tudo levantado não fizer sentido para ti, tudo bem, sua aplicação pode ser que não se encaixe nos moldes apresentados, só isso.

![15391440780_5acd25c613_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594880778617/KJayYXDAr.jpeg)

 ["Scales"](https://www.flickr.com/photos/49502985568@N01/15391440780) by [Hugo!](https://www.flickr.com/photos/49502985568@N01) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich) 

## Apêndice

Como sempre, procuro ser breve nos textos, mas gostaria de levantar outros pontos a serem considerados:

- Não há um Service Level Agreement (SLA) facilmente encontrado na página de preços do SA, os outros serviços normalmente deixavam claro isto nela ou em outra parte do site

- Não quebrei de propósito os preços de nuvem da Azure, do GCP e AWS porque muitas vezes essas empresas ofertam planos personalizados para cada cliente, ainda mais se você já as utilize atualmente -- um Office 365 ou um G Suite

- ARM suporte? RISC-V suporte? -- só querendo ser babaca aqui mesmo, mas são duas coisas que eu me preocupo nas próximas duas décadas

- APIs como as do Google e Azure de análise de dados, mapas, compressão de arquivos e etc

- Caso queria ir a fundo em subir Shiny + Docker + Kubernetes:

    I. [Configurando Rancher em um ARM](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf)

    II. [Como distribuir código para rodar em diversas arquiteturas? R: Docker buildx](https://fazenda.hashnode.dev/como-distribuir-codigo-para-rodar-em-diversas-arquiteturas-r-docker-buildx-ckc5i3ogj00bllps10znnbyio)

    III. [Nuvem de terceiros quando você pode ter a sua própria em casa com o clique de um botão?](https://fazenda.hashnode.dev/nuvem-de-terceiros-quando-voce-pode-ter-a-sua-propria-em-casa-com-o-clique-de-um-botao-ckccpbe5k005sqgs18e89h4ik)

    IV. [Análise de dados + Site + Banco de Dados? Tudo no isso seu PC e sem precisar instalar o R, Shiny e o Mongo](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo-ckcfwjz380058kns13oye8f03)

- Vou colocar ums scripts para subir a demo de [`R + Shiny + Mongo + Docker`](https://github.com/Fazendaaa/RSMD) no diferentes cloud providers citados. Se eu não fizer a tempo ou você quiser que eu faça testes em algum citado, fique a vontade para abrir um Pull Request (PR) pedindo ou fique a vontade para você mesmo subir ele :)

- Não foi citado porque ainda pretendo escrever sobr Integração Contínua e Entrega Contínua com a stack RSMD mais para frente. Este é um ponto importante ainda mais por [multi-stage buildings](https://docs.docker.com/develop/develop-images/multistage-build/)

## Referências

- [shinyapps.io](https://www.shinyapps.io/#pricing)
- [Kubernetes and Container Security and Adoption Trends](https://www.stackrox.com/kubernetes-adoption-and-security-trends-and-market-share-for-containers/)
- [Kubernetes is Now Available In Docker Desktop Stable Channel](https://www.docker.com/blog/kubernetes-is-now-available-in-docker-desktop-stable-channel/)
- [awesome-serverless](https://github.com/anaibol/awesome-serverless)
- [6 Best Practices for Creating a Container Platform Strategy](https://www.gartner.com/smarterwithgartner/6-best-practices-for-creating-a-container-platform-strategy/)
- [Microsservicos Kubernetes e SRE no Gympass](https://hipsters.tech/microsservicos-kubernetes-e-sre-no-gympass-hipsters-on-the-road-29/)
- [Débito Técnico na Quero Educação](https://hipsters.tech/debito-tecnico-na-quero-educacao-hipsters-on-the-road-27/)
- [Amazon EC2 C6g and R6g instances powered by AWS Graviton2 processors are now generally available](https://aws.amazon.com/about-aws/whats-new/2020/06/amazon-ec2-c6g-r6g-instances-amazon-graviton2-processors-generally-available/)

