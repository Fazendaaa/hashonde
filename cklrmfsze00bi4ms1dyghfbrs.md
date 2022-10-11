# Traefik + Rancher => Homelab Upgrade

> "Amat Victoria Curam"

foto de capa: ["Gare de triage de Sotteville"](https://www.flickr.com/photos/38712296@N07/9623870436) by [zigazou76](https://www.flickr.com/photos/38712296@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

## Intro

Meses após ter requisitado por [este](https://youtu.be/pAM2GBCDGTo) tutorial em um comentário do vídeo anterior do canal, finalmente é a vez de colocar a mão na massa e subir o [Traefik](https://traefik.io/). Todavia, ao procurar reproduzir o do vídeo alguns passos que não foram só citados são esclarecidos aqui e algumas outras modificações foram feitas, então não será um vídeo 1:1.

E caso não saiba o que ele é e pra quê ele serve, basicamente se trata de um *reverse proxy*.

O Traefik fica na "frente" dos serviços rodando em um servidor como um "validador/verificador" de requisições. Você pode pensar nele como um segurança de uma balada:

- Verifica se o nome está na lista -- *"se é um IP permitido"*
- Verifica se és maior de idade -- *"verifica se tem os headers necessários"*
- Verifica se você não está armado -- *"impede ataques maliciosos"*
- etc.

![5527152945_2d75239db5_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614647964024/bYOXVwLOF.jpeg)

["Elmo the bouncer"](https://www.flickr.com/photos/75062596@N00/5527152945) by [Lars Plougmann](https://www.flickr.com/photos/75062596@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

Uma das vantagens de se se usar um reverse proxy para fazer isso não são apenas os fatores citados, eles vão muito além disso; mas outros pontos importantes a serem citados:

- Eles tiram do desenvolvedor a responsabilidade de ter que tratar tais cenários -- redes não são triviais e elas existem desde antes da World Wide Web, sendo que muitas configurações de baixo nível são realmente díficeis e muitas vezes feitas em linguagens mais baixo nível para serem performáticas
- São reaproveitáveis, uma vez que um reverse proxy pode ser responsável por vários serviços
- São leves e escalam facilmente
- Anos de experiência -- muitas linguagens/frameworks vem e vão, mas muitos reverse proxy continuam os mesmos nos últimos 30 anos
- etc.

## Por que não NINGX?

![14740359054_3c16554baa_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614548862160/o9JWOziaZ.jpeg)

["Challenger 2 Tank on Salisbury Plain"](https://www.flickr.com/photos/48399297@N04/14740359054) by [Defence Images](https://www.flickr.com/photos/48399297@N04) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=ccsearch&atype=rich)

Mesmo o NINGX sendo como um tanque:

- Potente
- Consegue carregar várias coisas
- Tem seu papel histórico por ter sido uma das maiores armas de sua época

O Traefik seria como um Lav:

- Uma "evolução" do tanque
- Mais flexível por rodar em vários terrenos e ser anfíbio
- Pode uma carta coringa por ser mais leve e de fácil manutenção

![LAV3.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614550674783/SVIZ25fdp.jpeg)

["File:LAV3.jpg"](https://commons.wikimedia.org/w/index.php?curid=8716080) by [Mike from Vancouver, Canada](https://www.flickr.com/people/37804160@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0?ref=ccsearch&atype=rich)

Esta comparação por mais superficial pode ser realmente derivada uma vez que alguns dos pontos de comparações dois serviços são:

- NGINX é mais antigo que o Traefik, ele foi feito para o começo da web onde vários serviços viviam apenas no bare-metal e precisavam de configurações de mais baixo nível
- O Traefik é leve e "amigável para desenvolvedores" com arquivos de configurações fáceis de se modificar sem precisar ter um background denso em redes e/ou modificar tabelas de IPs no host de desenvolvimento
- O Traefik é escrito em Go, o que torna de fácil acesso para muitos desenvolvedores
- etc.

O Traefik pode ser utilizado com seu arquivo acme de configuração, através de uma API ou até mesmo em um docker-compose e etc; todavia neste texto será apenas tratado como configurar ele através de um cluster [kubernetes (K8s)](https://kubernetes.io/).

## Rancher

![14193867351_0c4de1b86c_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614648988527/4JbfoRzr1.jpeg)

["Bull in the vines."](https://www.flickr.com/photos/88123769@N02/14193867351) by [Bernard Spragg](https://www.flickr.com/photos/88123769@N02) is marked with [CC0 1.0](https://creativecommons.org/licenses/cc0/1.0/?ref=ccsearch&atype=rich)

O [Rancher](https://rancher.com/) nada mais é do que um facilitador para o se utilizar o K8s, permitindo que:

- Tenha a sua própria nuvem com o que a Amazon Web Services (AWS), Azure e Google Cloud Plataform (GCP) oferecem de melhor em nível de serviço -- *sendo um pouco melhor até do que duas das citadas*
- Que os sistemas rodem sem estarem presos à APIs proprietárias dos serviços citados
- Controle mais clusters com mais vantagens do que seus competidores como o [Portainer](https://www.portainer.io/) e o [Open Shift](https://www.openshift.com/)
- etc.

## Rebinding de portas

Caso tenha seguido [este](https://rancher.com/docs/rancher/v2.x/en/backups/v2.5/docker-installs/docker-backups/) tutorial para fazer seu Rancher rodar, será necessário fazer o remapeamento de portas. Todavia é recomendado que siga um procedimento de backup anteriormente -- para mais informações leia o apêndice.

I. Acesse por `ssh` o seu servidor
II. Primeiramente dê um `docker ps` para ver o nome do seu container:
```
CONTAINER ID   IMAGE                    COMMAND           CREATED             STATUS          PORTS                                      NAMES
23ba4a5f678   rancher/rancher:v2.4.7   "entrypoint.sh"   About an hour ago   Up 49 seconds   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   newton_raphson
```
III. Depois dê um `docker stop <nome do container aquI>`:
```
docker stop newton_raphson
```
IV. Commite a o container atual para um novo `docker commit <nome do container aquI> <novo container aqui>`:
```
docker commit newton_raphson rancher
```
V. Inicie o container remapeando a sua porta 80 e 443 para outras duas portas livres no seu servidor:
```
docker run -d \
 --restart=unless-stopped \
 --publish 8080:80 \
 --publish 8443:443 \
 --volume /opt/rancher:/var/lib/rancher \
 --volume /lib64:/lib64 \
 --volume /etc/cni/:/etc/cni/ \
rancher
```

## Linode

Caso consuma muita mídia estrangeira de computação -- principalmente parte de infra -- já deve ter ouvido falar da empresa [Linode](https://www.linode.com/); eles são um dos maiores provedores independentes do mundo e:

- Estão no mercado desde 2003
- Sem vendor lock-in
- Preços baixos

![115781801_d11767a5a6_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614548530415/oevaFLOxw.jpeg)

["Backbone #2"](https://www.flickr.com/photos/15987342@N00/115781801) by [AndiH](https://www.flickr.com/photos/15987342@N00) is licensed under [CC BY-NC-ND 2.0 ](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Caso queira já criar sua conta, basta pesquisar seu criador de conteúdo favorito no Google com o nome da empresa, provavelmente ele já deve ter feito alguma parceira com um cupom de 100 dólares para teste.

Uma vez feita a sua conta no site, crie uma API key clicando [aqui](https://cloud.linode.com/profile/tokens) com os seguintes valores:

![image877.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614665741454/Wz7HKgqP7.png)

Ela gerará uma chave que não poderá ser copiada depois, portanto é recomendado deixar esta aba aberta até precisarmos dela mais pra frente no tutorial.

## Instalando kubectl

Esteve vai ser o primeiro tutorial que será necessário o uso do kubectl -- uma ferramenta para o seu terminal que auxilia tarefas de gerenciamento remoto do cluster K8s.

I. Na sua máquina de acesso ao servidor rode os seguintes comandos:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
II. Para configurar o seu kubectl para acessar seu Rancher, basta abrir o seu cluster:
![image1097.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614656250064/gBRRIxacj.png)
III. Dentro dele copiar o conteúdo dentro do botão *Kubeconfig File*:
![image1145.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614656302489/yK1oReAzh.png)
IV. Na sua máquina digite:
```
nano ~/.kube/config
```
V. Cole o conteúdo do seu kubeconfig, salve e rode:
```
kubectl get namespaces
```

Caso apareça alguma mensagem de erro ou alguma coisa do tipo, você tem um erro em alguma configuração; por favor procure sanar ele antes de prosseguir.

## Configurando MetalLB

Para utilizar o intervalo necessário de IPs para o MetalLb como mostrado [aqui](https://metallb.universe.tf/configuration/) foi instalado o [Angry IP](https://angryip.org/). Para ver o intervalo da sua rede basta abrir o programa e olhar para a tela e o intervalo dado, será algo do tipo:

![g917.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614653554630/5l40wzEMe.png)

No tutorial em vídeo é citado também de se fazer um DNS record na sua rede ou no seu PC para auxiliar durante o processo. No caso exemplificado não será necessário pois a Single Board Computer (SBC) já possui tal entrada configurada, mas caso queira saber como poderia configurar uma, basta ver um exemplo [aqui](https://superuser.com/a/597820).

I. Para instalar e configurar o serviço no seu cluster, basta rodar:
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```
II. Uma vez rodado o comando, verifique se ele está online antes de prosseguir com:
```
kubectl get namespaces
```
III. Crie um arquivo de configuração com `nano config.yaml` e cole o seguinte conteúdo:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 10.112.79.240-10.112.79.250
```
IV. Aplique a sua configuração com:
```
kubectl apply -f config.yaml
```

Como pode ter reparado, mesmo o meu intervalo de rede sendo 10.112.79.0 <-> 10.112.79.255, acabei mudando para 10.112.79.240 <-> 10.112.79.250 para ficar similar ao 192.168.1.240 <-> 192.168.1.250 da documentação do MetalLb

## Configurando Traefik

![23376648800_1e7bb30aaa_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614548172439/7hNxeee93.jpeg)

["Traffic Light Tree @ Billingsgate London."](https://www.flickr.com/photos/36989019@N08/23376648800) by [Loco Steve](https://www.flickr.com/photos/36989019@N08) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=ccsearch&atype=rich)

I. Abra o namespace do sistema no seu cluster:
![image1223.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614656973055/-wup7qrUm.png)
II. Clique na aba **Apps** e depois no botão de **Launch**:
![image1277.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614657035365/lhgtm7HGZ.png)
III. Selecione o Traefik:
![g1345.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614657190737/yXywnkZie.png)
IV. Selecione **Use an existing namespace** em namespace e selecione *kube-system*:
![image1391.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614657330920/CTGTxXx2P.png)
VI. Selecione *True* em SSL

VII. Selecione *True* em **Let's Encrypt** e configure o seu e-mail

VIII. Mode o **Challengetype** para *dns-01*

IX. E **Enable** selecione *True* -- nesta parte usarei o domain da minha SBC que consegui na aba *Hostname* do scan da minha rede com o Angry Ip, mas caso se não faça dessa maneira, precisará criar o DNS Record

XI. Clique em **Edit as YAML**:
![image1445.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614657966420/wFuh-37rL.png)

XII. No grupo acme adicione as seguintes linhas com os valores de **dnsProvider**:
```yaml
...
  acme: 
    enabled: true
    email: "seuemail@aqui.com.br"
    onHostRule: true
    staging: true
    logging: true
    challengeType: "dns-01"
    dnsProvider:
      name: "linode"
      existingSecretName: "linode-dns"
...
```

XIII. Abra de novo a tela do namespace do sistema -- passo `I`

XIV. Vá para a aba de recursos e clique em segredos:
![image1577.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614658231064/kqPnDXMER.png)
XV. Clique em **Add Secret**:
![image1563.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614658247002/BV46m2bpt.png)
XVI. Configure um novo segredo adiconando chamado "linode-dns" com o a chave de `LINODE_API_KEY` e a chave com o valor gerado no passo de configuração do [Linode](#linode):
![image1655.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614658670836/tsBqSd8Fv.png)
XVII. Vá para o seu cluster, na aba de *Storage* selecione *Persistent Volumes*:
![image1709.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614659136563/yLNHuBESN.png)
XVIII. Clique no botão de **Add Volume**:
![image1763.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614659213341/UZy27ra6A.png)
XIX. Acesse seu servidor por `ssh` e rode os seguintes comandos:
```
mkdir ~/docker_volumes
cd ~/docker_volumes
pwd # copie o resultado deste comando
```
XX. Colque um nome para ele, neste exemplo será *custom*, coleque *HostPath* como **Volume Plugin**, preencha o caminho criado no passo anterior em *Path on the Node* e salve:
![image1817.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614659437586/tDhvv0-jQ.png)
XXI. Vá de novo nos Apps do sistema -- passo `II` -- e selecione o Traefik:
![image1981.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614659735469/menJwtrlT.png)
XXII. Abra os *Endpoints* e selecione o DNS que configurou para a dashboard do serviço:
![image1967.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614659776253/Tj0mr0RXV.png)
XXIII. Clique nela e *voialá*, você agora tem acesso interno à dashboard do Traefik:
![2021-03-02-013510_1259x1030_scrot.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614659832955/pTxd7atWz.png)
XXIV. Agora vem a parte mais """chata""" e que este tutorial vai poder menos te ajudar, configure o seu modem/firewall para encaminhar as portas 80 e 443 -- http e https -- para o IP no endpoint do passo `XXII`

Caso você utilize [pfSense](https://www.pfsense.org/) para controlar a sua rede, recomendo seguir [este](https://docs.netgate.com/pfsense/en/latest/nat/port-forwards.html) documento para realizar o passo `XXIV`.

## Testando tudo

![5073480098_0390fe4970_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614660896952/AHwmQsFIE.jpeg)

["Magnifying Glass"](https://www.flickr.com/photos/72841285@N00/5073480098) by [nathanmac87](https://www.flickr.com/photos/72841285@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Agora, só para mostrar que o sistema em si funciona será feito um deploy de um site de demo, como ele foi buildado para várias aquiteturas provavelmente irá funcionar tranquilamente no ambiente que estiver rodando.

I. Abra sua tela Default em seu cluster:
![image2089.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614662136979/1ZvVVZpy_.png)
II. Selecione o botão de **Deploy**:
![image2041.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614662147243/wdB_SoSCK.png)
III. Preencha a tela que se abrir com os seguintes valores -- colocando a imagem de demo [fazenda/vue-website-boilerplate](https://hub.docker.com/r/fazenda/vue-website-boilerplate):
![image2167.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614662278098/FPvhx1VDf.png)
IV. Selecione a aba de *Load Balancing* depois que a sua aplicação foi deployada:
![image2221.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614662354335/SqcBh-XIw.png)
V. Clique no botão **Add Ingress** e preencha com um valor de `demo-website` em **Name**, porta igual a 3000 e selecione o `demo` em **Target**:
![image2275.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1614662633647/34hMSQxUg.png)

A partir deste ponto siga o [tutorial](https://youtu.be/pAM2GBCDGTo?t=751) em vídeo pois alguns pontos difrentes serão explicados e, desta maneira, muitas coisas que não foram tratadas aqui serão explicadas.

## Considerações finais

Foi-se utilizado o serviço do Linode uma vez que já tenho um tutorial que precisa ser finalizado sobre como fazer backups do Rancher para o S3 bucket do Linode e não o padrão que seria a AWS. Além de outro tutorial sobre como rodar o Longhorn em ARM, uma vez que o suporte foi postergado a ser lançando.

Sobre a Linode, eu uso a empresa para backup do meu homelab e gasto 5 dólares por mês apenas; por esses e outros motivos utilizo a empresa -- sendo que tem uma das melhores documentações depois da Azure em nível de cloud.

Nos próximos textos será utilizado a versão 2.5.5 do Rancher; caso queria saber como fazer isso, leia o apêndice; alem de saber como utilizar serviços de autenticação externos para acesso ao seu Rancher por expor a UI pra internet.

![22037606_4976bb3456_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614547895189/-rMQQEa8R.jpeg)

["Calendar"](https://www.flickr.com/photos/78264376@N00/22037606) by [hanaloftus](https://www.flickr.com/photos/78264376@N00) is licensed under [CC BY-NC-ND 2.0 ](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

## Apêndice

Cuidado com a identação na parte de configurar o seu DNS provider -- passo `XII` da configuração do  [Traefik](#traefik) --, caso contrário se seguir a identação do tutorial em vídeo o seguinte erro irá aparecer:

**
Error: render error in "traefik/templates/dns-provider-secret.yaml": template: traefik/templates/dns-provider-secret.yaml:1:80: executing "traefik/templates/dns-provider-secret.yaml" at <.Values.acme.dnsProvider.name>: nil pointer evaluating interface {}.name : exit status 1
**

Como acabei cometendo um erro durante o processo, aproveitei para procurar fazer um upgrade da versão 2.5.2; mesmo a 2.5.5 sendo a mais recente, ela a 2.5.4 e a 2.5.3 não funcionaram muito bem todas apresentando instabilidades durante o processo. Como a 2.5.6 está em fase de release candidate, vou esperar para ver se com ela as coisas melhorarão ou não. Todavia, fazendo o downgrade para a versão 2.4.7, fazendo o procedimento e depois atualizando no final para a 2.5.5 se mostrou frutifero. Para realizar isso basta seguir os seguintes passos:

1. Se você seguiu [este](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm) tutorial para configurar o seu Rancher, seu comando deve ter sido algo do tipo:
```
docker run -d \
 --restart=unless-stopped \
 --publish 80:80 \
 --publish 443:443 \
 --volume /opt/rancher:/var/lib/rancher \
 --volume /lib64:/lib64 \
 --volume /etc/cni/:/etc/cni/ \
 rancher/rancher:v2.4.7
```
2. Primeiramente, seguir o tutorial de backup descrito [aqui](https://rancher.com/docs/rancher/v2.x/en/backups/v2.5/docker-installs/docker-backups/) ou se preferir em forma de [vídeo](https://youtu.be/YWqBxCIfxw4)
3. Agora só rodar o seguinte comando com a flag de privilegiado como explicado [aqui](https://rancher.com/docs/rancher/v2.x/en/installation/other-installation-methods/single-node-docker/) que toda a versão 2.5 pra cima precisa:
```
docker run -d \
 --restart=unless-stopped \
 --privileged \
 --publish 80:80 \
 --publish 443:443 \
 --volume /opt/rancher:/var/lib/rancher \
 --volume /lib64:/lib64 \
 --volume /etc/cni/:/etc/cni/ \
 rancher/rancher:v2.5.5
```

![7334606504_15ea077aaa_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1614553125681/8uh517NO4.jpeg)

["Read the text. A symbol of the eight fold path 'Arya Magga' (the noble path of the dhamma) in early Buddhism. An intricate representation of the Dharmachakra, or Buddhist eight spoked Wheel. Dhamma or Dharma"](https://www.flickr.com/photos/28772513@N07/7334606504) by [saamiblog](https://www.flickr.com/photos/28772513@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Como pode ter visto, o curso de [dev-ops-ninja](http://dev-ops-ninja.com/) ajudou-me e **MUITO** a ter mais informações para voltar a escrever alguns textos que estavam parados. Altamente recomendo pegarem o curso e pretendo fazer uma tabela de equivalência de features da AWS exemplificadas no curso na infra da Azure e do Linode.

Caso não utilize o pfSense ainda, altamente recomendo e colocar ele em modo de bridge com o seu modem tradicional da sua provedora de internet; pfSense acabou por se tornar uma das ferramentas mais poderosas que possuo. Caso não consiga pegar um hardware para rodar ele -- *o preço do que eu peguei mais do que dobrou em seis meses* --, você pode ver de instalar em uma máquina antiga e o [OPNSense](https://opnsense.org/), que a um fork do pfSense, roda até em uma SBC.

## Referências

- [Internal HTTPS with Let’s Encrypt, Linode DNS and Traefik](https://webworxshop.com/internal-https-with-lets-encrypt-linode-dns-and-traefik/)
- [Install and Set Up kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [How do I assign a port mapping to an existing Docker container?](https://stackoverflow.com/a/26622041/7092954)
- [ACME (Let's Encrypt) Configuration](https://doc.traefik.io/traefik/v1.6/configuration/acme/)