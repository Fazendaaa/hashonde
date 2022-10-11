# Streaming de Retro Games...  DE GRAÇA e em dois passos

> O Play Station One tem 2 MB de RAM e 1 MB de VRAM -- os dois juntos são menos do que um mp3 médio atual (uns 4 MB)

foto de capa: "Gaming Console TV - Credit to informedmag.com" by Informedmag is licensed under CC BY 2.0 

## Intro

Já pensou em jogar os mesmos jogos sem perder qualidade gráfica rodando na sua:

- Smart TV
- Celular
- Tablet
- Laptop
- etc.

Com os recentes anúncios do novo Xbox e Play Station, fora a consequente hype e seus estoques acabando em pré-venda, o foco principal foi que pela primeira vez ambas as empresas por trás dos consoles apresentaram mais de uma opção para esta geração: sendo uma mais acessível financeiramente e outra mais cara mas com 

| Console | Em Dólar | Convertido diretamente | Custo no Brasil | 
| - | -| - | - |
| PS5 Digital Edition | 399 | 2.206 | 4.499  |
| PS5 | 499 | 2.759 | 4.999 |
| Xbox Serie S | 299 | 1.653 | 2.999 |
| Xbox Serie X | 499 | 2.759 | 4.999 |

Fora que ainda você vai ter que pagar os jogos, este são só os valores dos aparelhos.

Caso você não queria comprar novos aparelhos ou -- em alguns casos -- o próprio jogo, há opções não tão recentes de streaming deles como:

