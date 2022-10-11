# Minecraft + Docker + Kubernetes = Servidor de jogos na sua casa

> You cannot fast travel when enemies are nearby

foto de capa: ["CoderDojo Linz"](https://www.flickr.com/photos/76164541@N06/22574557693) by [rainerstropek@yahoo.com](https://www.flickr.com/photos/76164541@N06) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Com mais de 200 milhões de vendas -- o que representa um dobro no número de vendas em menos de quatro anos --, 126 milhões de pessoas jogando todos os meses que só para colocar em comparação:

- Um pouco mais de 5 vezes a população do Canadá
- Se todas as vendas fossem feitas pelo [preço atual](https://www.microsoft.com/pt-br/p/minecraft-for-windows-10/9nblggh2jhxj?activetab=pivot:overviewtab) de aproximadamente 100 reais, o jogo teria rendido 20 bilhões de reais em vendas
- Considerando os quase 8 bilhões de reais que a Microsoft pagou na compra do jogo há 5 anos, o total em vendas equivale há 2.5 vezes o valor de compra

E, assim como alguns jogos, durante a quarentena teve um aumento de popularidade, sendo por volta de 25% em novos jogadores e 40% nas partidas online.

Como em vários jogos, muitas partidas online tem tido instabilidade devido há problemas de conexão de rede. Todavia, no caso de Minecraft você pode ter um servidor em casa:

- Para jogar de múltiplos dispositivos um mesmo mundo
- Para jogar com os filhos e irmãos 
- Ou até mesmo amigos que moram perto de ti

![47833061652_110a6acab8_o.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597200654180/70VTyRKXQ.png)

 ["Example of Minecraft Shaders"](https://www.flickr.com/photos/165834061@N05/47833061652) by [jardine000](https://www.flickr.com/photos/165834061@N05) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Intro

Apesar do fatores históricos do jogo já mencionados uma coisa importante é que ele é mais do que um jogo por si só, mas sim uma "plataforma"; uma vez que por sua característica de mundo aberto na qual permite com que os próprios usuários cirem e mantenham vários mundos diferentes, com contextos diferentes e que procurem tratar de histórias diferentes entre si. Isso possibilita o desenvolvimento e aprendizado do jogador, que o propícia à ele se desenvolver de maneiras que muitas vezes podem ser novas.

A criação de mundos com mods -- as modificações feitas neles -- permitem com que projetos como o de retratar o [mundo de Game of Thrones](https://youtu.be/X35ilDRA65o) no jogo sejam desenvolvidos.

Há uma versão [educacional](https://education.minecraft.net/) também disponível, com servidores desenvolvidos com o intuito de ajudar professores a "quebrar o gelo" na hora de ensinarem seus alunos novos conceitos e aprenderem novas maneiras de ensinar eles.

![8692788795_3317a718b4_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597200837515/0-5q6xuAF.jpeg)

["Mineboycys vs The Creeper"](https://www.flickr.com/photos/27406808@N00/8692788795) by [ClarkHodissay](https://www.flickr.com/photos/27406808@N00) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

Além disso, há uma versão que roda nas Raspberries Pis e o interessante dela é a integração com a linguagem de programação Python, o que permite uma plataforma aberta para você codar e fazer mudanças dentro do jogo que adequem às suas necessidades e aprendizado. O que é bom uma vez que linguagens como o Java na qual o projeto é baseado em algumas implementações podem afastar iniciantes em programação.

E para os que gostariam de mexer com um servidor do jogo e em CPP, existe o projeto [Cuberite](https://cuberite.org/) para tal.

![8417934982_9600da5c24_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597543481801/SVz53vHts.jpeg)

["IMG_6242_s"](https://www.flickr.com/photos/40906666@N00/8417934982) by [xhan104](https://www.flickr.com/photos/40906666@N00) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Rancher

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597311528074/D03w0vDEg.png)

["File:Nvidia Jetson Nano 2 Development Kit 15 14 39 352000.jpeg"](https://commons.wikimedia.org/w/index.php?curid=87619852) by [Ubahnverleih](https://commons.wikimedia.org/wiki/User:Ubahnverleih) is licensed under [CC0 1.0](http://creativecommons.org/publicdomain/zero/1.0/deed.en?ref=ccsearch&atype=rich)

Sim, foi nesta placa da foto que servidor do Minecraft está rodando, além do [OpenProject](https://www.openproject.org/) -- uma ferramenta de gestão de projetos -- que foi publicado o passo a passo no [último post](https://fazenda.hashnode.dev/chega-de-jira-ckdw5w23z028qids12om74gw9) ... E a melhor parte é que, como o painel indica, nem estava consumindo muito recurso em si:

![image903.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542047882/kaoQmq9VV.png)

Agora, passo a passo, como fazer funcionar na sua placa também:

1.  Acesse seu servidor Rancher por SSH:
```shell
ssh -l seuUsuarioRancher ip.do.servidor.rancher
```
2. Crie uma pasta para salvar na sua máquina as configurações do servidor:
```shell
mkdir ~/minecraft
cd ~/minecraft
pwd # salve o resultado deste comando, será necessário nos próximos passos
```
3. Preeencha as informações da imagem  [`itzg/minecraft-server:1.8.0-multiarch`](https://hub.docker.com/r/itzg/minecraft-server/) e porta:
![image939.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597543018694/JDSBSd9sQ.png)
4. Algumas das váriaveis de ambiente recomendadas para inicializar o serviço:
![image927.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542999807/piFvBm3QX.png)
5. Linke o caminho citado no passo `2` com o do container -- no meu caso `/home/nvidia` mas no seu pode ser outro:
![image915.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542981051/tILY6gXyf.png)
6. Veja os logs até sua aplicação estar disponível para ser utilizada:
![image1365.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542789763/szXAI6A6y.png)
![image1377.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542806817/gX6uT4kod.png)
7. Acesse a opção `multiplayer` no seu menu do jogo:
![2020-08-15-215157_2560x1056_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542146932/V-KVfeWVe.png)
8. Selecione `direct connection`: 
![2020-08-15-215208_2560x1056_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542638866/G3cebWk0R.png)
9. Conecte com o ip no seu cliente Minecraft:
![g1311.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542615965/VFDrlofe4.png)
10. Comece a jogar:
![2020-08-15-224550_2560x1056_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597542331672/UIdXgJp9L.png)

Recomendo olhar a lista com todas as configurações [aqui](https://github.com/itzg/docker-minecraft-server/blob/master/README.md) uma vez que você pode ter que fazer ajustes finos para o hardware que está rodando o servidor ou até mesmo para o tipo de jogo que gostaria de ter.

## Considerações finais

O servidor foi testado através de um cliente rodando em Linux -- não foram testadas as versões para Windows e MacOS, podem ser que funcionem sem dores de cabeça como não -- com a versão Java do jogo.

A ideia inicial era fazer o [Cuberite](https://github.com/cuberite/cuberite)  -- a implementação do servidor em CPP ao invés de Java -- rodar no sistema, todavia o meu cliente não conseguiu rodar a versão que o servidor suporta -- até a 1.12 ao invés da 1.16 atual.

![16862444891_ab5e704bf0_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597200349296/nHOCHKMXP.jpeg)

["lego minecraft 21115"]("lego minecraft 21115" by mureut.kr is licensed under CC BY-ND 2.0 ) by [mureut.kr]("lego minecraft 21115" by mureut.kr is licensed under CC BY-ND 2.0 ) is licensed under [CC BY-ND 2.0]("lego minecraft 21115" by mureut.kr is licensed under CC BY-ND 2.0 )

## Apêndice

- Foi considerado o preço de 1 dólar como 3.19 reais como o valor do  [dólar em 2015](http://g1.globo.com/economia/mercados/noticia/2015/12/dolar-termina-ultima-sessao-do-ano-em-alta.html). Inflação, poder de compra, preços em promoção e etc. foram desconsiderados para fazer as contas; não porque eles não são importantes, mas como não possuo um conhecimento de economia para tal, resolvi fazer conversões simples e deixar claro que outros fatores foram desconsiderados.
- Não consegui fazer o servidor rodar por mais de alguns segundos na [Odroid-C2](https://www.hardkernel.com/shop/odroid-c2/), acredito que seja limitações do hardware em si uma vez que procurei rodar apenas com o Docker, sem o Rancher por cima.
- Caso queira realmente jogar com celulares, não há suporte da imagem  [`itzg/minecraft-bedrock-server`](https://hub.docker.com/r/itzg/minecraft-bedrock-server) ainda para arquiteturas ARMs, então provavelmente seguiria passos similares só que rodando em um servidor x86.

## Referências

- [Minecraft still incredibly popular as sales top 200 million and 126 million play monthly](https://www.theverge.com/2020/5/18/21262045/minecraft-sales-monthly-players-statistics-youtube)
- [Microsoft bought 'Minecraft' after a single tweet by its creator](https://www.engadget.com/2015-03-04-minecraft-notch-mojang-microsoft-purchase.html)
- [What are the pros and cons of Minecraft?](https://www.quora.com/What-are-the-pros-and-cons-of-Minecraft)
- [Minecraft Pi](https://www.raspberrypi.org/documentation/usage/minecraft/)