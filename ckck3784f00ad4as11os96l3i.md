# Site de análise de dados... Mas na verdade é um app no Android, Windows, Mac e no seu iPhone

> Antes de tudo... "Saudades Windows Phone"

foto de capa:  ["Beijing Apple Store"](https://www.flickr.com/photos/22795534@N00/2680396716) by [guanmu.name](https://www.flickr.com/photos/22795534@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

# Intro

Recaptulando o [último post](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo-ckcfwjz380058kns13oye8f03?guid=acf0a5e4-f873-405d-be17-093f889a33b2 ), foi citado a possibilidade de se transformar um site de análise de dados feito com R e Shiny em um app pro celular; todavia o plugin citado era voltado para uma interface com pouca flexiblidade, pesada e que apresentava pouquissimos retornos... Então resolvi [fazer um](https://github.com/Fazendaaa/shinyPWA) que suprisse melhor a necessidade.

![38758228251_007e6a0f00_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594618695900/ZLwLmVUzI.jpeg)

 ["IMG_0769"](https://www.flickr.com/photos/25612179@N00/38758228251) by [Miranda Jan](https://www.flickr.com/photos/25612179@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

# Progressive Web Apps (PWAs)

## O que são?

Basicamente um PWA é quando o site e o navegador conseguem interpretar um site como um "app"... Ou seja, tudo que roda um navegador da noite pro dia pode ser uma um app e o navegador seria a sua "loja" em si.

Você não precisa se preocupar com várias linguagens tipo Kotlin, Switft, Objective C, Java, C# e etc; que além de requerer uma mão de obra muitas vezes mais cara, também requerem ter que pagar uma conta de desenvolvedor para publicar nas plataformas que deseja, o que acaba encarecendo ainda mais o produto.

Você faz o seu site da maneira que mais se sentir conforável -- o que o dinheiro/tempo permitir --, e terá que adicioanar dois arquivos a mais basicamente:

1. Um verificador de compatibilidade do navegador -- basicamente um JavaScript que vai ver se o navegador que o usuário está rodando é compatível; no exemplo a ser mostrado acredito que não chega à 15 linhas de código
2. Um "manifesto" -- `manifest.json` -- que contem informações sobre o seu site como: nome, cor, icones e etc

Pode parecer simples mas é basicamente isto. E, como pode ver, o último projeto já se tornou um facilmente:

![PWA](https://media1.tenor.com/images/7247ed61cdad62f640f05fc08a56d607/tenor.gif?itemid=17780575)

nota: eu sei que um PWA tem **MUITO** mais envolvido nele, mas o grosso é o que foi basicamente citado. Os outros passos como comunicação, push notification, acesso aos dados do celular e etc, já escapariam um pouco do intuito do post.

## História

PWAs, segundo alguns na comunidade, foi uma ideia [envisionada por Steve Jobs](https://medium.com/progressivewebapps/history-of-progressive-web-apps-4c912533a531) quando o primeiro iPhone foi lançado uma vez que a App Store não existia até então. Um fato curioso é pensar que ano passado transitaram [**519 BILHÕES DE DÓLARES**](https://www.theverge.com/2020/6/15/21292203/apple-app-store-ios-apps-billings-revenue-517-billion-2019-antitrust-regulation) por ela -- sendo que a Apple pega uma generosa fatia de 30% disto; ou seja, """míseros""" 155 bilhões de dólares.

![353368957_465a5ede81_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594608726459/TyPo8N2ug.jpeg)

 ["iPhone"](https://www.flickr.com/photos/77526889@N00/353368957)  by [Reder](https://www.flickr.com/photos/77526889@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

RSMD rodando como um app no Mac:

![photo_2020-07-13_01-41-45.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594615411339/Rd9zL612l.jpeg)

## Pontos Importantes

Os PWAs tem a opção de serem acessados por todos os navegadores suportados e adicionados como um 'app'... Alguns sites que já são PWAs -- como o do Twitter, Starbucks, Telegram, Tinder, Uber e etc -- já te perguntam se você quer adicionar eles no seu celular direto quando acessa ele:

![untitled-f000277.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594610213435/97Ntkpzih.png)

A ideia de ter um ícone e ser acessável direto da sua home screen ou até mesmo da sua barra de pesquisa do Windows, é de realmente o seu site ser um "cidadão de primeira classe" onde estiver.

![untitled-f000408.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594610260360/klMSB8KP8.png)

A tela de carregar é outro fator importante, uma vez que vai procurar carregar todos os recursos enquanto o usário espera.

![untitled-f000438.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594610270333/HQItvbqyA.png)

Além da ideia do PWA ter sua própria janela no gerenciador de apps... Seja ele no seu celular ou o *muilt-task view* do seu computador.

![untitled-f000597.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1594610305505/nET0D3iQ0.png)

obs: este é o navegador próprio da Samsung, só que funciona no Chrome mais recente também para os Androids -- e fiz testes com o Edge sem maiores dores de cabeça.

## Não sou dev, por que devo me importar?

Se você acha que o que foi pontuado até agora é muito "mambo-jambo" para sua cabeça, veja desta maneira:

1. **Custo baixo**: não ter que se preocupar mais em fazer 500 apps para Android -- devido a segmentação de mercado e versões do sistema -- , iOS, Windows, Mac e etc... Apenas faça **UM** site -- não que vá fazer diferença em fatia de mercado... "Mas roda no Linux, e FreeBSD também :333"
2. **Time to market**: caso tenha configurado bem um desenvolvimento e entrega contínua, quando o salvarem um código no seu provedor de Git favorito em alguns instantes ele já vai ter atualizado para todos os clientes, sem precisar de ninguém para *"colocar em produção"*
3. *Don't break de web*: este é um dos mais antigos ditados em desenvolvimento, basicamente mostra a preocupação dos desenvolvedores web em fazer um serviço que funciona há décadas continuar rodando.

![405498965_b1d9c68fc1_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594618977569/xsx3FF8j3.jpeg)

 ["exponential"](https://www.flickr.com/photos/44124366475@N01/405498965) by [topgold](https://www.flickr.com/photos/44124366475@N01) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich) 

Trouxe apenas três pontos para não ficar uma verborragia aqui no texto, mas se quiser conversar no [Twitter](https://twitter.com/the_fznd), vou estar mais do que feliz em citar mais outros -- além de recomendar dar uma olhada nas referências deste post.

## Sou dev, mas ainda não vejo vantagens

> "Aceita que dói menos"

Alguns dos benefícios de se preocupar desde já com PWA para desenvolvimento:

- Caso já tenha um site rodando, não terá que se procurar portar para um no futuro e ter que se preocupar mais mais variáveis e treinar o time para conhecer tudo isto de última hora
- Permitir que você "sinta" o site como um app no celular e não como um emulador no PC ou uma ferramenta como o `Lighthouse` -- que mesmo sendo muito boa para [80% dos casos, sempre terão aqueles 20%](https://en.wikipedia.org/wiki/Pareto_principle)
- Expandir o conhecimento para uma tecnologia nova... Mesmo que não acabe gostando ou que não sinta que seja a melhor coisa para você -- como o próximo tópico vai mostrar, o esforço inicial é quase zero

![8254585607_200890d709_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1594619084024/AZApP3ij_.jpeg)

 ["Glasgow, Scotland"](https://www.flickr.com/photos/80018584@N06/8254585607) by [Seo J Kim](https://www.flickr.com/photos/80018584@N06) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

# Por que ainda no Shiny?

> "Por que não fazer?"

Eu sei que falei que tenho meus contras o `Shiny` em si, mas não muda o fato de que a plataforma ainda é MUITO utilizada uma vez que é o maior framework web para quem utiliza R. Fora que fazer uma chamada de aproximadamente 10 linhas pode trazer vários benefícos.

```R
...
    dashboardBody(
        shinyPWA(list(
            hasIcons = TRUE,
            version = 'v1',
            shortname = 'RSMD',
            name = 'R + Shiy + Mongo + Docker',
            display = 'standalone',
            backgroundcolor = '#fdfdfd',
            themecolor = '#db4938',
            orientation = 'portrait-primary'        
        )),
        tabItems(
...
```

Um ponto importante é que mesmo eu utlizando o `shinyDashboard` para desenvolver o exemplo, ele não é necessário uma vez que só o `shiny` em si é necessário -- e se eu fizer uma otimização aqui e ali, nem ele seria necessário, mas como a ideia é utilizar em um projeto que vá rodar nele; não vejo a necessidade de tal otimização para poder portar para outro competidor que não existe.

# Rodando local

> Chegou a hora do "testemunha de Docker" brilhar

Caso você tenha baixado já o projeto, basta abrir seu terminal e rodar:

```shell
docker-compose up
```

E acessar o ip da sua máquina de qualquer um dos seus dipositivos no WiFi local ou abrir seu navegador e digitar `localhost`.

# Publicando

Como disse, algumas das lojas de apps já permitem com que você publique PWAs nela... Isso pode acabar dando uma visibilidade maior para o seu sistema. Fora que você não precisaria se preocupar com buildar nada para distribuir uma vez que é um site, nada de se preocupar com um pipe complexo e elaborado.

# Referências

- [Microsoft and Google team up to make PWAs better in the Play Store](https://medium.com/pwabuilder/microsoft-and-google-team-up-to-make-pwas-better-in-the-play-store-b59710e487)
-  [10 Reasons Why Your Business Needs a Progressive Web App](https://www.sam-solutions.com/blog/the-benefits-of-progressive-web-apps-pwa-for-business/)
- [Grupo de PWA do Telegram](https://t.me/pwabrasil) 
- [PWA starter kit: build fast, scalable, modern apps with Web Components (Google I/O '18)](https://youtu.be/we3lLo-UFtk)
- [How to publish a PWA on the Google Play store](https://dev.to/jumpalottahigh/how-to-publish-a-pwa-on-the-google-play-store-2bid)
- [Aplicativos Web progressivos](https://developer.microsoft.com/pt-br/windows/pwa/)
- [Why Build Progressive Web Apps: PWAs for iOS](https://www.youtube.com/watch?v=s5ASNwnBttQ) 
