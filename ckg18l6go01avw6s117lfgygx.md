# Centralize os favoritos em qualquer browser e em qualquer device

> Firefox, Chrome, Edge, Vivaldi, Safari... Browsers, browsers everywhere

foto de capa: ["IMG_3207"](https://www.flickr.com/photos/17728973@N00/3840102876) by [krunkwerke](https://www.flickr.com/photos/17728973@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

## Intro

Se você ainda não conhece o [One Tab](https://www.one-tab.com/), se trata de um plugin pra navegadores onde você aglutina as suas abas abertas com um clique. Caso isso seja o que procure e supra bem suas necessidades vá em frente e o utilize; simples e fácil de instalar, nunca tive problemas antes. Agora, as suas limitações:

- Não há sincronização, então para há dois cenários que precisará exportar para uma URL compartilhável:
  - Se você precisar acessar de acessar os links em outra máquina
  - Se quiser acessar na mesma máquina mas em outro navegador
- Por não ter sincronização e o One Tab **NÃO** ser um plugin favoritos, se você perder sua máquina, reinstalar o seu sistema operacional ou coisa do tipo, vai perder suas abas caso não tenha salvo elas nos favoritos e/ou exportado para um formato de backup

Ao procurar uma alternativa que suprisse as novas necessidades e com a abordagem de rodar no homelab apareceram: o [Wallabag](https://wallabag.org/en) e [reminiscence](https://github.com/kanishka-linux/reminiscence).

O Wallabag possuí uma inteface muito bonita e uma opção hosteada por eles mesmo por 9 euros ao ano muito interessante. Todavia a imagem Docker deles é deplorável para dizer ao mínimo.

Já o **reminiscence** é uma solução mais simples de interface, todavia com um documentação incrível do projeto.

![6803716862_8beebd1275_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602114410254/yKQ5dWcga.jpeg)

["Library"](https://www.flickr.com/photos/31813931@N03/6803716862) by [dlebech](https://www.flickr.com/photos/31813931@N03) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

## Raspberry

A [Raspberry PI](https://www.raspberrypi.org/) é uma -- se não for a mais -- das mais famosas marcas de Single Board Computer (SBC). Comumente utilizada para:

- Controladores
- Ensino
- Retrogaming
- Clusters
- etc.

Com o tamanho aproximado de um cartão de crédito e utilizando um simples cabo USB para puxar sua energia de um adaptador de celular ou até mesmo da porta presente no seu laptop, a placa entrega MUITO dentre suas limitações. O quarto modelo de sua série apresenta as seguintes características:

- Processador ARM quad core 64 bits
- Disponibilidade em 2, 4 e 8 GB de LPDDR4 -- o LP siginifica "Low Power"
- Internet Gigabit
- Duas entradas para monitores 4k
- etc

![48673736192_773293b354_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602021857079/Qtp7wpwp4.jpeg)

["Raspberry Pi 4 Model B"](https://www.flickr.com/photos/35434449@N08/48673736192) by [adafruit](https://www.flickr.com/photos/35434449@N08) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=ccsearch&atype=rich)

## Kubernetes (k3s)

Se já leu alguns dos textos publicados até agora, já deve ter uma noção de [Docker](https://www.docker.com/) e de [Rancher](https://rancher.com/), só que neste em especial o foco será a camada a cima do Docker, o [Kubernetes](https://kubernetes.io/)  -- o sistema no qual o Rancher é construído em cima.

Caso tenha vindo parar aqui por vontade do destino e não saiba o que eles são:

- Docker é uma maneira fácil, segura e barata quando comparada com uma Virutal Machine (VM) de desenvolvedores distribuirem seus projetos
- Kubernetes é uma maneira de organizar tais projetos
- Rancher é um facilitador do Kubernetes

Você pode ver como a seguinte analogia:

- **Docker**: pacote a ser postado nos Correios
- **Kubernetes**: a infra de rotas de entregas, carteiros, escala e etc
- **Rancher**: a agência onde o cliente posta ou retira seu pacote sem precisar entender a complexidade de rodar toda a operação

![41747044670_d3dfbe1884_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602122266329/acLZmMIsW.jpeg)

["postal service"](https://www.flickr.com/photos/63812090@N00/41747044670) by [Alexander.Hüls](https://www.flickr.com/photos/63812090@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Para se instalar o Kubernetes na Raspi 4, tudo será feito com os seguintes passos e um microSD -- foi utilizado um de 16GB:

1. Instale o [Ubuntu Server](https://ubuntu.com/download/server) nela:

  I. Use o Etcher colando [este](https://ubuntu.com/download/raspberry-pi/thank-you?version=20.04.1&architecture=arm64+raspi) na opção da URL da imagem

  II. Abra o gerenciador de arquivos, procure uma partição do seu micro-sd chamada `system-boot` e crie um arquivo de texto em branco chamado `ssh`.

  III. Coloque a Raspi em um cabo de rede, coloque o cartão de memória nela e a ligue. Caso não tenha o cabo, leia [aqui](https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#3-wifi-or-ethernet) como configurar para a opção de WiFi.

2. Procure o IP da sua placa na sua rede -- aplicativos de modems normalmente mostram isso -- e conecte nela por `ssh` -- a senha é `ubuntu`:
```shell
ssh -l ubuntu ip.da.sua.raspi
```
3. Faça as configurações necessárias.

4. Rode o seguinte comando:
```shell
curl https://gist.githubusercontent.com/Fazendaaa/8fe033c5428e3f26daf69910693c4d07/raw/8c3299dc457e7d2cbc35340f56261fa8a0e81588/rasp4Rancher.sh | sh
```

Este último comando irá instalar o [microk8s](https://microk8s.io/), configurar a sua placa e reiniciar ela para poder ser utilizada nos próximos passos.

## Rancher

Partindo da analogias anteriores, o Rancher é o agência na qual postaremos o pacote. Para poder rodar o sistema será necessário ter pacote antes. O **Reminiscence** não possuim uma embalagem oficial disponibilizada por eles, mas uma foi feita para este projeto e o passo a passo dela foi disponibilizado para o projeto caso queiram tornar-lá ela oficial.

Esta embalagem nova foi baseada em uma antiga mas não tão recomendada para este caso por se basear no uso de um sistema de armazenamento de servidores mais próximos de você -- o famoso cache --, que não será necessário uma vez que não há necessidade de uma Content Delivery Network (CDN) uma vez que todo o serviço rodará na sua rede -- mais próximo que qualquer servidor de terceiros.

Este novo pacote foi feito disponibilizado em [fazenda/reminiscence](https://hub.docker.com/r/fazenda/reminiscence) para as seguintes arquiteturas:

- 386
- amd64
- arm/v7
- arm64
- ppc64le
- s390x

Para adicionar a Raspi ao seu atual cluster Rancher, a opção de adicionar um novo não funciona, mas graças aos passos realizados anteriormente podemos registrar um cluster já existente:

I. No seu [já presente](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm) painel do Rancher, clique em `Add Cluster`:

![image1147.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602172485913/VTXTcUsF2.png)

II. Selecione a opção `Import an existing cluster`:

![image1031.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602172269519/wYMvX6ofS.png)

III. Dê um nome ao seu cluster:

![image1017.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602172286080/KhsqWoIrp.png)

IV. Espere nesta tela:

![g1203.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602173333140/_pg1QmwSP.png)

V. Conecte na sua Rapi 4 por SSH:

```shell
ssh -l ubuntu ip.da.sua.raspi
```

VI. Coloque o terceiro comando na sua placa:

```shell
curl --insecure -sfL https://seu.ip.rancher/chave.yaml | kubectl apply -f -
```

VII. Coloque o segundo comando:

```shell
kubectl apply -f https://seu.ip.rancher/chave.yaml
```

VIII. Pronto, sua placa foi registrada:

![image989.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602172330960/23HUk2lYe.png)

> Agora um novo "rancho" foi adicionado ao seus, vaqueiro...

![33368477815_08ac7d4647_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602021659986/kQ5um5gsW.jpeg)

["farm scene"](https://www.flickr.com/photos/17094005@N00/33368477815) by [Christian Collins](https://www.flickr.com/photos/17094005@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

1. Agora, para deployar sua aplicação será necessário ter um deploy do banco de dados [postegres](https://hub.docker.com/_/postgres) antes, caso já tenha um, pode pular este passo:

  I. Acesse a placa de novo caso tenha fechado a conexão com ela:
```shell
ssh -l ubuntu ip.da.sua.raspi
```
  II. Cole os seguintes comandos:
```shell
mkdir ~/postegres
cd ~/postegres
pwd #copie o resultado deste comando
```
  III. Coloque os seguintes valores para a imagem:
![image1295.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602175376439/0ZwmgjVUS.png)
  IV. Os seguintes para as variáveis de ambiente:
![image1402.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602175649597/IXqKW9nIC.png)
  V. E monte o seguinte caminho o passo II -- lembrando que o meu é `/home/ubuntu/postegres` mas o da sua placa pode ser diferente:
![image1281.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602175402561/Ndr4Q_XqL.png)

2. Agora deployar o **Reminiscence**:

  I. Coloque os seguintes valores para a imagem:
![image1534.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602176873408/HFHWBlyE5.png)
  II. Coloque o seguinte para a porta:
![image1534-2.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602176887798/O5b-hMSd6.png)
  III. E as seguintes variáveis de ambiente:
![image1520.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602176897557/n1gE5IYK8.png)
  IV. Só abrir o IP utilizado -- digitar `admin` para usuário e `changepassword` para senha:
![g1783.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602176915416/o9bXqtpGg.png)
  V. Pronto, seu **Reminiscense** foi deployado:
![g1792.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1602176926091/B9ce_KaMM.png)

## Considerações Finais

Por ser um dos projetos mais simples e melhor feito que eu já vi, nessas horas eu lembro da frase do chefe de cozinha Henrique Fogaça durante as provas do Master Chef: *"menos é mais"*.

Com a experiência de rodar alguns serviços por meses em SBCs e vendo que não há muita dificuldade nem a questão do custo alto, a ideia é começar a mostrar como fazer placas e sistemas que não são suportados oficialmente com um comando do Rancher funcionar nele com a média de três comandos. Claro que isso vai ser até o Rancher funcionar em sistemas assim, principalmente para arquiteturas 32 bits -- ou até eu ter tempo para parar e ver de modificar o código para tal e enviar para o pessoal do projeto.

Com a Raspi 4 de 8GB sendo uma das placas com maior quantidade de RAM, tavez seja uma das melhores opções de homelab uma vez que muitas vezes o processador dela pode dar conta de muita coisa que você queira utilizar mas está limitado ao número de sistemas que pretende rodar pela quantidade de 2 ou 4 GB de RAM.

Novo suporte para uma nova placa abrem caminhos para novos desafios.

![3575912092_c271674027_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1602023328832/1cjsoeclh.jpeg)

["Learning sea mapping"](https://www.flickr.com/photos/38844604@N07/3575912092) by [Ratko Bozovic](https://www.flickr.com/photos/38844604@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Apêndice

- Infelizmente o processo de configuração da Raspi tem que ser feita da forma descrita no texto -- diferentemente do apresentado nos outros textos que se resume a um `docker run ...` --; mesmo com testes realizados em:
  - Raspian 64 bits
  - Ubuntu Server
  - Manjaro
  - Alpine
  - Ubuntu MATE

Fazendo diversas configurações para ver se alguma funcionava, foram três dias de dedicação praticamente que integrais, verificando várias configurações diferentes, para se chegar a conclusão de que provavelmente é algo que não consigo pountar ao certo o que possa ser uma vez que o erro se tornou díficil de pontuar -- todavia chuto ser algum driver -- e um dos passos colocados no script de configuração para suporte foi feito graças à um teste na hora de subir o serviço a ser publicado no  [próximo](https://fazenda.hashnode.dev/seu-proprio-github-em-casa-e-de-graca) texto.
- Ajudas do StackOverflow:
  - [Esta](https://github.com/ubuntu/microk8s/issues/749#issuecomment-545329917) resposta de ktsakalozos ajudou e muito no processo
  - [Este](https://stackoverflow.com/a/59550723) comentário que achei porque copiei a linha errada mas do problema certo
  - Já com a questão do Python e sua migração de Debian para Alpine, [este](https://stackoverflow.com/a/47871121/7092954)
- Para entender um pouco mais de Nginx, [este](https://www.domysee.com/blogposts/reverse-proxy-nginx-docker-compose/) texto ajudou uma vez que possuo maior familiaridade com [Traefik](https://traefik.io/)
- Depois de horas e horas procurando entender e corrigir o processo de build do Wallabag, encontrei o Reminiscence através do [alternative to](https://alternativeto.net/software/wallabag/)
- Pretendo ler mais sobre Kubernetes para poder explicar a importancia dele, do Swarm e como traduzir um Compose para um deploy em Rancher/Kubernetes; além de explicar sobre microk8s, minikube, kubeadm, k3d, rke e etc.
- Como o Dockerfile e o Compose oficiais precisavam do Nginx e rodar com do Guinicorn, a modificação feita foi remover os dois e rodar dom o servidor próprio do Django. Isso porque as duas primeiras opções combinadadas cuidavam de cache, avaliabilidade do sistema, segurança e etc; coisas importantes para um serviço em uma rede pública no qual você pode ter acesso de todos os lugares do mundo e pelos mais diversos players -- o que não é o cenário do texto

## Referências

- [Introduction to MicroK8s](https://microk8s.io/docs)
- [Raspberry Pi 4 Tech Specs](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/specifications/)
- [K3s, minikube or microk8s?](https://www.reddit.com/r/kubernetes/comments/be0415/k3s_minikube_or_microk8s/)
