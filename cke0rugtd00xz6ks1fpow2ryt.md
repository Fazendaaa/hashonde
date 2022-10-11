# Fazenda de Impressoras 3D Inteligentes 26 vezes mais barata

> 2020 é o ano da impressora 3D!

foto de capa: ["3D Printer"](https://www.flickr.com/photos/109180828@N06/14207351587) by [gonzafoles](https://www.flickr.com/photos/109180828@N06) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

- *Volta da "industria nacional"?*
- *Indústria 4.0?*
- *Sonho molhado de Issac Asimov?*

Só para pontuar alguns motivos para usar uma impressora 3D:

- Fácil, rápida e barata prototipagem -- quando comparada aos métodos de ter que entrar em contato com uma fábrica para fazer um pequeno lote de protótipos para um projeto
- Escalabilidade -- uma vez que subir uma "linha de produção" completa é só adicionar uma impressora a mais
- Matéria prima abundante e de fácil acesso -- diversas origens e tipos de filamentos e resinas
- Peças de reposição facilmente encontradas -- uma vez que são peças comuns para projetos de eletrônica
- Muitas vezes as impressões são feitas com material de origem reciclável e/ou até mesmo a sua natureza permite que as impressões falhas sejam futuramente recicladas
- Mudança da cadeia de produção e distribuição -- reduzindo a malha de distribuição uma vez que todos os processos poderiam ficar em uma "giga-fábrica" que a mesma máquina pode ser responsável pela impressão de diversas peças
- etc

![27890661829_17760c75bf_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596679495578/HU-R9UtzW.jpeg)

["The Future is Now - part 1"](https://www.flickr.com/photos/158574393@N04/27890661829) by [BenedictaMLee026](https://www.flickr.com/photos/158574393@N04) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Com o preço das impressoras 3D cada vez mais e mais caindo -- desde de [95 USD](https://www.youtube.com/watch?v=M3SMUpNH_6I) (495 BRL), podendo chegar há 60 USD (315 BRL) em promoções --, o conceito de imprimir em 3D se torna cada vez mais secular se aplicado até mesmo para a construção de casas, sejam elas na [Terra](https://www.youtube.com/watch?v=gVUlbpZS0Rc) ou em [Marte](https://www.youtube.com/watch?v=LCuZC-CRg4M). E isso acaba fazendo com que impressão 3D não seja apenas um movimento "maker" mas sim um movimento de evolução do ser humano, uma vez que há projetos de impressão:

- De órgãos
- Comida
- Sistemas orgânicos para testes de vacinas
- Membros para pessoas que tiveram os seus amputados
- Armas
- etc

Com raízes fortes em [Open Hardware](https://ohwr.org/welcome) e [Open Source](https://opensource.org/), o acesso ao códigos que tais máquinas rodam e os esquemáticos de suas peças são de fácil acesso; isso significa que modificações e ajustes são possíveis, fazendo com que cada necessidade e cenário possam ser ajustados uma vez que peças do modelo "original" possam ser as vezes caras ou não disponíveis na região.

Essa diversidade de cultura nas pessoas que usam impressão 3D, reflete no que acaba sendo feita com elas; com a política de uso de máscaras e/ou protetores de rosto, um modelo de [máscara 3D](https://www.prusa3d.com/covid19/) acabou surgindo por necessidade pois com a pandemia o impacto na cadeia de distribuição deste equipamento foi pesado por restrições de transporte, movimentações em fábricas e distribuição de matéria primas; situação remediada por um rolo de filamento e uma impressora 3D. 

![8487432804_da35ef2af4_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596771711744/piKFSmbz0.jpeg)

["DSC_0231"](https://www.flickr.com/photos/93304850@N07/8487432804) by [Arduino_cc](https://www.flickr.com/photos/93304850@N07) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Intro

Caso já tenha pesquisado [impressora 3D](https://pt.aliexpress.com/wholesale?catId=0&initiative_id=SB_20200802080154&origin=y&SearchText=impressora+3d) na AliExpress, uma das mais conhecidas é a 
[Ender 3](https://www.creality3dofficial.com/products/official-creality-ender-3-3d-printer) que em promoções pode girar em torno de 1 000 reais.

![Ender 3](https://cdn.shopify.com/s/files/1/0046/3781/8929/products/ender-3-6_1_480x480.jpg?v=1594370119)

"ender-3-6_1_480x480.jpg" do site oficial da [Creality](https://www.creality3dofficial.com/products/official-creality-ender-3-3d-printer)

Normalmente várias pessoas utilizam a Raspberry Pi para deixar esta e várias outras impressoras conectadas pela internet como um aparelho quase que *Internet Of Things* (IoT). Todavia, a [Raspberry Pi 4](https://pt.aliexpress.com/wholesale?catId=0&initiative_id=AS_20200802075831&origin=y&SearchText=raspberry+pi+4+8gb) -- sua versão mais recente --, pode chegar a custar 800 reais caso queira pegar uma nova com case, cartão, carregador e etc.

Neste cenário 40% do valor representa uma peça que em muitos casos é mais do que o necessário para tarefa e, ao mesmo tempo, pode passar boa parte do tempo ociosa perto do potencial dela mesmo com a impressora em funcionamento.

![7679816282_c164c1fc65_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596679057633/25EK2bkEu.jpeg)

["Pi"](https://www.flickr.com/photos/72938813@N02/7679816282) by [billsdead](https://www.flickr.com/photos/72938813@N02) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Uma vez que vários tutoriais para realizar tal tarefa com a "Raspi" já existem, a ideia é utilizar uma [Nanopi Neo 2 Black](http://wiki.friendlyarm.com/wiki/index.php/NanoPi_NEO2_Black) para tal uma vez que:

- Custou aproximadamente 1/7 do valor da Raspi citada
- Tem o potencial de rodar uma fazenda de 4 impressoras
- Utilizar ela além da caso da impressora 3D como, por exemplo, um servidor web -- como publicado [neste](https://fazenda.hashnode.dev/chega-de-jira-ckdw5w23z028qids12om74gw9) texto
- etc

## Rancher

![photo_2020-08-09_20-02-59.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597014256188/KZemY5Ngl.jpeg)

A sequência de textos publicados até agora mostram que a abstração permitida pela combinação [Docker](https://www.docker.com/) +  [Rancher](https://rancher.com/) auxilia quem não tem conhecimento com configurações de sistema e/ou desenvolvimento de código configurar um servidor a rodar as aplicações que precisa com uma tela de configuração no seu navegador, quase como uma uma configuração de modem novo quando precisa digitar um ip no seu navegador e fazer as configurações necessárias.

O Rancher 'smartificou' o servidor, uma vez que você procura as aplicações que precisa com facilidade em uma 'loja' -- o [Docker hub](https://hub.docker.com) -- e clicar para configurar e rodar.

Com o intuito ainda mais de tornar tal abordagem mais e mais acessível, os testes foram realizados em um placa de entrada ao invés de uma mais top de linha como no tutorial escrito [aqui](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf) -- a diferença é que a Neo 2 Black por 120 reais é quatro vezes mais barata que a [M4](https://www.friendlyarm.com/index.php?route=product/product&product_id=234) .

A imagem a ser utilizada neste caso é a [octoprint/octoprint](https://hub.docker.com/r/octoprint/octoprint/), o [Octoprint](https://octoprint.org/) é um controlador de impressora 3D através de um web browser.

![30461202533_5f09d18ce2_o.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597024092864/lw0o6GjJd.png)

["Printer's Puppeteer"](https://www.flickr.com/photos/96482236@N04/30461202533) by [marius_siuram](https://www.flickr.com/photos/96482236@N04) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Para adicionar ele com o Rancher rodando conectado a uma placa na sua impressora 3D:

1. SSH no seu servidor Rancher
```shell
ssh -l seuUsuarioNoServidor ip.do.seu.servidor
```
2. Crie uma pasta para salvar suas configurações:
```shell
mkdir ~/octoprint
cd ~/octoprint
pwd # salve o output deste comando
```
3. Descubra em qual porta o cabo da impressora 3D está conectado:
```shell
ls /dev | grep tty
```
4. Abra o painel do Rancher e insira os valores da imagem [`octoprint/octoprint`](https://hub.docker.com/r/octoprint/octoprint), neste caso será a versão `1.4.0-python3`, e a porta `5000` -- fora que a porta livre neste caso também foi a `5000`, no seu caso pode ser que seja outra:
![image1057.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597801575877/hLDbfgqqO.png)
5. Linke o caminho criado no passo `2` -- no meu caso foi `/home/nanopineo2black/octoprint`:
![image1045.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597801638475/vRJYrJxYA.png)
6. No canto inferior direito há uma opção de configurações avançadas, clique nela:
![g1124.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597801776600/GuiAB6owo.png)
7. Procure a opções de comandos e coloque o seguinte comando como `entrypoint`:
![image1021.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597801818036/cz3o8bmH6.png)
8. Procure a opção de segurança, deixe os valores assim:
![image1009.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597801979727/5STxHk4ku.png)
9. Deployie a imagem.
10. Uma vez deploiada a imagem, desta vez um passo diferente será necessário. Abra o arquivo YAML de configuração do `octoprint`:
![image997.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597802621593/VELjX3dnP.png)
11. Agora você terá que adicionar tais configurações  -- meu meu caso o caminho `/dev/ttyUSB0` veio do passo `3`:
![g1187.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597802356891/y3YMIpOPQ.png)
12. Acesso o IP com a porta, faça as configurações iniciais para a sua impressora e pronto:
![g1270.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597802545390/u5KvEIXVw.png)

Agora o processo de configurar a Octoprint por si só vai depender muito da sua impressora em si e o que deseja adicionar nela. Muitas pessoas colocam uma webcam antiga junto para poder fazer um monitoramento remoto das suas impressões.

![31885139411_71aa0db5a4_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597800402656/ejcxj-AZD.jpeg)

["IMG_20161204_171921"](https://www.flickr.com/photos/66223705@N04/31885139411) by [DIY Effixe](https://www.flickr.com/photos/66223705@N04) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Caso de uso

Baseada na [Prusa 3D](https://www.prusa3d.com/) a minha impressora 3D funcionou com tais configurações sem maiores dores de cabeça.

![image.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1597804866838/b3YmXfDM4.png)

Como possuo, por ora, apenas uma impressora, o limite teórico a ser apresentado não pode ser testado na prática. Todavia:

- Uma vez que a Octoprint consome, em média, 200 de RAM -- no meu caso ela consumia menos mas resolvi colocar tal número como um pior caso
- Uma vez que a Nanopi Neo 2 Black possui 850 MB de RAM livre
- Teoricamente a placa aguentaria 4 impressoras 3D conectadas nela

Fatores que foram deixados de lado nessas considerações são:

- Os números de cores da placa
- O espaço no microSD
- O overhead de rodar o Rancher e o Rancher-agent em um mesmo host -- eles estão rodando separadamente atualmente
 
Uma vez como não foi testado tais configurações na prática, seria díficil mensurar se o comportamento de escala é linear ou se se comporta como um sigmóide. Uma fórmula para determinar o número de impressoras controladas por uma placa teórica seria:

```
N =  ⌊ ( M  - 150 ) / P ⌋ 
```

Onde:

- **N** é o número de impressoras 3D controladas por uma placa
- **M** é a quantidade de megabytes da memória RAM da placa
- **P** é a quantidade de RAM em megabytes ocupada pela Octoprint -- uma vez que este valor pode mudar com futuras atualizações, reduzindo ou aumentando
- O `150` na fórmula é o equivalente ao que o Rancher utilizou nesse cenário

No exemplo citado a fórmula seria a seguinte:

```
N =  ⌊ ( 1024 - 150 )  / 200 ⌋ 
N =  ⌊ 4.37 ⌋ 
N = 4
```

Lembre-se de arredondar os valores para baixo uma vez que o recurso é limitado. Assim como o outro recurso limitado é o número de portas USB, no caso de exemplo esta placa possuí apenas uma, para conectar mais portas um hub USB seria necessário ou um upgrade para outra placa.

![17203395618_f060d9ddfa_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596979101510/nzSTsWVW1.jpeg)

["#3DBenchy 3D-printed at low resolution on a BEETHEFIRST 3D printer"](https://www.flickr.com/photos/132390309@N03/17203395618) by [#3DBenchy](https://www.flickr.com/photos/132390309@N03) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)  

## "Impressões" finais

Por mais que a minha impressora tenha dado o certo e sem maiores dores de cabeça, não recomendaria arriscar chegar no limite teórico com o hardware citado justamente por ser uma placa de entrada e eu não ter tido testes práticos de suas limitações. Dito isso, há outras várias placas que eu gosto e recomendo que provavelmente seriam ótimas para escalar com a tarefa e mais a possibilidade de fazer rodar outros serviços:

- [Nanopi M4](https://www.friendlyarm.com/index.php?route=product/product&product_id=234)
- [Orangepi 3](http://www.orangepi.org/Orange%20Pi%203/)
- [Odroid C2](https://www.hardkernel.com/shop/odroid-c2/)

Sendo que dessas, já postei texto usando as duas primeiras menos terceira ainda -- pretendo utilizar ela para outras tarefas no futuro, todavia fiz alguns testes com a mesma já e rodou sem maiores dores de cabeça.

![29582301022_381fb185b6_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1597791022040/Syrsp9m83.jpeg)

["ODROIDC2-MAIN5"](https://www.flickr.com/photos/45703688@N07/29582301022) by [lespounder](https://www.flickr.com/photos/45703688@N07) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

O "26 vezes mais barata" se dá ao fato de se a pessoa fizesse uma abordagem comum de pegar uma Raspberry Pi -- no caso a mais recete -- para cada impressora que uma Neo 2 consegue gerenciar, seriam necessárias quatro placas -- uma para cada impressora --; e como `4 * 800 = 3200`, esse valor que seria gasto dividido pelo o valor da Neo `3200 / 200 = 26.666`. Por isso o título.

## Apêndice

- Mesmo o Octoprint possuindo imagens para ARM 32 bits o Rancher ainda não suporta ARM 32 bits, todavia pretendo trabalhar nisso para que no futuro placas com tal arquitetura sejam suportadas nesta abordagem
- Graças à ajuda do [Rico](https://stackoverflow.com/users/2989261/rico) nesta resposta [aqui](https://stackoverflow.com/a/63444384/7092954), consegui finalizar este post; uma vez que só conseguia rodar a imagem com o famoso `docker run` mas não sabia como fazer um 'bind' de `--devices` no Rancher
- Durante a escrita deste post, a versão mais recente do Armbian não funcionou, instalei a `5.4.43` disponível [aqui](https://dl.armbian.com/nanopineo2black/archive/)
- Procurei fazer testes com a [Raspberry pi 3b+](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/), todavia eles foram infrutifereos mesmo com quatro sistemas operacionais diferentes:
  - [Raspbian](https://www.raspberrypi.org/downloads/raspberry-pi-os/) -- é 32bits
  - [Raspiberry Pi OS](https://www.raspberrypi.org/blog/latest-raspberry-pi-os-update-may-2020/) -- problemas de autenticação com as chaves
  - [Ubuntu Mate](https://ubuntu-mate.org/ports/raspberry-pi/) -- problemas de kernel
  - [Ubuntu Server](https://ubuntu.com/download/server/arm) -- problemas de kernel
- Não recomendo utilizar a [Nvidia Nano Jetson](Link) que venho utilizando nos últimos post mais pelo fato de se não for utilizar a placa para outras coisas além de ser um servidor de Octoprint, seria um "desaproveitamento" grande da placa
- Um pouco mais da história das impressoras 3D pode ser vista [nesta](https://www.youtube.com/watch?v=VV0Tjwq7Uc0) pequena entrevista ou [neste](https://www.youtube.com/watch?v=JeqT2NvTFSw) documentário
- Mais sobre a diferença de impressoras:
  - [The 9 Different Types of 3D Printers
](https://3dinsider.com/3d-printer-types/)
  - [How does the Multi Material Upgrade 2.0 work?](https://youtu.be/E1ZxTCApLrs)
  - [3D Printer differences explained: FDM vs DLP vs SLA](https://youtu.be/3lRhZTdafE4)
- Mais sobre a diferença de materiais impressos:
  - [Guide to 3D Printing Filament! PLA ABS PETG TPU PEEK ULTEM](https://youtu.be/Or1FP43zx3I)
  - [The BEST 3D printing material? Comparing PLA, PETG & ASA (ABS) - feat. PRUSAMENT by Josef Prusa](https://youtu.be/ycGDR752fT0) 
  - [The Material Science of Metal 3D Printing](https://youtu.be/fzBRYsiyxjI)

## Referência

- [What are the Pros of 3D Printing?](https://www.twi-global.com/technical-knowledge/faqs/what-is-3d-printing/pros-and-cons)
- [The Road to 100,000 Original Prusa 3D printers](https://youtu.be/xX3pDDi9PeU)
- [A guide to 3D Printed Food – revolution in the kitchen?](https://www.3dnatives.com/en/3d-printing-food-a-new-revolution-in-cooking/)
- [3D-printed guns are back, and this time they are unstoppable](https://www.wired.co.uk/article/3d-printed-guns-blueprints)