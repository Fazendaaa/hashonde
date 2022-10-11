# HTTPS para desenvolvimento local

> Gaheris: "Nietzscheans don't believe in optimism. It inhibits survival."

> Dylan: "So does pessimism."

> Andromeda S01E01

foto de capa: ["El tunel"](https://www.flickr.com/photos/45771307@N07/22160227428) by [leonfhl](https://www.flickr.com/photos/45771307@N07) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Intro

Juntando o [último texto](https://fazenda.hashnode.dev/traefik-rancher-greater-homelab-upgrade)  publicado no blog com o último da série [R + Shiny + Mongo + Docker (RSMD)](https://fazenda.hashnode.dev/site-de-analise-de-dados-mas-na-verdade-e-um-app-no-android-windows-mac-e-no-seu-iphone) é possível agora explicar um pouco mais de como e porquê utilizar um reverse proxy para desenvolvimento local.

E como sempre os textos vão se tornando quase como um bolo que você consegue colocar uma camada acima da outra; só que, neste caso, as camadas são recursos para a sua aplicação e os recursos já configurados até agora são oclusos a tais novas adições -- podendo muito bem funcionar sem elas.

![148164470_24b709ed61_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615506677273/D4MDET--1.jpeg)

["Opera Cake"](https://www.flickr.com/photos/68436275@N00/148164470) by [p3nnylan3](https://www.flickr.com/photos/68436275@N00) is licensed under [CC BY-NC-ND 2.0 ](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

E, neste caso, uma das vantagens é que por mais que o exemplo seja em R a transferência do conhecimento que vai ter irá permitir que qualquer outra aplicação escrita em outras linguages e/ou frameworks poderá se beneficiar disso.

## Traefik

![253765659_47b7e9d7c8_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615507244735/xJIGoq6Kc.jpeg)

["Pipes"](https://www.flickr.com/photos/46861107@N00/253765659) by [flattop341](https://www.flickr.com/photos/46861107@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Como o [Traefik](https://traefik.io/) muitas vezes pode ser a tecnologia que vai rodar no servidor, ter a opção de rodar ela localmente pode ajudar a capturar erros antes de irem para produção, fazendo com que seja uma ótima opção para ter configurado em um arquivo de ambiente de homologação.

Caso queria aplicar o serviço em um ambiente de desenvolvimento uma das vantagens seriam:

- Não precisar deixar uma porta alocada no host para fazer o binding dos outros serviços. 
- Com o uso de domínios agora na aplicação você pode fazer até alguns testes com plugins de navagador ou expor o serviço para a sua rede por mais que amanhã ou depois seu IP mude
- Cachear requisições para ter uma noção de quanto os serviços podem ter um redução de consumo de recursos
- etc.

Transferir tal responsabilidade para o Traefik de gerenciar as aplicações e suas configurações de rede necessárias, sendo esse um dos papéis de um bom reverse proxy.

Reduzir o overhead de ter que fazer o binding de portas serviços sejam de terceiros ou não reduz a necessidade de ter que procurar por documentações deles, o que  ajuda o processo a correr mais tranquilamente e sem empecilhos.

## Docker

![96424272_9980f8d69e_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615507408162/BjB6mbL3_.jpeg)

["Container City 2, Leamouth, London"](https://www.flickr.com/photos/33917790@N00/96424272) by [Fin Fahey](https://www.flickr.com/photos/33917790@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Sem explicar **MUITO** o que o [Docker](https://www.docker.com/) é, apenas dizendo que ele é um sistema de criação, gerenciamento e execução de containers; e que containers são uma maneira de se encapsular um projeto. Uma das vantagens claras dessa tecnologia é colocada a prova agora: *segurança de excução sem overhead de configuração*.

Mesmo tendo mexido neste projeto [RSMD] pela última vez há oito meses e neste mesmo período:

- Ter instalado outro sistema operacional do zero e não configurado NADA de R e Mongo na máquina
- Os pacotes terem sido atualizados
- A linguagem em si ter recebido atualizações
- etc

Após ter o projeto na máquina e apenas executar o seguinte comando:

```
docker-compose up
```

Fez com que a seguinte aplicação estivesse acessível no navegador:

![2021-03-11-233148_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1615517914900/u5SxLG3c1.png)

Caso ainda seja díficil de acreditar, pense que isso poderia ser anos ao invés de meses.

Ter a flexibilidade de poder rodar uma aplicação após anos sem ver ela, por mais que tenha desenvolvido a mesma, é a *"pílula das boas notícias"* para qualquer desenvolvedor ou administrador de sistemas. Conseguir rodar tudo sem precisar configurar nada, apenas rodando um simples comando.

Há uma frase em desenvolvimento que diz: *"quando se escreve um código só você e Deus sabem o que está acontecendo, e em seis meses só um dos dois saberá o que o código fazia"*. Como o demonstrado, caso você seja ateu, a troca de Deus por Docker neste cenário é de 1:1.

## Configurando o suporte ao HTTPS

Para não entrar em detalhes de redes de computadores e o porquê de, neste caso, você precisar gerar os certificados na sua máquina e não dentro do container para o HTTPS funcionar; pense da seguinte maneira:

*Imagine uma situação onde uma marca revende um poduto genérico; ela ainda precisa colocar sua marca nele e fazer um registro, por mais que o fabricante seja um terceira tenha outro nome pro produto e outro registro. Desta maneira clientes desta marca sempre saberão que ela é a responsável por aquele produto e eles confiam no nome dela.*

![11299748713_61b774f02d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615511817539/tKPhJkpjH.jpeg)

["Munster & Leinster Bank Deposit Receipt (1938)"](https://www.flickr.com/photos/18378305@N00/11299748713) by [Can Pac Swire](https://www.flickr.com/photos/18378305@N00) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

Agora, traduzindo este exemplo para o caso do HTTPS, para a sua máquina -- o seu sistema --, essas aplicações são como o produto genérico dado; você vai precisar que o seu sistema "assine" a responsabilidade por eles e assuma este encargo de ser o registro dessas aplicações -- caso queria entender mais sobre, dê uma olhada nos vídeos em [referências](#referencias).

Para tal instale primeiro [mkcert](https://github.com/FiloSottile/mkcert) e então rode o seguinte comando:

```
curl https://gist.githubusercontent.com/Fazendaaa/289b72a80e2087577ee0fecee06e4417/raw/5b69b066038189c9a90ad304433dc632ebfa8942/configureMkcert.sh | sh
```

Ele irá apenas configurar as pastas e arquivos necessários para poder com que o processo de assinatura de responsabilidade pelas aplicações rodando seja realizado. Os dois arquivos mais importantes deste processo são o [config.yml](https://gist.github.com/Fazendaaa/a41a3d4bc4e693ac6f5fadc26817c520) e o [traefik.yml](https://gist.github.com/Fazendaaa/d518f09567f50cda3018f00211bce5a1), sendo que o primeiro trata mais de domínios e o segundo do detalhes de execução do reverse proxy.

A vantagem de deixar esses arquivos na sua máquina e não carregar elas dentro projeto é que o ambiente de homologação e/ou produção muito provavelmente terão valores diferentes, então eles podem apontar para outros arquivos, fazendo com que nenhuma reconfiguração ou build seja necessária.

Agora, caso ainda não tenha o projeto [RSMD](https://github.com/Fazendaaa/RSMD) em sua máquina, basta rodar os seguintes comandos:

```
git clone https://github.com/Fazendaaa/RSMD
cd RSMD
docker-compose up
```

E *voialá*... Só acessar `https://rsmd.docker.localhost` e ver a mágica acontecer:

![2021-03-12-084133_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1615549347603/7w1z5gCuM.png)

E a cereja do bolo neste cenário foi a adição de um painel de administração do banco de dados chamado [Mongo Express](https://github.com/mongo-express/mongo-express) rodando em `https://mongo-express.docker.localhost` -- basta digitar `rsmd` como usuário e senha para acessar o painel:

![2021-03-12-084155_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1615549357463/1-CPJVcMO.png)

Isto é bem exposto graças a três pontos no compose:

I. O Traefik -- como o reverse proxy desta aplicação:

```yaml
...
    reverse-proxy:
        image: traefik:v2.3
        security_opt:
            - no-new-privileges:true
        ports:
            - "80:80"
            - "443:443"
            - "8080:8080"
        volumes:
            - /var/run/docker.sock:/var/run/docker.sock:ro
            - ${HOME}/.certs:/etc/certs:ro
            - ${HOME}/.traefik/traefik.yml:/etc/traefik/traefik.yml:ro
            - ${HOME}/.traefik/config.yml:/etc/traefik/config.yml:ro
        labels:
            - "traefik.enable=true"
            - "traefik.http.routers.traefik=true"
        networks:
            - proxy
...
```

II. As aplicações com os seu valores marcados para o gerenciamento do Traefik:

```yaml
...
    mongo-express:
        image: mongo-express
        container_name: mongo-express
        environment:
            - ME_CONFIG_MONGODB_SERVER=mongodb
            - ME_CONFIG_MONGODB_ADMINUSERNAME=root
            - ME_CONFIG_MONGODB_ADMINPASSWORD=example
            - ME_CONFIG_BASICAUTH_USERNAME=rsmd
            - ME_CONFIG_BASICAUTH_PASSWORD=rsmd
        depends_on:
            - mongodb
        labels:
            - "traefik.enable=true"
            - "traefik.http.routers.mongo-express.tls=true"
            - "traefik.http.routers.mongo-express.rule=Host(`mongo-express.docker.localhost`)"
        networks:
            - proxy
...
```

III. E a exposição dessa configuração de rede exposta para o sistema da máquina:

```yaml
...
networks:
    proxy:
        external: true
...
```

Fora que uma vez configurado tal template caso queira também adicionar ou remover outros serviços, basta seguir o padrão de:

- Ative o Traefik no serviço
- Ative o TLS nele
- Nomei tal aplicação

E pronto, mesmo sem ter um conhecimento profundo de redes essas configurações são mais do que suficientes para ter um ponto de referência.

## Multiserviços

![16918905836_a7686aa51d_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615547471546/XhfViTcTU.jpeg)

["Shopping mall"](https://www.flickr.com/photos/58411470@N00/16918905836) by [kewl](https://www.flickr.com/photos/58411470@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

E assim você começa a ter uma exposição de aplicações escritas em linguagens diferentes...

- Shiny => R
- Mongo => C++
- Mongo Express => Node.js

*... se comunicando entre elas.*

Até agora o foco, em nível de linguagem, sempre foi o R e desenvolver coisas em volta dele; só que você acabou de subir um aplicação rodando com ferramentas feitas em linguagens diferentes, sem ter que configuar elas. Assim como a própria configuração de rede entre elas.

O seu tempo de:

- Build e configuração do environement necessário para rodar o seu código
- Baixar aplicações terceiras e configurar elas
- Fazer algum ajuste fino relevante pro seu cenário
- etc.

Não são mais necessários, eles ainda acontecerão de uma certa maneira quando rodar o `docker-compose up`, mas de maneira automática; o que te permitiria utilizar este tempo para tocar um outro projeto, ir ler sobre como melhorar o código, dar banho nos seus gatos, etc.

Mesmo que amanhã ou depois queira liberar algum sistema feito em Ruby, Python, Vue e etc, poderia seguir a mesma ideia lógica de escrever um `docker-compose.yml` e apenas rodar ele; por mais que a aplicação distribua os códigos e arquivos relvantes com ela, quem for rodar não vai precisar ter conhecimento do que está sendo utilizado por debaixo do capô. Podendo justamente continuar a utilizar até mesmo as mesas confingurações apresentadas hoje sobre mesmo mudar a tecnologia das outras aplicações.

Apenas pontuando: caso quisesse rodar a aplicação sem o TLS mas com o DNS das aplicações funcionado, você nem precisaria instalar o mkcert apenas o Docker para fazer tudo funcionar.

## Em suma

Como sempre uma das vantagens de ter a possibilidade de configurar tudo isso em um espírito de *Do It Yourself* (DIY) são custos... Muitas empresas utilizam as famosas "taxas de serviços" e conseguem aumentar os seus lucros com isso.

![5650719702_a64320e9de_o(1).jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615508555647/Os_ZSn7C0.jpeg)

["Problem solving fortune cookie"](https://www.flickr.com/photos/36116655@N00/5650719702) by [Tomasz Stasiuk](https://www.flickr.com/photos/36116655@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Assim como Vitual Machines (VMs) foram um grande salto para abstrair o hardware e facilitar o crescimento de serviços robustos e complexos; os containers com a sua abstração de sistema permitem que, atrelados com um bom planejamento, uma granulariadade mais fina seja alcançada, tangenciando um abstração de linguagens praticamente.

Além do já pontuado sobre o [Docker](#docker) em si, pense alguns passos além e imaginar o seguinte:

- *Um senior precisa rodar o seu código na máquina mas não tem como configurar todas as dependências necessárias*
- *Você codou no Windows 10 com um Intel i3 e o seu supervisor vai rodar em um Mac com M1*
- *O cliente vai querer fazer um teste na infra dele até o final do dia*
- *Subir o projeto na Amazon Web Services (AWS), no Google Cloud Plataform (GCP) e na Azure em alguns instantes ou até mesmo ao mesmo tempo nos três caso sejam clusters Kubernetes (K8s)*

Em todos esses cenários, este projeto conseguiria rodar tranquilamente e do jeito que está configurado. Segurança não tem só a ver com criptografia, anti-vírus e firewalls, tem também a ver com:

- Robustez da aplicação
- Produtividade de que enquanto um projeto se mantem redondo o desenvolvedor pode focar em outras tarefas mais relevantes do que ter que configurar um ambiente de desenvolvimento
- Portabilidade e escala de aplicações
- etc.

Caso ainda não tenha lido o texto de o porquê escapar de [vendor lock-in](https://fazenda.hashnode.dev/cansado-de-pagar-caro-com-o-shinyappsio-nada-mais-de-vendor-lock-in) no Shiny, altamente recomendado lê-lo para ver que não é só o ambiente que tem que ser abstraído, mas o produto também. Muitas vezes no ciclo de vida de uma aplicação ela pode ser reescrita de maneiras com que gastos e riscos sejam mitigados e até mesmo ganhos de performance sejam ofericidos. No exemplo dado, poderia se carregar facilmente outro painel de banco de dados ou, se dejar, outro sistema de análise poderia ser feito utilizando outra linguagem como Python ou Go por exemplo ao invés de R e, mesmo assim, mantendo o Mongo-Express e o Mongo.

Dizer que o realizado até agora foi um sistema baseado em microsserviços seria um desmérito ao termo e uma falsa propaganda. Para tal várias políticas precisariam ser modificadas e novas realizadas; todavia muitos microsserviços rodam em containers e você está cada vez mais familiarizado com a tecnologia...

## Apêndice

Caso você seja um desenvolvedor R como um estaticista, matemático, físico, químico, biólogo ou qualquer outra que não seja de Ciências da Computação (CC), correr atrás para saber como redes de computadores funcionam talvez não seja o melhor investimento do seu tempo pelo retorno que terá. Agora, se você é de CC ou de Engenharia de Computação, entender como tais redes funcionam farão a diferença, ainda mais por alguns pontos que não entraram neste ponto:

- Redes podem variar não só de acordo ao hardware mas ao software em si -- caso você esteja rodando a aplicação em um sistema Windows, não terá todas as configurações e suporte de redes que em um sistema Linux
- Entender que as vezes mesmo que você esteja rodando Ubuntu na sua máquina e um cluster K8s em uma Raspberry Pi na sua casa e achar que deveria estar tudo funcionando normalmente, a mudança de arquitetura fez com que perdesse suporte há algumas configurações da sua rede
- Saber portar e entender que muitas vezes por mais que as vezes a arquitetura possa ser de uma mesma família o porquê elas não comunicam direito -- no caso do ARMHF e ARM/v8
- Testar outros protocolos na aplicação
- Compressão de dados
- Distribuição de carga
- [Renovação automática de certificados](https://blog.linuxserver.io/2019/04/25/letsencrypt-nginx-starter-guide/) 
- etc.

![450303689_d36a9b4f4e_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1615508018393/bp0AcI9Kv.jpeg)

["Data storm"](https://www.flickr.com/photos/44038067@N00/450303689) by [Herkie](https://www.flickr.com/photos/44038067@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Caso queira "brincar" um pouco mais com o Traefik, basta abrir `htttps://traefik.docker.localhost` enquanto roda o sistema:

![2021-03-12-084207_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1615549373290/Btk9rb-gN.png)

Isso permitirá que se familiarize com a dashboard do sistema. 

Outra coisa importante no sistema RSMD é que você deve ter reparado no seguinte:

```yaml
...
    mongodb:
        image: mongo:3.6
        container_name: mongodb
        restart: on-failure
        environment:
            - MONGO_INITDB_ROOT_USERNAME=root
            - MONGO_INITDB_ROOT_PASSWORD=example
        networks:
            - proxy
...
```

Mesmo para que para o Mongo não tenha sido feito o suporte para o reverse proxy a aplicação precisa compartilhar a mesma rede que os outros serviços que acessam ela. O interessante é que por mais que neste exemplo exista apenas uma rede configurada, não há nada impedindo que configure mais de uma; isolando os serviços de maneira quase que "física" uma vez que pode fazer com que recursos apenas estejam disponíveis para àqueles que precisam dele, seguindo o princípio do menos privilegiado.

*Agora, olhando para um futuro não tão distante, quem sabe um dia vai ter uma aplicação de borda fazendo uma análise de um terminal rodando ARM, com um proxy rodando em RISC-V e um banco de dados em X86?*

## Referências

- [Traefik v2 HTTPS (SSL) on localhost](https://github.com/Heziode/traefik-v2-https-ssl-localhost)
- [AWS Announces RISC-V Support in the FreeRTOS Kernel](https://aws.amazon.com/about-aws/whats-new/2019/02/aws-announces-riscv-support-freertos-kernel/)
- [Docker's doc: network](https://docs.docker.com/network/)
- [Transport Layer Security (TLS) - Computerphile](https://youtu.be/0TLDTodL7Lc)
- [TLS Handshake Explained - Computerphile](https://youtu.be/86cQJ0MMses)
- [What are microservices?](https://microservices.io/)
- [Reverse Proxy Server Definition](https://avinetworks.com/glossary/reverse-proxy-server/)
- [Definition of the Principle of Least Privilege (POLP)](https://digitalguardian.com/blog/what-principle-least-privilege-polp-best-practice-information-security-and-compliance)