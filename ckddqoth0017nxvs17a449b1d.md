# Banco de dados em casa é 500 vezes mais barato do que na nuvem

> Se eu não comprar nada, o desconto é maior - Julius do Todo Mundo Odeia o Chris

foto de capa:  ["4:366 Jackpot"](https://www.flickr.com/photos/28636276@N08/6639141757) by [Strupey](https://www.flickr.com/photos/28636276@N08) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

Alguns nomes famosos de soluções de banco de dados:

- [Amazon Relational Database Service (RDS)](https://aws.amazon.com/rds/)
- [Oracle](https://www.oracle.com/cloud/)
- [Google Database](https://cloud.google.com/products/databases)
- [IBM](https://www.ibm.com/il-en/products/db2-database)
- [Atlas](https://www.mongodb.com/cloud/atlas)

Algumas ofertas de banco de dados na nuvem podem custar em torno de **500 reais por mês**, o que é certamente é caro para um projeto de desenvolvimento hobbyista ou até mesmo algo para uso pessoal. Todavia com algumas peças que provavelmente já tem em casa e 3 min do seu tempo, pode reduzir isso para algo em torno de **1 real por mês**.

![36478098435_0a9568d14a_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596403636262/qJpbxuOVs.jpeg)

 ["Removing Paper Files From Box"](https://www.flickr.com/photos/152864051@N02/36478098435) by [Whitefields Document Storage](https://www.flickr.com/photos/152864051@N02) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich) 

Antes de continuar algumas observações sobre um serviço na nuvem:

- Elasticidade fácil e rápida
- Suporte em muitos casos 24h por dia, sete dias por semanas
- Redundância
- Velocidade de rede
- etc

Se esses motivos forem relevantes para a saúde da sua aplicação pense duas vezes antes de continuar. A ideia deste texto é para que se encaixe em alguns cenários:

- Na hora de desenvolver seu trabalho de faculdade
- Rodar um Trabalho de Conclusão de Curso (TCC) ou Iniciação Científica (IC)
- Uma demo de pitch de um serviço/produto que quer oferecer para alguma empresa
- etc

Não é recomendado colocar uma solução dessas em produção com essa abordagem para clientes e/ou serviços críticos; a não ser que queira ir um pouco além do que este texto vai tratar -- como configurar melhor um banco de dados, política de rede, snapshots, etc -- por conta própria ou mesmo contratar um profissional, amigo, conhecido para configurar isto para ti.

## Docker

![32559485255_2355256f4b_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596404088745/zLJysKdUS.jpeg)

["Blue boxes"](https://www.flickr.com/photos/125213989@N05/32559485255) by [GLNT eye](https://www.flickr.com/photos/125213989@N05) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Caso tenha chegado neste texto pela ideia de economizar em contas de banco de dados e não conheça [Docker](https://www.docker.com/) em si, não se preocupe. Resumindo muito e jogando a teoria pela janela, você pode pensar nele como: *uma Virutal Machine (VM) de uma aplicação só que roda de maneira muito leve eficiente*.

Uma vez que ele consome menos recursos, menos energia, tem um ciclo de desenvolvimento mais rápido e etc, essas economias são repassadas para aplicações desenvolvidas utilizando ele.

Caso já tenha ouvido falar dele e esteja se perguntando se a sua aplicação precisa rodar dentro de um container -- dentro de um Docker --, a resposta é "não". Assim como um banco de dados poderia estar rodando em uma VM e a sua aplicação em outra, ou até mesmo no seu próprio usuário, sem maiores problemas esta abordagem não requer tal configuração.

Há um site que funciona como uma "Docker Store" no qual pode ver a  [lista](https://hub.docker.com/search?category=database&source=verified&type=image) de banco de dados disponíveis nele. Fora o suporte multiplataforma, o que permitiria você estar rodando um serviço no Windows ou Mac sem precisar se preocupar com alguns pontos críticos de bancos de dados:

- Instalar
- Configurar
- Updates que em alguns casos acabam quebrando outros serviços que rodam no sistema
- Segurança
- etc

Para o desenvolvedor que roda um banco de dados do tipo [Mongo](https://www.mongodb.com/) através da nuvem do Atlas, basta rodar o seguinte comando:

```shell
docker run --name meumongo --env MONGO_INITDB_ROOT_USERNAME=usuario --env MONGO_INITDB_ROOT_PASSWORD=senha mongo
```

E conectar na sua aplicação com uma conexão do tipo `"mongodb://usuario:senha@meumongo:27017"` ao invés da conexão passada pela nuvem. Caso queira rodar o banco de dados sem que ele imprima nada no seu terminal, basta passar a flag `--detach`; sempre há [mais](https://hub.docker.com/_/mongo) configurações disponíveis.

No mais, basta rodar/desenvolver sua aplicação normalmente, isto porque terá uma conexão aberta até encerrar o seu banco de dados o desligar seu computador.

### Docker-compose

![2365783075_f87357840d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596404217988/Q57jVstzl.jpeg)

["Jenga"](https://www.flickr.com/photos/23377996@N00/2365783075) by [jose.jhg](https://www.flickr.com/photos/23377996@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

Caso a sua aplicação já esteja rodando com Docker e queria rodar tanto ela como o banco de dados para desenvolvimento local poderá rodar com um simples comando no terminal:

```shell
docker-compose up
```

O [Docker Compose](https://docs.docker.com/compose/) se trata de um executor de configurações do Docker, basicamente ele fica responsável para que todo o processo descrito funcione de maneira fácil para um humano configurar e entender. Um exemplo de projeto que roda com um banco de dados e servidor web é o [RSMD](https://github.com/Fazendaaa/RSMD). Caso queria rodar ele, basta salvar [este](https://github.com/Fazendaaa/RSMD/blob/master/docker-compose.yml) arquivo, abrir um terminal na pasta que salvou o arquivo e digitar o comando citado; logo depois para ver o resultado abra seu navegador e digite `localhost`.

## Rancher

![31294361_65f68ee432_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596404418819/KnJoFc5Xg.jpeg)

 ["Ranch Fence"](https://www.flickr.com/photos/55761924@N00/31294361) by [Rob Lee](https://www.flickr.com/photos/55761924@N00) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=ccsearch&atype=rich)

O [Rancher](https://rancher.com/) é o facilitador de rodar projetos Docker em um servidor, gerenciando, atualizando e garantido a saúde de todos eles.

*"Servidor? Mas você disse que seria sem nuvem!"*

R: Você pode subir um servidor em casa com um desktop parado, laptop antigo, uma placa de desenvolvimento mais simples e etc

Uma das vantagens do Rancher é uma tela simples, fácil de configurar e acessar:

![image891.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1596409869072/wZIynb8ms.png)

Além de tudo isso, caso tenha um serviço já rodando na nuvem com  [Kubernetes](https://kubernetes.io/), você pode configurar ele pelo Rancher; não só um como vários, além dos próprios serviços de uso local da sua residência ou até mesmo da empresa. Além de tudo isso, backups, atualização e comunicação de multiplos serviços e do próprio sistema se tornam mais simples, reduzindo a possibilidade de erros no processo, aumentando o seu nível de segurança e disponibilidade.

Para fazer o RSMD rodar [neste](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf) servidor Rancher, bastaria configurar ele como mostrado [aqui](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo-ckcfwjz380058kns13oye8f03).

## Considerações finais

![37526128274_2e089c34b0_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1596405296239/-vKXz6f3D.jpeg)

["Burn Burn"](https://www.flickr.com/photos/37996646802@N01/37526128274) by [cogdogblog](https://www.flickr.com/photos/37996646802@N01) is licensed under [CC0 1.0](https://creativecommons.org/licenses/cc0/1.0/?ref=ccsearch&atype=rich)  

Alguns números antes de continuar:

- Gasto de 560 reais por mês => 6720 por ano
- Gasto de 1 real por mês => 12 reais por ano
- Diferença de 6078 reais por ano. Ou o equivalente a:
  - Rodar o serviço de 1 real por mês durante quase 560 anos
  - Menos que o preço de um [laptop](https://www.amazon.com.br/Notebook-Dell-Inspiron-i15-3583-A3XP-i5-8265U/dp/B07WCV29BD/ref=sr_1_5?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=laptop&qid=1596410871&sr=8-5) com:
    - 8ª Geração Intel Core i5-8265U
    - Memória RAM 8GB
    - 1TB HD
    - E ainda sobram 2700 reais
  - E para usar o [Índicie Big Mac](https://www.poder360.com.br/economia/indice-big-mac-veja-a-cotacao-de-moedas-do-mundo-pelo-preco-do-hamburguer/): 396 Big Macs. Poderia comer um por dia durante um ano -- ou o equivalente a 12 vezes [A Dieta do Palhaço](https://pt.wikipedia.org/wiki/Super_Size_Me)  -- e ainda sobrariam 31 reais.

Caso dinheiro não seja o fator limitante para a sua aplicação, este texto pode ter sido um dos maiores desperdício de tempo que já teve. Mas caso ele seja um fator considerável, a abordagem apresentada pode fazer com que considere outras maneiras de solucionar a sutiação apresentada de utilizar um banco de dados.

## Apêndice

- A conta de gastos da RDS foi a seguinte:
  - [PostegreSQL](https://www.postgresql.org/) 
  - [South America (São Paulo)](https://aws.amazon.com/rds/postgresql/pricing/)
  - [db.t3.medium](https://aws.amazon.com/rds/instance-types/) -- foi escolhido ele mais pela quantidade de RAM uma vez que muitos Single Boards Computers (SBC) costumam ter 4GB também
  - Um mês igual a 30 dias
  - Serviço rodando 24 h por dia
  - 1 USD = 5.22 BRL
  - Não se considerou impostos como [IOF](https://www.serasa.com.br/ensina/dicas/o-que-e-iof/) ou qualquer outro tipo de impostos que fossem aplicáveis
```
0.151 * 30 * 24 = 567.51 (aproximadamente)
```
- A conta de gastos de energia foi derivada [deste](https://canaltech.com.br/curiosidades/quanto-um-carregador-ligado-na-tomada-consome-de-energia/) texto considerando-se apenas uma placa baseada em ARM 64 bits conectada à um carregador de celular.
- Em ambos os casos as comparações não foram feitas 1:1 uma vez que a ideia do texto é mostrar cenários que a nuvem pode ser desnecessária para a tarefa
- A conta em si foi feita com o PostegreSQL por causa de alguns fatores:
  - [Maior](https://www.datanyze.com/market-share/databases--272) market share
  - Maior banco open source da lista
  - Certa familiaridade com o banco por ter utilizado ele há alguns anos
- Todavia os exemplos foram dados com MongoDB por ser o banco de dados que mais utilizo
- Como cada banco de dados possui sua maneira de salvar os arquivos no sistema operacional que roda ele através do Docker, não foi dado nenhum exemplo disso por ser algo que cada caso seria um caso e no exemplo dado com o RSMD já foi tratado isto.

## Referências

- [How to overcome 5 common database challenges](https://jaxenter.com/overcome-5-common-database-challenges-149559.html) 