- [Stadia](https://stadia.google.com/)
- [Xbox Cloud](https://www.xbox.com/en-US/xbox-game-pass/cloud-gaming)
- [Nvidia Cloud Gaming](https://www.nvidia.com/en-us/geforce-now/)
- [Apple Arcade](https://www.apple.com/apple-arcade/)

Problemas  atuais:

- Dos apresentados só o Apple Arcade funciona o Brasil -- o que significa uma pequena parcela da populção que joga uma vez que só recentemente a Apple começou a investir nisso
- Mesmo se conseguir se conectar em servidores dos EUA para jogar os outros serviços, a distância e a velocidade da sua conexão serão fatores que atrapalharão sua experiência
- No caso do Stadia, quase um ano depois, tem algumas promessas de lançamento do produto que ainda não foram cumpridas
- A briga da Apple com a Epic Games com relação ao 30% de taxa da App Store; além da briga da mesma Apple com a Microsoft e a Nvidia pelos seus sistemas de streaming de games
- etc.

![7777982086_ceb032b258_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602353398584/OoEWHQ-pd.jpeg)

["WRONG WAY"](https://www.flickr.com/photos/15923063@N00/7777982086) by [CarbonNYC [in SF!]](https://www.flickr.com/photos/15923063@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Com a indústria atacando a si própria e os preços cada vez mais caros, as vezes uma solução própria pode ser vantagem para quem quer tirar poeira dos jogos que possuí da infância.

## Comunidade de retro games

Antes de tudo, se você tem dúvida sobre a legalidade desta abordagem... Veja [este](https://youtu.be/O-aRPytEDUk?t=80) vídeo sobre isso para uma visão maior do assunto sobre a visão de um norte americano. Mas em suma: **emuladores não são ilegais, se você piratear o conteúdo dentro deles, aí sim estará em maus lençóis**.

Uma análise boa do assunto é [esta](https://youtu.be/hYJ3dvHjeOE) do Akita. Ele explica um pouco melhor da história de alguns projetos e como eles foram feitos. Além dele:

- [LGR](https://www.youtube.com/user/phreakindee) - caso queira ver e entender mais como é ter um hardware antigo atualmente mesmo
- [Nostalgia Nerd](https://www.youtube.com/user/nostalgianerdvideos) - caso queira saber da história das empresas contadas de uma perspectiva quase que histórica dos fatos
- [Modern Vintage Gamer](https://www.youtube.com/user/jimako123) - para ter uma noção de fatos recentes e como é ser um desenvolvedor para muitas destas plataformas
- [Leonardo Pereira](https://twitter.com/cthulhuisback) - para ter uma noção da parte acadêmica de games

![57877256_7f8151493d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602344096301/e6XL47CR-.jpeg)

["Atari Flashback 2 Joystick (top)"](https://www.flickr.com/photos/41894183508@N01/57877256) by [mrbill](https://www.flickr.com/photos/41894183508@N01) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Assim como é dito em Pacific Rim para *"não se seguir o coelho"*, existem inumeráveis livros, podcasts, documentários e etc. sobre o assunto da comunidade de retro games. Para se ater ao foco deste texto que é "streaming de games" e o porquê tal abordagem é em muitos cenários melhor:

- Qualquer coisa que rode um navegador serviria uma vez que a ideia seria ter um projeto
- Por ser multiplataforma o sistema que será apresentado, você poderá rodar da maneira que mais lhe for confortável
- Poderá também jogar conteúdos que em tese não funcionariam naquela plataforma por falta de suporte de seus desenvolvedores
- etc

Por causa deste e outros motivos que muitos projetos de emulação de jogos nasceram, sendo um deles o [RetroArch](https://www.retroarch.com/). E emuladores funcionam como um "Google Tradutor" no sentido que ele vão fazer o idioma do seu computador falar o idioma do videogame que o jogo rodava. Um exemplo seria caso queira jogar um jogo do Atari no laptop da Lenovo, o emulador traduziria os comandos do jogo para Atari para os equivalentes do seu laptop.

![18276964109_97494a0136_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602345073571/ZztBnRcaa.jpeg)

["Vintage Video Computer System, Model CX-2600A, Likely The Best Known Games Console Of All Time, Made In Taiwan, Circa 1980"](https://www.flickr.com/photos/51764518@N02/18276964109) by [France1978](https://www.flickr.com/photos/51764518@N02) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Docker

A [imagem](https://hub.docker.com/r/fazenda/retroarch-web) deste projeto está disponível nas seguintes arquiteturas:

- amd64
- arm64
- ppc64le
- s390x

Como este texto provavelmente atingirá muitas pessoas as quais não acompanham muito o conteúdo publicado aqui: "isso signifca o quê?"

- amd64: *praticamente qualquer computador -- seja ele laptop, desktop, servidor e etc -- que tenha uma CPU Intel ou AMD que seja 64 bits*
- arm64: *uma Raspberry PI 3/4 ou qualquer outro Single Board Computer (SBC)  -- conhecidas como "plaquinhas" -- ARM com 64 bits*
- ppc64le: *basicamente se você tiver um servidor empresarial sobrando em casa...*
- s390x: *igual ao anterior só que mais hipster*

E o [Docker](https://www.docker.com/) aqui nada mais do que uma forma: *segura, rápida e barata de se executar aplicações no seu computador sem precisar instalar elas e sofrer com conflitos de arquivos ou versões de sistemas já instalados.*

Caso sua máquina seja uma das anteriores e queira rodar nela agora mesmo, basta abrir seu Docker para rodar o seguinte comando:

```shell
docker run --publish 80:80 fazenda/retroarch-web
```

E abrir um navegador, digitar `localhost` e apertar `Enter`.

![2020-10-10-142414_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602350707604/Ao0ZczPUl.png)

*Pronto, quer dizer que acabou aqui o texto?*

Na realidade não, isto foi apenas para mostar que se quiser parar por aqui e ir jogar, por favor fique a vontade. Só se lembre que `localhost` é um nome apenas para você acessar a sua máquina da sua máquina -- assim como o famoso endereço de várias camisetas, o `127.0.0.1` --; caso queira acessar do seu celular por exemplo, acesse o painel do seu modem e procure pelo o endereço do seu computador, o que deve ser algo do tipo `198.261.0.16` ou coisa do tipo.

## Server gaming vs Streaming

Qual a diferença entre o que você fez no passo anterior e o Fortnite que você joga no seu celular, computador, tablet ou console?

R: *você precisou instalar eles na sua máquina*

Por mais que o streaming de jogos seja sim um "server gaming", ele neste caso se diferencia porque você não teve que instalar nenhum programa do RetroArch para se conectar no servidores deles ou coisa do tipo.

![5055863847_c6b0632f0b_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602351821983/-A4oon8zs.jpeg)

["Video Game Journalist"](https://www.flickr.com/photos/46754691@N05/5055863847) by [Shane's Stuff](https://www.flickr.com/photos/46754691@N05) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

*Isso quer dizer que o seu laptop é um servidor???*

Para responder esta pergunta, uma outra será feita: *"um Fusca ainda é um carro quando comparado a uma Ferrari?..."*

Lógico que assim como um Fusca e uma Ferrari ambos são carros, o seu laptop pode sim ser um servidor. E assim como no exemplo dado, há diferenças entre eles mas que não farão na prática diferenças para este caso de uso:

- Os servidores normalmente tem uma taxa de falhas das peças menores devido há maior qualidade delas
- Também possuem normalmente maior número de cores
- Velocidade e escala da rede também são fatores que inflenciam isto
- Além de que não necessariamente você vai conseguir colocar 500 usuários no seu laptop jogando, enquanto um servidor poderia aguentar esta carga com tranquilidade
- etc.

![3462607995_42334e5f9c_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602357900329/EYcHEx8UM.jpeg)

["Server room"](https://www.flickr.com/photos/8718930@N07/3462607995) by [torkildr](https://www.flickr.com/photos/8718930@N07) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Rancher

Como já mostrado [neste](https://fazenda.hashnode.dev/minecraft-docker-kubernetes-servidor-de-jogos-na-sua-casa) sobre como um servidor Minecraft roda na configuração de sistema que iremos apresentar. Só que a ideia agora é ao invés de se subir um servidor para várias pessoas se conectarem nele.

A vantagem da abordagem de ter o seu próprio servidor [Rancher](https://rancher.com/) é que poderá deixar ligado o tempo todo e usar, enquanto seu laptop quando desligar ele não poderá utilizar o seu RetroArch na cama jogando pelo celular antes de dormir. Outra vantagens:

- Poder subir outros serviços
- Conectar várias máquinas usando Rancher e parecer que há apenas uma "super máquina"
- Instanciar dois serviços iguais sem precupar de um entrar em conflito com o outro
- etc

![8731487021_5c30f23951_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602347078075/YuAvVf86w.jpeg)

["minecraft stackedImage"](https://www.flickr.com/photos/30874308@N06/8731487021) by [eok.gnah](https://www.flickr.com/photos/30874308@N06) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

E aí que vem a parte do "de graça" do título... Se você tiver a vontade porque o tempo é mínimo -- você consegue configurar a tela do Rancher em **menos de 30s** -- vai ter um servidor de games multiplataformas rodando em casa, sem ter que pagar:

- Assinatura
- Novamente os mesmos jogos que já tem em um console mas as vezes para jogar na nuvem tem que comprar ele de novo
- Algum controle ou aparelho muitas vezes exclusivo para aquela plataforma para ter tal experiência
- etc.

Além disso, como testes de Rancher rodando na Raspberry Pi 4 estão sendo feitos, todo este sistema está rodando na seguinte plaquinha:

![g883.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602358352516/KCj_8LdjR.png)

A vantagem disso é que agora você pode deixar ela conectada 24h sem consumir tanta energia quanto um computador consumira, uma vez que um simples carregador de celular dá conta das necessidades dela e a eficiência do processo é tão alta que ela só consumirá mais energia mesmo quando estiver em uso. Fora que é do tamanho de um cartão de crédito, não vai ocupar tanto espaço nem fazer barulho -- esta da foto está com o dissipador mais parrudo por motivos de ela estar rodando **VÁRIOS** serviços dos já publicados aqui para testes, só que se só utilizar ela para o RetroArch, talvez não seja necessária tal peça.

Para subir o sistema:

I. Crie um deploy no seu painel Rancher com os seguintes valores -- lembrando que a porta `8085` é a que eu tenho livre na minha máquina, na sua pode ser que seja diferente:

![image1507.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602364052298/ExCSxqlPg.png)

II. Abra a URL do seu servidor com a porta do Rancher. Agora só subir jogos e testar eles:

![g1427.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602363938233/Xm7rHw9nc.png)

Agora é possíveil acessar qualquer jogo de qualquer navegador, seja ele em:

- Tablet
- Smartphone
- SmartTv
- Alexa
- Chromebook
- etc.

Logo depois do sistema no ar, foi feito testes com o Mario rodando nele:

![2020-10-10-115951_2560x1080_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602355064244/zLoSF_SBV.png)

O controle conectado foi um [FlyDigi Apex](https://www.flydigi.com/en/apex) só que o ponto principal foi o cenário: *conectado em um laptop rodando Linux através de um thunderbolt 3 e um dock conectado a um hub de um monitor conecta a outro hub*. Ou seja, além de estar rodando em um navegador Firefox com vários bloqueadores nele, o controle foi conectado de primeira; uma série de fatores que poderiam dar erro em algum ponto mas funcionaram tranquilamente. Provavelmente depois do texto ser publicado testes serão feitos em uma [Android Tv](https://www.aliexpress.com/i/4000318907479.html) que suporta entrada USB do joystick.

## Considerações finais

Caso tenha gostado da ideia do Rancher e Docker, recomendo estes textos publicados anteriormente aqui -- você pode ter esses serviços rodando na sua infra agora:

- [CDs parados = seu próprio Spotify de graça](https://fazenda.hashnode.dev/cds-parados-seu-proprio-spotify-de-graca)
- [Nuvem de terceiros quando você pode ter a sua própria em casa com o clique de um botão?](https://fazenda.hashnode.dev/nuvem-de-terceiros-quando-voce-pode-ter-a-sua-propria-em-casa-com-o-clique-de-um-botao)
- [Centralize os favoritos em qualquer browser e em qualquer device](https://fazenda.hashnode.dev/centralize-os-favoritos-em-qualquer-browser-e-em-qualquer-device)

Como eu particularmente não jogo, por favor comentem caso tenha cometido algum deslize no texto ou coisa do tipo. Realmente gosto de projetos como o RetroArch funcionam por causa da perpectiva de um desenvolvedor que começou a gostar de Docker, depois começou a se interessar por hardwares por causa disso e agora procura a estudar a história da computação para entender melhor ela.

![6890140478_f5bc6f02c7_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602352506063/UzqmTjpxq.jpeg)

["Spring 2012 Student Hackathon Coding"](https://www.flickr.com/photos/61623410@N08/6890140478) by [hackNY](https://www.flickr.com/photos/61623410@N08) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Caso queria ir um pouco mais além, há vários projetos e canais dedicados há portabilidade de retro-games e não necessariamente emulados. Alguns conteúdos sobre o assunto que vão desde modificação de peças até fazer seu próprio portátil:

- [There's a REAL Nintendo Wii Packed into this Handheld!!!](https://youtu.be/46gNvDLgLdI) 
- [Wine on Raspberry Pi, Pi Gameboy and Mini NES systems! | Roundup](https://youtu.be/ToBBTvtX-Hg)
- [mintyPi v3 - Retro Gaming Handheld in an Altoids Mint Tin!](https://youtu.be/Gml-xDzB1fE)

Lembrando que por mais que na teoria todo hardware equivalente é "igual" as vezes se você deixar o seu cluster rodando no WiFi e longe do seu ponto de acesso, poderá sofrer com isso, assim como se a sua placa estiver com uma fonte ruim ou qualquer outro fator, considere analisar isto antes de tudo.

## Apêndice

- Se gostou do Rancher, procure ler mais dos textos publicados aqui e ver o conteúdo do [Techno Tim](https://www.youtube.com/channel/UCOk-gHyjcWZNj3Br4oxwh0A), além deles outros youtuber como o [Craft Computing](https://www.youtube.com/channel/UCp3yVOm6A55nx65STpm3tXQ) e o [Level1Techs](https://www.youtube.com/user/teksyndicate) tratam muito deste assunto de diversas e diferentes perspectivas.
- Melhor YouTuber neste tipo de assunto de retro-gaming em SBCs é o [ETA Prime](https://www.youtube.com/user/Mretaprime)
- [Este](https://youtu.be/ToBBTvtX-Hg) episódio do Low Spec Gamer que me fez ficar vontade de correr estre projeto que estava parado
- Caso tenha uma Rapberry Pi, [este](https://fazenda.hashnode.dev/centralize-os-favoritos-em-qualquer-browser-e-em-qualquer-device) tutorial vai poder te ajudar a configurar ela -- leia bem o texto como um todo, inclusive seu apêndice
- Nova Jetson anunciada [esta](https://www.notebookcheck.net/NVIDIA-Jetson-Nano-Raspberry-Pi-alternative-gets-cheaper-US-54-variant-with-2-GB-of-RAM.497483.0.html) semana por um preço mais acessível -- foi a placa mais estável que já testei até agora
- Não fiz o teste mas em tese eu poderia deixar um chromium aberto dentro da Raspberry e utilizar ela própria para ser meu "console" de games ao mesmo tempo que roda vários servidores de baixo do pano
- Além disso, um ressalve de marcas de SBCs que oferecem melhor relação custo vs benefícios do que as Raspberries são:

  - Nanopi
  - Odroid
  - Rock Pi
  - Nvidia
  - Orange Pi

A Raspi 4 só foi realmente utilzida neste texto por dois motivos simples: é a que tenho em mãos agora para testes e vai ser dar muito cliques pela marca, todavia recomendo principalmente as da Nvidia por ser a mais estável que já testei.
- Foi utilizado no texto a seguinte equivalência: 1 USD = 5.53 BRL

## Referências

- [PlayStation - Technical Specifications](https://en.wikipedia.org/wiki/PlayStation_(console)
- [Preço do Xbox Series X e S no Brasil: veja cinco destaques do lançamento](https://www.techtudo.com.br/listas/2020/09/preco-do-xbox-series-x-e-s-no-brasil-veja-cinco-destaques-do-lancamento.ghtml)
- [Preço do PS5 no Brasil: compare com lançamentos dos PS4, PS3 e PS2](https://www.techtudo.com.br/noticias/2020/09/preco-do-ps5-no-brasil-compare-com-lancamentos-dos-ps4-ps3-e-ps2.ghtml)
- [RetroArch](https://en.wikipedia.org/wiki/RetroArch)
