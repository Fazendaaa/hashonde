---
title: "Faça seu ARM portifólio de graça"
seoTitle: "Usando o free tier da Oracle pra fazer seu portifólio"
seoDescription: "Ter um cluster ARM gratuito na Oracle e usar pra poder dar deploy dos seus projetos e um ambiente de aprendizado de nuvem que serve para outros provedores."
datePublished: Mon Mar 13 2023 21:04:41 GMT+0000 (Coordinated Universal Time)
cuid: clf7bc0vy000209js3g6t6png
slug: faca-seu-arm-portifolio-de-graca
cover: https://cdn.hashnode.com/res/hashnode/image/upload/v1675633679650/718d5cda-6695-492a-b0d9-f6d4810b3dbf.jpeg
tags: cloud, oracle, docker, kubernetes, rancher

---

foto de capa: "[Not written in stone](https://www.flickr.com/photos/81677556@N00/3903766237)" by [sebilden](https://www.flickr.com/photos/81677556@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# intro

Como dito no último texto [aqui](https://fazenda.hashnode.dev/rancher-no-linode) publicado sobre como subir uma infra no Linode utilizando as tecnologias do Traefik, Rancher e Kubernetes (K8s), no apêndice do mesmo é citado que seria mostrado como fazer o mesmo para Oracle Cloud para que se possa ter um cluster em outra infra e que ofereça uma opção gratuita diferentemente do Linode. Fora que, neste caso, a infraestrutura será em alta disponibilidade -- abordagem que só foi citada na última publicação -- e em outra arquitetura.

O ponto importante é que vantagens e aplicações da tecnlogia em si não serão elaboradas neste texto em si, então caso não as conheça muito bem a leitura anterior é recomendada. Mas caso queira entender além de Linode e Rancher, [este](https://fazenda.hashnode.dev/kubernetes-um-boteco-na-av-paulista) texto irá explicar sobre o K8s por si só.

A intenção é cobrir:

1. Free tier em ARM
    
2. Setup de K8s na OCI
    
3. Deploy de uma aplicação
    

Lembrando que todos os comandos foram executados em uma máquina Linux, caso utilize Windows o processo não irá funcionar -- e caso seja usuário Mac, talvez tudo funcione igualmente ou com pequenos ajustes.

![](https://upload.wikimedia.org/wikipedia/commons/4/40/Wikimedia_Foundation_Servers-8055_16.jpg align="left")

"[File:Wikimedia Foundation Servers-8055 16.jpg](https://commons.wikimedia.org/w/index.php?curid=20348435)" by [Victorgrigas](https://commons.wikimedia.org/wiki/User:Victorgrigas) is licensed under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/?ref=openverse).

# ARM

Caso já acompanhe os posts aqui no blog já deve ter visto alguns exemplos da vantagem de se executar uma aplicação rodando na arquitetura ARM, como, por examplo o citado no texto: [Banco de dados em casa é 500 vezes mais barato do que na nuvem](https://fazenda.hashnode.dev/banco-de-dados-em-casa-e-500-vezes-mais-barato-do-que-na-nuvem).

Mas caso não conheça os prós disto, alguns pontos de interesse:

* Baixo consumo energético
    
* Integração de mesmo desenvolvimento para edge computing em alguns casos
    
* Baixo custo inicial
    
* Granularidade de ofertas -- com CPUs de prateleira de 16 bits, 32bits e 64 bits
    
* Facilidade de penetração em provedores de cloud do mercado asiático
    
* Possibilidade de se utilizar a infra como homelab devido a comodidade de se rodar algo que um carregador de celular já dá conta como elaborado em: [Streaming de Retro Games... DE GRAÇA e em dois passos](https://fazenda.hashnode.dev/streaming-de-retro-games-de-graca-e-em-dois-passos)
    
* Diversidade de provedores -- o que faz ter um mercado competitivo e preços baixos
    
* Ofertas construídas em tecnologia de ponta -- uma vez que litografia dos processadores dos laptops da Apple tem a tecnologia mais te ponta que a TSMC consegue ofertar
    
* etc
    

ARM não é uma tecnologia recente, microcontroladores já à utilizavam antes do BOOM dos smartphones e os [BBC Micros](https://en.wikipedia.org/wiki/BBC_Micro) -- computadores da década de 80 -- já utilizavam ele antes dos Macs com [Apple Silicon](https://support.apple.com/en-us/HT211814) e bem antes dos Surfaces com [Windows RT](https://www.techtudo.com.br/tudo-sobre/microsoft-surface-rt/).

Uma das vantagens de ter um servidor em ARM é poder também aproveitar a infra para poder fazer CI/CD nativo para uma plataforma como IoT, smartphones ou até mesmo integrar com a sua infra de edge.

![Raspberry Pi Compute Module 4 and Ampere Altra Max M128-30](https://www.jeffgeerling.com/sites/default/files/images/Ampere-Altra-Max-vs-Raspberry-Pi-CM4.jpg align="left")

photo source: [Jeff Geerling's blogpost](https://www.jeffgeerling.com/blog/2022/pi-cluster-vs-ampere-altra-max-128-core-arm-cpu)

# Oracle

E o principal diferencial do fornecedor que será abordado neste texto é: *free tier*. E para criar a conta, basta clicar [neste link](https://www.oracle.com/cloud/free/) e seguir os procedimentos. Caso não se sinta confortável com a ideia de cadastrar o seu cartão de crédito, infelizmente não conseguirá fazer a conta, porque mesmo que seja gratuito o uso, o cartão é necessário para validar a criação da conta. Na data deste texto ser escrito, um débito temporário de em torno de 5 reais vai ser debitado temporariamente para a confirmação do cartão, que será extornado em seguida, e assegurar a ideonidade da conta. Para este tutorial a conta será alocada na região de Vinhedo (São Paulo), mas isto é só para questão de comodidade -- todavia o free tier não funciona em algumas regiões dos EUA.

Após a conta ser criada, e conseguir acessar o painel princpial uma mensagem de que a conta está sendo criada aparecerá.

Caso não utilize algum dos navegadores suportados -- Chrome, Firefox, Safari e Edge -- a recomendação será realmente utilizar eles, uma vez que o painel cita que pode ter problemas -- o painel não funcionou bem nestes teste com o Brave --, e outra recomendação caso mesmo nos navegadores suportados, se tiver algum problema, procure executar na aba anonima.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1675649892853/a36e240c-993b-4164-ad3f-d561fb10f6af.jpeg align="center")

"[ORACLE](https://www.flickr.com/photos/35034359460@N01/3772015)" by [Peter Kaminski](https://www.flickr.com/photos/35034359460@N01) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Deploy

Para a criação de um novo cluster K8s para utilizarmos da maneira proposta aqui, alguns passos são necessários:

1. Configuração do OCI CLI
    
2. Utilização de um compartimento Oracle
    
3. Configuração e criação do cluster
    
4. Deploy do Traefik
    
5. Configuração do DNS na Oracle
    

Para, depois te tudo isso, conseguir então dar deploy de uma aplicação.

Lembrando que será necessário sim a detenção de um domínio de DNS, então caso tenha alguma dúvida, leia [este](https://fazenda.hashnode.dev/rancher-no-linode#heading-dns) tópico do texto publicado anteriormente antes de proceder.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676715365251/2f123e58-8060-40d8-b188-55f3df45529d.jpeg align="center")

"[Starship SN8 Mission](https://www.flickr.com/photos/130608600@N05/50703878421)" by [Official SpaceX Photos](https://www.flickr.com/photos/130608600@N05) is licensed under [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/?ref=openverse).

## OCI CLI

A Oracle disponibiliza uma ferramenta de linha de comando, o [OCI CLI](https://github.com/oracle/oci-cli), que será de uso obrigatório para este tutorial; só que ela terá um único propósito: **baixar o kubeconfig**. Como a dash da provedora não permite, assim como o Linode e outras provedoras, baixar o arquivo pela própria dash tal ferramenta será utilizada.

1. Execute em seu termina o seguinte comando:
    
    ```bash
    bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"
    ```
    
2. Várias perguntas serão feitas, caso você as deixe sem preencher e dê Enter, o valor padrão será utilizado. Ao final da instalação, execute o seguinte comando para recarregar seu shell:
    
    ```bash
    exec -l $SHELL
    ```
    
3. Agora para poder se conectar ao sistema da OCI, rode:
    
    ```bash
    oci setup config
    ```
    
4. O sistema irá perguntar qual o lugar que quer que salve as configurações, você pode dar apenas Enter sem preencher nada para salvar no local padrão. Quando for perguntado pelo seu user OCID, clique [neste](https://cloud.oracle.com/identity/domains/my-profile) link para acessar seu perfil e conseguir ter acesso à ele em:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676505042092/0f5ad0c9-4327-4208-ab80-b0a9228930d3.png align="center")
    
5. Para o tenancy OCID, clique [neste](https://cloud.oracle.com/identity/compartments) link e copie o ID do OCID equivalente ao nome do seu usuário:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676505294771/9c0113ec-3141-43e7-8277-43b6e57801b4.png align="center")
    
6. Depois selecione a região que atrelou sua conta na hora de criação. Caso tenha sido Vinhedo (São Paulo) como recomendado, o número será o 33.
    
7. Quando ele perguntar se deseja criar uma nova chave RSA, clique Enter para confirmar que deseja fazer isto.
    
8. Ao perguntar o caminho para salvar sua chave, apenas clique Enter deixando em branco a opção para utilizar o caminho padrão.
    
9. Com relação ao nome, pode deixar o padrão, apenas não preencher nada e apertar Enter irá resolver isto.
    
10. Não é necessário criar uma frase de senha, apenas deixe em branco e aperte Enter.
    
11. Caso tenha deixado tudo como padrão, agora para acessar sua chave, basta rodar o seguinte comando -- ele irá mostar o valor da sua chave pública que precisará ser copiado para os próximos passos:
    
    ```bash
    cat ${HOME}/.oci/oci_api_key_public.pem
    ```
    
12. Acesse, de novo, seu perfil clicando [aqui](https://cloud.oracle.com/identity/domains/my-profile), e selecione a aba de API keys e uma vez nela, selecione a opção de adicioanar uma chave:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676506066645/fc9d71c6-2ee2-4a49-a273-b51334654ceb.png align="center")
    
13. Selecione a opção de colar uma chave pública e cole a chave que foi impressa no terminal no passo 11:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676506220252/79070f1a-edc5-4ccd-8cb9-fe608a0115dd.png align="center")
    
14. Uma vez salvo a chave, você conseguirá ter acesso à algumas features do provedor através do terminal.
    

Lembrado que o OCI CLI também atende outras necessidades que não serão cobertas, muito menos citadas, neste texto. Então caso tenha alguma necessidade de mexer na infraestrutura sem necessariamente usar a dashboard, pode ser que a CLI te ajude ou até mesmo algumas das [receitas](https://docs.ansible.com/ansible/latest/scenario_guides/guide_oracle.html) em Ansible da Oracle.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676715584959/51e3e76c-e7d2-4f49-ab69-45c2cacc53f7.jpeg align="center")

"[Training hardware of ISS toolbox](https://www.flickr.com/photos/65541944@N07/7054529841)" by [AstroSamantha](https://www.flickr.com/photos/65541944@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## Compartimentos

Compartimentos espaços de recursos compartilhados assim recursos como VMs, Redes e outros serviços da Oracle podem ter visão do que foi alocado no mesmo compartimento mas não de outros. Seriam quase como namespaces no Linux: uma VM criada no compartimento A não sabe que a VM rodando no compartimento B existe e vice-versa.

Para este tutorial será necessário a criação de um novo compartimento para dar o deploy do cluster K8s. Todavia um compartimento em si pode ter o deploy de vários clusters não sendo necessário se criar um compartimento novo toda vez que um cluster novo for necessário ser criado.

1. Crie um novo compartimento em clicando [aqui](https://cloud.oracle.com/identity/compartments):
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676417883124/00e16261-3686-4e2b-aa7b-8003bc74f44f.png align="center")
    
2. Dê um nome e descrição ao seu compartimento -- neste exemplo será "test" -- e só clicar em criar ele:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418093327/38cd58ea-0467-49fc-9e03-4aa32940dbbb.png align="center")
    

E assim o compartimento está pronto.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676727814039/9f2652bd-e34b-48d4-95db-cf813dc87981.jpeg align="center")

"[Bento Box](https://www.flickr.com/photos/31956880@N00/2872123)" by [Route79](https://www.flickr.com/photos/31956880@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

## Cluster

Agora a parte importante, o cluster K8s. Lembrando que tal cluster poderá ser acessado diretamente pela dashboard da OCI e ter suas métricas expostas nela -- todavia caso tenha interesse em algo melhor, no apêndice é ensinado como dar deploy do Rancher.

1. Abra este [link](https://cloud.oracle.com/containers/clusters) e selecione o compartimento "test" no canto esquerdo:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418188582/4d514a72-661b-4e00-8af9-abc0cc23c000.png align="center")
    
2. Clique na opção de criar cluster:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418221474/28e8463a-ee14-4061-9524-d28f36bd3da6.png align="center")
    
3. Aceite a opção de "Quick create":
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418258109/1de1cee1-74e0-48eb-a784-dc5152b97e72.png align="center")
    
4. Depois basta:
    
    1. Dar um nome ao cluster -- neste caso será "test":
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418521141/b18a804f-30ee-4073-ad0c-242d7fe036bc.png align="center")
        
    2. Selecionar a opção de Pod como `VM.Standard.A1.Flex`, que é oferta de ARM da Oracle:
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418484104/a9119cf5-d218-4841-9ad8-b71f8f7655d7.png align="center")
        
    3. Selecionar o número de cores desejado -- neste exemplo serão apenas um devido às limitações da conta gratuita:
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418594101/7dd08e4e-20b3-4edf-90d6-296236883a9b.png align="center")
        
    4. O node count ficará em três mesmo para se ter três máquinas para se executar o cluster. Após tudo isto, basta criar o cluster e aguardar tudo funcionar:
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418689539/59711859-7f08-44cc-8f74-adb18c7dedf1.png align="center")
        
5. Ao fechar a notificação, uma tela similar a seguinte deve aparecer com o status de criando do container -- basta aguardar o status mudar de criando para ativo, o que pode levar em torno de 15 a 20min:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676418813861/6f7e9a6d-2f56-4e4f-976b-ca35a67c5c40.png align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676420596496/f3bf6b7f-4e54-4499-a5e1-c97c6cd29287.png align="center")
    
6. Uma vez com seu cluster alocado, vá para a parte de "quick start" no painel da esquerda dele em Resources:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676419246093/78153071-679a-4091-abd6-220090a904c9.png align="center")
    
7. Clique na opção de acessar seu cluster:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676419385613/ec7e580e-82b0-4dbb-b509-aa5f95b67df6.png align="center")
    
8. Selecione a opção de acesso local:
    
    1. Rode o comando `1` caso não tenha criado a pasta do seu kubeconfig durante o processo de instalção do kubectl comentado no passo de OCI CLI.
        
    2. Copie o comando `2` a parte que fala de acesso pelo `PUBLIC_ENDPOINT` e execute ele no seu terminal:
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676419637515/5bb94153-6269-42a0-a074-1a95aa3d92e1.png align="center")
        
    3. Tal comando irá salvar seu kubeconfig na sua máquina, para acessá-lo, basta rodar o seguinte comando:
        
        ```bash
         cat ${HOME}/.kube/config
        ```
        

Uma vez com o kubeconfig em mãos você poderá seguir para o próximo passo, de instalar o Traefik.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676715655556/c6286d25-9313-4dd0-a066-a671d6df4d9f.jpeg align="center")

"[My spicy drawer](https://www.flickr.com/photos/8034873@N07/3052297049)" by [doegox](https://www.flickr.com/photos/8034873@N07) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

## Traefik

O quê é o [traefik](https://traefik.io/)? Em suma, ele é o serviço que irá permitir endereçar seus sistemas e permitir que regras de segurança e filtros sejam aplicadas. Caso queria entender mais sobre, pesquisar sobre [reverse-proxy](https://en.wikipedia.org/wiki/Reverse_proxy).

Neste tutorial o Traefik será instalado de maneira diferente, será instalado pelo helm, e todos os tutoriais aqui foi sempre a instalação por deploy de um manifesto.

Para que um Load Balancer (LB) seja criado, passo que na configuração do Linode não foi necessário porque só um node foi alocado, agora com três nodes um LB é necessário para distribuir todos os requests que chegam ao cluster de maneira igual aos três nodes. Como demonstrado a seguir:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678663660083/641b9059-56cf-4e56-9f5e-5d67b0934369.png align="center")

Para fazer tal, será necessário:

1. Ter o helm na máquina
    
2. O LB será criado automaticamente quando o traefik terminar a instalação
    

Para adicionar o Traefik no cluster criado, basta:

1. Instalar o helm caso ainda não tenha ele na sua máquina:
    
    ```bash
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
    ```
    
2. Adicionar o Traefik ao seu repositório:
    
    ```bash
    helm repo add traefik https://helm.traefik.io/traefik
    ```
    
3. Atualizar os repositórios:
    
    ```bash
    helm repo update
    ```
    
4. Copiar o seguinte conteúdo para um arquivo chamado `oracle.yml` -- lembrando de modificar o `<YOUR E-MAIL HERE>` para o e-mail que registrou o seu domínio a ser utilizado neste tutorial:
    
    ```yaml
    additionalArguments:
      - --providers.kubernetescrd
    
      - --certificatesresolvers.default.acme.tlschallenge
      - --certificatesresolvers.default.acme.email=<YOUR E-MAIL HERE>
      - --certificatesresolvers.default.acme.storage=/tmp/acme.json
    
      - --accesslog=true
      - --log=true
      - --metrics=true
      - --metrics.prometheus=true
    podSecurityContext:
      fsGroup: 65532
    ```
    
5. Após isto, abra o terminal na pasta que salvou o arquivo do passo anterior e execute:
    
    ```bash
    helm install traefik traefik/traefik --values oracle.yml
    ```
    
6. Caso tudo dê certo, você deverá ver uma mensagem parecida com a seguinte:
    
    ```bash
    NAME: traefik
    LAST DEPLOYED: Wed Feb 15 21:39:25 2023
    NAMESPACE: default
    STATUS: deployed
    REVISION: 1
    TEST SUITE: None
    NOTES:
    Traefik Proxy v2.9.7 has been deployed successfully
    on default namespace !
    ```
    

Traefik já foi instalado no seu cluster e foi criado automaticamente um Load Balancer para ele que será utilizado mais pra frente, agora para poder conseguir resolver a etapa de segurança e ter um certificado de segurança emitido pelo Let's Encrypt, basta seguir o próximo passo de configuração do DNS.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676715718492/8344ac37-c7e1-4cd1-b18b-87e5b2d1320b.jpeg align="center")

"[Highway Insomnia](https://www.flickr.com/photos/91351004@N00/452412873)" by [Nrbelex](https://www.flickr.com/photos/91351004@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

## DNS

Para não ficar repetitivo, o processo de configuração de DNS é similar ao citado [aqui](https://fazenda.hashnode.dev/rancher-no-linode#heading-dns), então caso tenha dúvidas nas próximas etapas, só ler o texto citado.

1. Abra [este](https://cloud.oracle.com/dns/zones) link e selecione o compartimento "test" à esquerda:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676508426396/02938936-c483-4fb9-9260-d39a292e6012.png align="center")
    
2. Agora clique no botão de criar uma nova zona de DNS:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676508479254/12435dce-e1ff-4886-bdad-e495e67ed518.png align="center")
    
3. O domínio a ser registrado aqui será o mesmo do tutorial anterior, o [fazenda.solutions](http://fazenda.solutions) -- lembrando que você deverá substitutir pelo o domínio que adquiriu para fazer os seus testes:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676508970929/37ab0cf0-a105-4bd0-9229-93bcca02d4aa.png align="center")
    
4. Uma vez com o domínio adicionado, se deve aguaradar ele transicionar do stautos de criando para ativo:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676509021687/a1b19bf3-f119-4849-9f75-385b6f950020.png align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676509204284/78982013-428e-47f5-aecb-f892fbe957c3.png align="center")
    
5. Uma vez com o DNS registrado, basta clicar [aqui](https://cloud.oracle.com/load-balancer/load-balancers) para acessar a dash de Load Balancers (LB) que foi criado no passo 6 da configuração do Traefik. Lembrando, novamente, de selecionar o compartimento "test" no painel à esquerda:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676550943989/a9826613-cc8e-4d57-bab9-629da76c8a6f.png align="center")
    
6. Caso você tenha mais de um LB registrado, procure ver pelo horário de criação do LB, isso irá te ajudar a selecionar o que foi criado para o seu cluster. A informação que importa é o IP deste LB, que será copiado para ser utilizado mais pra frente:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676551127187/43f3b804-7ee0-45bc-b3b7-ce5d92329710.png align="center")
    
7. Agora, volte ao seu registro de DNS do passo 4, clique na aba de Records no painel da esquerda e selecione a opção de adicionar um Record:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676585463184/4329d69a-af6c-472a-aa72-a49ab8333033.png align="center")
    
8. Selecione a opção de IPv4, no nome coloque `*`, no Time To Live (TTL) coloque cinco minutos e cole o IP do passo 6 em endereço:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676585575152/dcc86b74-d184-47b9-b6ca-069550234661.png align="center")
    
9. Não se esqueça de clicar em publicar:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676585605931/0fb59214-6fe4-4428-bed8-42aa730e7c14.png align="center")
    
10. E confirme as mudanças feitas e as publique:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676585644463/514609ab-94d5-4924-83ee-7030f9e0578c.png align="center")
    
11. Caso tenha feito seu domínio no GoDaddy como no texto anterior, clique [neste](https://account.godaddy.com/products) link e selecione o DNS do seu domínio desejado -- voltando, fazenda.solutions é apenas o exemplo que foi utilizado, no seu caso será outro domínio:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676585857967/13737414-1fec-47d1-a51d-2f34003947f9.png align="center")
    
12. Na parte de Nameservers clique para Alterar:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676585941222/150d8c62-5f33-4cbd-b8f9-a50456f312d1.png align="center")
    
13. Selecione a opção avançada:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676585978871/021ceef7-d88d-4318-85ca-6743e590ceb9.png align="center")
    
14. Uma vez com os Nameservers dos passo 4, basta pegar eles para atualizar na dash do seu provedor de DNS.
    
    * [ns1.p201.dns.oraclecloud.net](http://ns1.p201.dns.oraclecloud.net)
        
    * [ns2.p201.dns.oraclecloud.net](http://ns2.p201.dns.oraclecloud.net)
        
    * [ns3.p201.dns.oraclecloud.net](http://ns3.p201.dns.oraclecloud.net)
        
    * [ns4.p201.dns.oraclecloud.net](http://ns4.p201.dns.oraclecloud.net)
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676586078992/2b948dd5-3b28-485f-9b29-e07dd25fc4be.png align="center")
    
15. Talvez você receba uma senha de uso único para poder confirmar a mudança, só pegar ela do seu e-mail ou caso tenha utilizado um app de autenticação, só pegar o código dele para confirmar a alteração.
    

Caso queira dar um deploy de um "[hello-world](https://github.com/crccheck/docker-hello-world)" pra ver tudo funcionado, só seguir os próximos passos, do contrário pode pular para o próximo tópico:

1. Copie o seguinte texto e salve como o arquivo `deploy.yml`:
    
    ```yaml
    ---
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: hello-world
    spec:
      replicas: 1
      selector:
        matchLabels:
          application: hello-world
      template:
        metadata:
          labels:
            application: hello-world
        spec:
          containers:
          - image: fazenda/hello-world
            imagePullPolicy: Always
            name: hello-world
            ports:
            - containerPort: 8000
              protocol: TCP
            securityContext:
              privileged: false
            resources:
              requests:
                cpu: 25m
                memory: 64Mi
              limits:
                cpu: 410m
                memory: 512Mi
          restartPolicy: Always
    ---
    apiVersion: v1
    kind: Service
    metadata:
      name: hello-world
    spec:
      ports:
      - port: 80
        protocol: TCP
        targetPort: 8000
      selector:
        application: hello-world
      type: ClusterIP
    ---
    apiVersion: traefik.containo.us/v1alpha1
    kind: IngressRoute
    metadata:
      name: hello-world-tls
    spec:
      entryPoints:
        - websecure
      routes:
        - kind: Rule
          match: Host(`hello.YOUR.DNS`)
          services:
            - name: hello-world
              port: 80
      tls:
        certResolver: default
    ```
    
2. Modifique o `YOUR.DNS` para o nome do domínio que registrou. E então abra um terminal onde salvou o arquivo `deploy.yml` e rode o seguinte comando:
    
    ```bash
    kubectl apply -f deploy.yml
    ```
    
3. Daí basta abrir o link que registrou -- neste exemplo seria [hello.fazenda.solutions](https://hello.fazenda.solutions/) -- no seu navegador, deverá ver uma tela assim:
    
    ![E lembrando que a imagem que foi deployada no exemplo, não é a original porque a original só foi buildada para AMD64; caso queira enteder mais sobre a diferença, após terminar de ler o texto, leia o apêndice também.](https://cdn.hashnode.com/res/hashnode/image/upload/v1676676887648/794f577c-3700-4862-a5d4-730c0c7fdd97.png align="center")
    

> E lembrando que a imagem que foi deployada no exemplo, não é a original porque a original só foi buildada para AMD64; caso queira enteder mais sobre a diferença, após terminar de ler o texto, leia o apêndice sobre **buildx** também.

Agora seu deploy foi realizado, você tem um cluster K8s em alta disponibilidade em ARM gratuito rodando na Oracle!

Essa etapa do deploy foi "demorada" para funcionar, por algum motivo só foi possível acessar o site algumas horas depois. Pode ter sido alguma falha específica ou algo que é comum, o aviso é para que não fique preocupado caso demore muito mais quando comparado com o Linode.

Após isto o *mise en place* foi feito, todos os ingredientes básicos estão prontos. Daqui pra frente será o preparo dos pratos.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1676715786421/81bcd1e8-26c8-4216-8d65-95d98a9f78d3.jpeg align="center")

"[Hiring Delivery Guy - February 7th, 2011](https://www.flickr.com/photos/30329962@N08/5426625718)" by [Mark Turnauckas](https://www.flickr.com/photos/30329962@N08) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Cluster

Uma das vantagens deste deploy é a alta disponibilidade, uma vez que mais de uma máquina será utilizada, diferentemente do exemplo dado no Linode que passava mais por algo simples com um nó só. Com três nós, o sistema se encontra mais pronto pra producação, isto porque em caso um dos nós fiquem fora do ar, os outros dois conseguem dar conta do tráfego.

Tudo isso porque os três pilares de um cluster K8s: worker, etcd e control pane; não estarão rodando em uma máquina em si mas estarão sendo distribuídos. E caso queria acessar cada um dos nós, uma dica é o projeto [kubectl-node-shell](https://github.com/kvaps/kubectl-node-shell).

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677796393196/fe0ca4d5-b08b-45ee-b7f7-e0f32875506a.jpeg align="center")

"[Tripod.](https://www.flickr.com/photos/7940758@N07/5771338462)" by [MIKI Yoshihito. (#mikiyoshihito)](https://www.flickr.com/photos/7940758@N07) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Em Suma

Neste texto, por mais simples que seja, não quer dizer que esses passos são fáceis. Para um iniciante muita coisa não poderia fazer sentido, seja por causa das limitações da conta gratuita que nem sempre ficaram claro ou até mesmo pela questão das builds necessariamente serem diferentes; muitas váriaveis para poder quebrar o processo.

O *free tier* da Oracle em si não diz que tem que ser necessariamente na arquitetura ARM, há um shape que permite ser x86. Para poder ter certeza de tudo, ou caso os termos sejam atualizado com relação à publicação deste texto, sempre procure ler os termos de uso oficiais do *free tier* [aqui](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm) antes de qualquer coisa.

O interessante é que, atualmente, das nuvens conhecidas só a Oracle e a AWS apresentam ofertas de ARM; então caso você consiga compilar pra arquitetura, os ganhos em redução de custo operacional serão consideráveis. Outro ponto é que algumas empresas já estão entregando Macs com o Apple Silicon, então as builds nelas já são ARM 64 nativamente.

Para que tais processos na OCI sejam mais automatizados e não manuais como demonstrado aqui, a provedora suporta ferramentas como: [Ansible](https://blogs.oracle.com/cloudmarketplace/post/explore-ansible-within-oracle-resource-manager-host-to-configure-oci-resources) e [Terraform](https://registry.terraform.io/providers/oracle/oci/latest/docs).

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677796174810/f3009031-cd61-4fc2-b489-4d193b523c12.jpeg align="center")

"[BAKOKO CDS 2F Meeting Room Inside LAndscape](https://www.flickr.com/photos/77591562@N04/8269957080)" by [BAKOKO](https://www.flickr.com/photos/77591562@N04) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=openverse).

# Apêndice

O apêndice quase sempre é uma leitura suplementar, neste caso ele pode ser considerado leitura necessária caso tenha caído de paraquedas neste texto sem ter acompanhado alguns aqui do blog. Outro cenário é caso esteja realmente considerando a Oracle para uso comercial pelo o que foi apresentado no texto até aqui.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677797580011/0bb00237-dd0a-4f59-b259-7d35c92f02b5.jpeg align="center")

"[Waiting for summer; Empty benches, the promenade - Birzebugga, Malta](https://www.flickr.com/photos/43145783@N00/3235732579)" by [foxypar4](https://www.flickr.com/photos/43145783@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## RSMD

O projeto que foi apresentado [neste texto](https://fazenda.hashnode.dev/analise-de-dados-site-banco-de-dados-tudo-no-isso-seu-pc-e-sem-precisar-instalar-o-r-shiny-e-o-mongo) com o intuito de ser didático e demonstrar como um projeto em R + Shiny com MongoDB e Docker podem ser tocados.

Lembrando que um `docker build` comum na sua máquina -- que provavelmente é um x86 -- não funcionará no sistema por ser uma arquitetura diferente da apresentada do exemplo dado aqui no texto que é ARM, assim como também algumas imagens do Docker Hub que você pode querer dar o deploy no seu novo cluster e ter problemas de compatibilidade.

E para poder dar um deploy do exmplo basta:

1. Copiar o seguinte deploy e salvar chamando `rsmd.yaml` -- se lembre de modificar `DNS_HERE` para o seu DNS:
    
    ```yaml
    ---
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      labels:
        allow.http: 'false'
        application: rsmd
      name: rsmd
    spec:
      replicas: 1
      selector:
        matchLabels:
          application: rsmd
      template:
        metadata:
          labels:
            application: rsmd
        spec:
          containers:
          - command:
            - R
            - -e
            - shiny::runApp('inst/app.R', host = '0.0.0.0', port = 80)
            image: fazenda/rsmd
            imagePullPolicy: Always
            name: rsmd
            ports:
            - containerPort: 80
              protocol: TCP
            securityContext:
              privileged: false
            resources:
              requests:
                cpu: 25m
                memory: 64Mi
              limits:
                cpu: 410m
                memory: 512Mi
          imagePullSecrets:
          - name: regcred
          restartPolicy: Always
    ---
    apiVersion: v1
    kind: Service
    metadata:
      name: rsmd
    spec:
      ports:
      - port: 80
        protocol: TCP
        targetPort: 80
      selector:
        application: rsmd
      type: ClusterIP
    ---
    apiVersion: traefik.containo.us/v1alpha1
    kind: IngressRoute
    metadata:
      name: rsmd-tls
      namespace: default
    spec:
      entryPoints:
      - websecure
      routes:
      - kind: Rule
        match: Host(`rsmd.DNS_HERE`)
        services:
        - name: rsmd
          port: 80
      tls:
        certResolver: default
    ```
    
2. E depoi executar:
    
    ```bash
    kubectl apply -f rsmd.yaml
    ```
    

E para ver o exemplo do RSMD rodando em ARM, basta acessar: [https://rsmd.fazenda.solutions/](https://rsmd.fazenda.solutions/)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677797738739/30d818c6-f761-4dc4-9131-595274bba212.jpeg align="center")

"[hello, world](https://www.flickr.com/photos/17425845@N00/472097903)" by [oskay](https://www.flickr.com/photos/17425845@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

### Compatibilidade

As builds do RSMD rodavam em AMD 64 e ARM 64, todavia quando a build ARM 64 foi executar na Oracle, ela deu erro. Aparentemente o sistema utiliza outra versão de ARM então foi necessário fazer uma nova build considerando as variações v6, v7 e v8 de ARM. E para corrigir isto a build mudou de:

```bash
docker buildx build --platform linux/amd64,linux/v8 --push --tag fazenda/rsmd .
```

Para:

```bash
docker buildx build --platform linux/amd64,linux/arm64 --push --tag fazenda/rsmd .
```

O que na prática é a mesma coisa porém no cluster da Oracle por algum motivo ele não reconhece como iguais.

Um dos motivos do RSMD ter sido buildado apenas para AMD64 e ARM64 é que ARM/v7 e ARM/v6 são os problemas de compatibilidade de alguns pacotes utilizados que não buildam nessas versões por algum problema de compatibilidade que não foi explorado e por isso tais builds não foram realizadas.

Para mais, se pode ler o apêndice na parte sobre buildx. Outras maneiras de buildar para ARM seria colocar no seu pipe de CI/CD -- *que ainda vai ter texto aqui sobre isto.*

Caso queria reproduzir a build e falhar, pode ser por um limite de instalação de pacotes do Github que tem neste projeto; você verá um erro do pacote curl com o código 22 e um erro da API do Github com o código 403 -- que significa que o servidor recebeu e entendeu o request mas recusou ele por causa do limite de requests atingido --; mesmo sendo os "mesmos" pacotes que se encontra no CRAN, o motivo de eles terem sido forkeados é explicado no tópico Debugs.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678640689475/7073c0dd-1781-4770-8010-f00885f1633f.jpeg align="center")

"[Puzzling](https://www.flickr.com/photos/54799099@N00/6340830162)" by [the justified sinner](https://www.flickr.com/photos/54799099@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

## Rancher

Caso tenha caído neste texto sem conhecer o [Rancher](https://www.rancher.com/), basicamente ele é um gerenciador de clusters k8s que é uma aplicação em k8s por si só e permite que faça toda a gestão de uma maneira mais cômoda e através de uma dash online. Sendo que o serviço por si só tem várias outras comidades como:

* [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#:~:text=Role%2Dbased%20access%20control%20(RBAC,individual%20users%20within%20your%20organization.)
    
* Loja de aplicações
    
* [Fleet](https://fleet.rancher.io/)
    
* [Cluster Drivers](https://ranchermanager.docs.rancher.com/v2.5/how-to-guides/advanced-user-guides/authentication-permissions-and-global-configuration/about-provisioning-drivers/manage-cluster-drivers)
    
* etc
    

A instalação do Rancher não se tornou um ponto principal deste texto porque já foi coberta no último. Todavia é importante ressaltar que agora o Rancher por si só estará em alta disponibilidade caso deseje deployar ele. Caso queria dar o deploy do ARM como foi explicado aqui no texto, nem tente, a configuração em si é muito insuficiente e o deploy dará timeout e não será realizado; então se for querer dar o deploy, aloque mais recursos.

O processo de instalação do Rancher é simples perto de tudo listado aqui. Todavia é sempre bom olhar o site oficial do projeto para ver se uma versão mais recente do que a exemplificada aqui não se encontra disponível; até para que facilite a utilização da ferramenta -- uma vez que algumas especificidades deste deploy serão por causa da combinação atual da versão da ferramenta com a versão do K8s.

Uma diferença é que o helm chart não suporta a versão 1.25 do k8s, então caso queria, terá que criar um cluster novo com uma versão abaixo desta -- mesmo a versão de testes do rancher ainda não funciona com versões do 1.25 pra cima:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678665864088/60381fbf-42d0-4299-8f5b-a3ce067479f1.png align="center")

Agora repita o que foi feito no texto em si:

1. Acesse o cluster localmente através do comando da OCI CLI para conseguir ter o kubeconfig localmente
    
2. Aloque o Traefik no cluster
    
3. Atrele o Load Balancer criado pelo Traefik à configuração do DNS
    

Uma vez com tudo em ordem basta rodar os seguintes comandos -- lembrando de antes substituri o `${YOUR_DNS_HERE}` pelo e-mail que utilizou para criar seu domínio e o `${YOUR_EMAIL_HERE}` pelo DNS que seu rancher em si estara rodando, neste caso sera o `rancher.seu.dominio`, sendo o `seu.dominio` o domínio que registrou:

```bash
kubectl create namespace cattle-system
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.7.1
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=${YOUR_DNS_HERE} \
  --set bootstrapPassword=admin \
  --set ingress.tls.source=letsEncrypt \
  --set letsEncrypt.email=${YOUR_EMAIL_HERE} \
  --set letsEncrypt.ingress.class=traefik
kubectl -n cattle-system rollout status deploy/rancher
```

Mesmo se tiver alocado mais recursos, o Rancher pode demorar alguns segundos no ARM e não ser instantaneo como ele é no x86; então espere um pouco antes de acessar seu painel através do `https://rancher.seu.dominio/` .

Depois basta acessar o site e fazer as configurações de setup equivalentes ao explicado no [último texto](https://fazenda.hashnode.dev/rancher-no-linode#heading-rancher) aqui publicado. A vantagem do deploy do Rancher que nem explicado aqui é que, comparado com o último texto, você não precisará mais ter dois tipos de deploys diferentes, uma vez que o traefik foi instalado antes do deploy do Rancher, deploys simples iguais aos demonstrados aqui neste texto, funcionaram sem necessidade de configurações a mais.

E o Rancher, principalmente no caso da OCI, é quase que uma obrigação já que o sistema de monitoramento pela dashboard do sistema da provedora é aquem do que o Rancher entrega. Fora que é menos burocratico de se conseguir o kubeconfig caso precise, uma vez que ao se gerenciar vários clusters diferentes isso é uma realidade comum.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677797679059/2bab70bf-01d7-488c-a29a-f5dcda42d737.jpeg align="center")

"[Holy Name Cathedral Pipe Organ](https://www.flickr.com/photos/65315936@N00/12251781603)" by [Chris Smith/Out of Chicago](https://www.flickr.com/photos/65315936@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

## Buildx

Atualizando o [segundo post do blog](https://fazenda.hashnode.dev/como-distribuir-codigo-para-rodar-em-diversas-arquiteturas-r-docker-buildx), a instalação do [buildx](https://github.com/docker/buildx) ficou muito mais fácil de uns anos pra cá, para configurar na sua máquina local a instalação basta rodar os seguintes passos -- lembrando de instalar o pacote `jq` antes:

```bash
export LATEST=$(wget -qO- "https://api.github.com/repos/docker/buildx/releases/latest" | jq -r .name)
wget https://github.com/docker/buildx/releases/download/${LATEST}/buildx-${LATEST}.linux-amd64
chmod a+x buildx-${LATEST}.linux-amd64
mkdir -p ~/.docker/cli-plugins
mv buildx-${LATEST}.linux-amd64 ~/.docker/cli-plugins/docker-buildx
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --name builder --driver docker-container --use
docker buildx inspect --bootstrap
```

Caso precise as seguintes flags podem te auxiliar a buildar, a recomendação é colocar no seu `${HOME}/.bashrc` ou `${HOME}/.zshrc` .

```bash
export DOCKER_CLI_EXPERIMENTAL=enabled
export DOCKER_BUILDKIT=1
export BUILDX_NO_DEFAULT_LOAD=false
```

Caso tenha algum problema na hora de copiar e colar, pode ser que sua shell esteja interpolando as variáveis de de ambiente. E caso já tenha uma versão antiga do buildx instalada nela, a apresentada no texto escrito aqui, antes deverá rodar o seguinte comando:

```bash
docker buildx rm builder
```

Muitas vezes problemas com atualizações da máquina ou do Docker em si podem quebrar o buildx, neste caso o seguinte conjunto de comandos pode auxiliar a resolver tal cenário:

```bash
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx rm builder
docker buildx create --name builder --driver docker-container --use
docker buildx inspect --bootstrap
```

A vantagem é que agora o buildx consegue compilar para mais arquiteturas do que quando ele saiu, sendo elas:

* linux/386
    
* linux/amd64
    
* linux/amd64/v2
    
* linux/amd64/v3
    
* linux/arm/v6
    
* linux/arm/v7
    
* linux/arm64
    
* linux/riscv64
    
* linux/ppc64
    
* linux/ppc64le
    
* linux/s390x
    
* linux/mips64le
    
* linux/mips64
    

Daí um exemplo de build, que é a do RSMD explicado anteriormente, ficaria assim -- caso todas as arquiteturas aqui exemplificadas funcionasse a build:

```bash
docker buildx build \
    --platform linux/386,linux/amd64,linux/amd64/v2,linux/amd64/v3,linux/arm/v6,linux/arm/v7,linux/arm64,linux/riscv64,linux/ppc64,linux/ppc64le,linux/s390x,linux/mips64le,linux/mips64 \
    --push \
    --tag fazenda/rsmd \
    .
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677796832330/28340196-f248-49f3-814b-4468ae2f9e78.jpeg align="center")

"[red tool box](https://www.flickr.com/photos/96666162@N00/502240730)" by [ali edwards](https://www.flickr.com/photos/96666162@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

### Debugs

Caso tenha, especificamente, problemas com algum pacote R ao utilizar o Buildx, você pode olhar [esta](https://gitlab.alpinelinux.org/alpine/infra/infra-packages/-/issues/1) issue que foi aberta há uns anos. Mas, basicamente, se trata de um problema de compatibilidade em como o R em si funciona durante builds em ambientes emulados -- o Qemu que o Buildx usa por debaixo dos panos --, sendo que se fosse buildar nativamente em uma arquitetura ARM você não teria este problema.

As saídas encontradas foram adicionar a falta do shebang nos arquivos de configurações necessários, isto após a instalação do R em si e nos seguintes pacotes:

* [mongolite](https://github.com/Fazendaaa/mongolite)
    
* [ragg](https://github.com/Fazendaaa/ragg)
    
* [systemfonts](https://github.com/Fazendaaa/systemfonts)
    
* [openssl](https://github.com/Fazendaaa/openssl)
    

E caso tenha algum problemas ao executar o R em si, executar o seguinte código após a sua instalação pode lhe ajudar:

```bash
#!/bin/sh
for script in $(ls -p /usr/lib/R/bin/ | grep -v / )
do
    sed -i '1 i\#!/bin/sh\n#' "/usr/lib/R/bin/$script"
done
```

Salvar ele em um script e executar seria a melhor saída.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678560802700/d8155bec-9dfb-4687-9019-dba43d9a13f3.jpeg align="center")

"[duck tape party supplies 2 - all you can eat](https://www.flickr.com/photos/73645804@N00/4472384764)" by [woodleywonderworks](https://www.flickr.com/photos/73645804@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## ARM/v8 == ARM64

Mesmo que a OCI diga que eles utilizam ARM 64 bits por causa do Ampere A1, as builds do buildx utilizando a tag `arm/v8` que é a mesma coisa que taggear como `arm64` não funcionam; lembrando que já existe `arm/v9` até porque, por mais que tenha mais de um ano que foi lançada, tanto a versão oito como a versão nove, ambas são 64 bits. Então caso tenha algum problema de executar alguma build ARM no cluster da OCI por causa disso, problema este que NUNCA acontece com K3s ou K3D rodando em um hardware ARM, muito provavelmente terá que fixar a tag como `arm/v8` no seu processo de build.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677797403497/61e34278-3a02-4adf-b03a-c851908b36ea.jpeg align="center")

"[Michael Cliff Jumping Clone](https://www.flickr.com/photos/29697878@N00/3629470363)" by [jrandallc](https://www.flickr.com/photos/29697878@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

## Pros & Cons da OCI

O texto em si, no seu ambito do tutorial, deixou claro muitas vantagens da OCI em seu ambito de *free tier*. Agora o que segue é uma análise mais aprofundada com relação à experiência de contratar a provedora no seu âmbito de produção para uma empresa que disponibiliza serviços que rodam em nuvem.

**Prós**:

* Uma das vantagens práticas realmente da Oracle é a questão deles emitirem nota e poder ter uma questão fiscal comoda quando comparado à empresas de fora do País
    
* Times de Vendas e CXM (Customer Experience Management) são bem solicitos e prontos a ajudar
    
* Dólar fixado na hora de fechar o contrato pra não sofrer flutações de câmbio
    
* Sistema de análise de consumo que monitora e sugere novos padrões de uso para se adequar a demanda
    
* Alta granularidade de configurações dos ambientes, podendo ter o controle completo e independente de CPUs e RAM; fora a clara distinção de quais são os vendors dos hardwares e suas configurações
    

**Contras**:

* Sistema de gerenciamento de usuários é poluído, complexo e burocrático. Pra fazer qualquer alteração simples vai ter que abrir um ticket de chamado com eles -- fora que muito provavelmente isso levará tempo e irá requerer pelo menos uma call para poder ser solucionado
    
* Não tem a robustez que a GCP possuí em dash, o que não quer dizer muita coisa uma vez que a Azure e AWS possuem dashes ainda melhores
    
* Demora para alocação e remoção de recursos -- E MUITO, 30x mais lerdo que o Linode **NO MELHOR CENÁRIO**
    
* OCI CLI é bem ruim de gerenciar com multiplas contas atreladas à ela
    
* Falta de suporte do site à diversos tipos de browsers
    
* Irresponsividade de deleção de recursos no sistema -- fazendo com que os mesmos continuem alocados
    
* Contratos de crédito de um ano -- o que impede demais migrar de uma nuvem para outra caso imprevistos apareçam
    
* Apesar de todo o time de vendas falarem que tem o suporte deles o suporte técnico em si é em Inglês -- não que isso seja um contra por si só quando outras provedoras fazem similiar mas como foi vendido deixou-se a entender que seria em Português; mesmo que tenha sido falha de entendimento e/ou comunicação, pelo menos foi tendencioso
    

---

O K8s ofertado pela empresa é objetivamente o pior com que já tive contato, mesmo na conta paga:

* Deploys ficam irresponsíveis após alguns minutos
    
* Pressão no disco constante -- porque o disco não aloca dinamicamente com a quantidade de cores ou RAM, sendo block storage ou SSD na máquina mais cara que eles tem a ofertar
    
* Sem possibilidade de reiniciar a máquina que o cluster roda
    

**Experiência própria**: *em quase três anos de uso de Linode, dois de MS e alguns de AWS nunca tive nenhum problema que precisou de um atendimento*. Já na OCI:

* Em menos de um mês de OCI, quase dois atendimentos por semana por contas mal configuradas que **ELES** criaram
    
* Comunicação por e-mail é poluída sendo que eles mandam e-mails para as pessoas erradas
    
* Spam absurdos sendo que, em momento nenhum, ninguém selecionou a opção de receber propagandas e ofertas deles
    
* Treinamentos incoerentes:
    
    * Um funcionário quis questionar um ponto da arquitetura -- que funcionava bem na Azure e na AWS -- dizendo que o cluster k8s que precisasse mais de 60GB de disco que estaria sendo o problema em si
        
    * Outro funcionário disse que como a OCI em si funcionava não fazia sentido a alocação de recursos não escalar com o pré-alocamento da infra em si, e que a falta de clareza disso na documentação fazia com que vários clientes, infelizmente, sofressem com os mesmos problemas e que eles eram sabidos por parte deles mas nunca corrigidos
        
    * E o terceiro acredita que era erro da combinação de versão do kubernetes com versão da imagem Linux deles -- o que foi mostrado que não era, restando apenas pensar que o problema em si é ou a implementação do K8s ou o Oracle Linux por si só
        
* Mesmo mudando o servidor -- saindo de Vinhedo para Guarulhos -- os problemas se mantiveram. Além de mudar a imagem padrão do K8s deles para outra. E até mesmo mudando as versões do kubernetes e as versões das imagens.
    
* Travas de "segurança" para alocação de recursos que não podem ser alteradas sem uma aprovação de alguém do time da OCI -- uma inversão absurda de responsabilidades, mostrando que eles que são o administrador da infra que o cliente contratou e não o cliente em si
    

Tanto que mesmo rodando em uma Rasberry 32 bits local e com um cartão de memória os problemas que a Oracle apresentam são vergonhosos. Por isso a recomendação seria ao invés de utilizar a oferta deles de K8s, seria subir uma máquina virtual rodando [K3s](https://k3s.io/) -- assim como exemplificado no Linode no [último texto](https://fazenda.hashnode.dev/rancher-no-linode).

Em sã consciência, depois de experiências com AWS, Azure, GCP e Linode, a Oracle não se mostra como uma opção viável para um negócio:

* Documentações simplesmente erradas -- não desatualizadas, erradas mesmo
    
* Precisar abrir um ticket e fazer um chamado que pode levar dias para qualquer mudança de perfil de usuários
    
* Instabilidade da infra -- registros de recursos em ARM demoram para ser responsivos
    
* Demora para poder fazer qualquer coisa no sistema
    
* Latência de operações
    
* Impossibilidade de deletar alguns recursos alocados -- o que faz com que eles fiquem lá alocados mesmo que não queira mais utilizar.
    
* Necessidade de sequencializar o que em outras infras pode ser parelizado -- scheduler do K8s é infantil
    
* Network aquem de qualquer outra provedora -- no sentido de velocidade mesmo
    

Isto que o a conta possuí um reponsável CMX para ajudar com tudo isso. Ou seja, muito provavelmente se for alguém sem um contrato prévio, não conseguiria ter sequer o mínimo de suporte que foi apresentado. Meio que deixa claro que a empresa procura mais focar em vender do que entregar.

A Oracle se demonstra ser o *"barato que saí \[MUITO\] caro"*, toda economia de infra que eles possam oferecer em contrato é simplesmente anulada pelo gasto com pessoal treinado e, até mesmo, a demora de tudo e sistemas críticos ficarem fora do ar podendo assim custar a operação do seu negócio pelo downtime. O que faz com que a infra, neste caso, seja um dos piores pontos da sua operação, porque irá gastar demais tempo nela e alguns outros pontos já foram trabalhados no seguinte texto: [O Inferno de Dante do Cloud Native](https://fazenda.hashnode.dev/o-inferno-de-dante-do-cloud-native).

> ***A Oracle é a provedora de nuvem que faz serviços on-premises serem a melhor opção.***

Porque, no caso da afirmação anterior, é um tiro no pé ter a responsabilidade do hardware enquanto rodar na Oracle é um tiro na cabeça:

* A "cultura do medo" da divisão de nuvem faz com que executivos [saiam da empresa](https://www.businessinsider.com/oracle-cloud-infrastructure-insiders-culture-of-fear-2021-6)
    
* Que ela seja a única empresa de nuvem que não teve um crescimento considerável durante o COVID comparada com as outras empresas do segmento -- por mais que OCI por si só tenha crescido, não foi nada comparado com a competição
    
* E que, mesmo no começo de 2023 muitas empresas tenham demitido seus funcionários, a Oracle foi uma das poucas que teve uma [demissão considerável na cloud](https://www.foxbusiness.com/markets/oracle-lays-off-hundreds-of-employees) em meados de 2022
    
* A pessoa indicada para ser o próximo CEO [abandona a empresa](https://www.businessinsider.com/oracle-cloud-infrastructure-don-johnson-leaves-2023-1)
    
* E é a [última provedora de nuvem](https://www.statista.com/chart/18819/worldwide-market-share-of-leading-cloud-infrastructure-service-providers/) em market share -- perdendo até para provedores de mercados específicos mas em escala global
    

E, além de tudo isto, mais players vem adotando a empresa por causa do preço baixo que estão colocando nos serviços para poder conquistarem mercado, empresas como a [Vivo](https://www.userwalls.news/technology/vivo-migrates-oracle-cloud-infrastructure-6189060/) e a [Uber](https://economictimes.indiatimes.com/tech/technology/uber-signs-seven-year-cloud-partnership-deal-with-oracle/articleshow/97928164.cms#:~:text=the%20two%20companies.-,Oracle%20will%20become%20a%20global%20'Uber%20for%20Business'%20client%2C,and%20eat%20around%20the%20world.) migraram parte dos serviços deles para a Oracle. Mas, mesmo essas empresas enormes e com times dedicados, a Oracle não é uma boa opção dado todos os contratempos já elaborados aqui.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1677796907253/09afd96f-0c5c-4f1a-b3ce-940e18f5a8a2.jpeg align="center")

"['All roads lead here, and this is where all worlds end'](https://www.flickr.com/photos/82278008@N00/155636430)" by [PhotoGraham](https://www.flickr.com/photos/82278008@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

### Tips

* Para evitar, mesmo que você for consumir pouco, dores de cabeça em disco no longo prazo uma vez que ele não escala dinamicamente com os cores e/ou RAM das opções ofertadas
    
    1. na hora de criar o cluster, selecione a opção de alocar o espaço do seu block storage
        
    2. ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678282706546/76609036-b071-4bd3-95e5-a1f968621311.png align="center")
        
        E selecionar a opção do quanto vai querer -- 1TB neste caso:
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678282728548/5b11f367-aad9-448d-a88a-96953966adde.png align="center")
        
        *Sim, em um cluster de 8 CPUs e quase 100GB de RAM, a OCI aloca por padrão 46.6GB de disco*
        
* Procure realmente configurar Terraform ou o Ansible, a dash deles é bem intermitente e, no mínimo, não clara para não iniciantes e pessoas que nunca tiveram contato com Linux -- por causa da noção de compartimentos
    
* Caso for fazer uma demonstração, PoC (Proof of Concept) ou qualquer outra termo que usem de período de testes no caso de uma proposta comercial; crie você mesmo a sua conta para não ter problema de alocação de recursos e escopos uma vez que o contrato for fechado
    
* As PoCs são por um mês mas recomendo utilizar a infra por uns pelo menos três meses antes de fechar um contrato para não ser pego de surpresa em produção
    
* Reveja os seus contratos de SLA porque a infra é mais instável
    
* Recalcule principalmente o tempo de colocar um sistema em produção seja com ou não CI/CD uma vez que demora para os deploys ficarem no ar
    
* Outra coisa importante: realmente utilize, use e abuse da infra para ver se ela vai dar conta da sua demanda para não achar que mesmo o caso mais simples que escala de maneira simples em qualquer situação irá escalar como o que espera
    

No mais, realmente considere outras opções, como:

* Se tiver grana e querer muitas certificações de segurança: [***Azure***](https://azure.microsoft.com/en-us)
    
* Se tiver tempo e pouca grana: [***Linode***](https://www.linode.com/pt/)
    
* Se for tercerizar e querer poder contar com economias de escala: [***AWS***](https://aws.amazon.com/)
    
* Se quiser coisas prontas e não focar na infra: [***GCP***](https://cloud.google.com/?hl=pt-br)
    

Mas NUNCA use a Oracle porque não apresenta diferencial que nem os outros.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678225142202/34fffdee-f142-4897-aeb2-5438bdc70669.jpeg align="center")

"[Brant Point Lighthouse Nantucket, Credit Yankee Magazine-Larry Tocci](https://www.flickr.com/photos/77102986@N07/6969752438)" by [Massachusetts Office of Travel & Tourism](https://www.flickr.com/photos/77102986@N07) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=openverse).

### PS

Todas as pessoas com as quias o contato comercial do time da Oracle do time Brasil foi feito foram prestativas, procuraram entender o problema e merecem ser reconhecidas por isso. Por mais que tenha sido uma jornada, elas não procuraram empurrar nada com a barriga e queriam realmente resolver o problema mesmo depois de:

* Deixar claro N vezes que nunca tivemos problemas com Azure e Linode
    
* Falarmos que nunca mais voltaríamos para eles após o contrato terminar
    
* Várias calls que nunca resolviam nada da parte do problema e só mostravam a insatisfação e a perda de tempo/dinheiro que tudo isso tem causado
    

Algumas observações:

* O sistema de alocação deles poderia ser menos atrelado ao fato da pessoa ter o OCI CLI na máquina dela, criando atritos desnecessários para coisas que poderiam ser baixadas direto do dashboard -- o que complica o uso, fazendo a dashboard ser um cidadão de segunda classe.
    
* Ter travas de segurança são importantes e necessárias, mas ter que abrir um ticket para rever elas é, no mínimo, insalubre. Situações assim poderiam ser resolvidas com uma senha temporária que é enviada por e-mail ou até mesmo integração com um sistema de autorização de recurso com aplicativos de tokens temporários -- até bancos quando bloqueiam uma transação por acharem suspeita permitem liberar ela por autorização DO CLIENTE por app
    
* Investir mais em tutoriais e comunidades para trazer conteúdo sobre a infra ao invés de ter uma plataforma quase que fechada nessa parte poderia auxiliar e pegarem feedback
    
* Olhar mais o que a competição faz ainda mais por questão UX
    
* Deixar claro pro time de suporte as especificidades de cada região de atendimento para não ter informações conflitantes: o time de fora do País quando descobriu que se leva pelo menos 15min para se criar um cluster k8s achou que estava muito fora dos padrões enquanto o time do Brasil disse que de 15min a 20min era o normal
    

A ideia de um provedor de nuvem é proporcionar o cliente a crescer, coisa que não está alinhado com o sistema e experiência. Mesmo se não tivesse tido nenhum problema com relação ao K8s em si, missão, visão e valores deveriam ser revistos; é um modelo arcaico que limita o alcance e potencial uma vez que o cliente é o cidadão de segunda classe, já os produtos e serviços são os cidadões de primeira classe.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1678470761949/a65e54e8-e84f-434c-b190-a5c578f39367.jpeg align="center")

"[Hope](https://www.flickr.com/photos/12836528@N00/5921778658)" by [kevin dooley](https://www.flickr.com/photos/12836528@N00) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Referências

* [**I cannot access my instances on oracle cloud - freetier**](https://www.reddit.com/r/oraclecloud/comments/xquxbb/i_cannot_access_my_instances_on_oracle_cloud/)
    
* [Ready/Set/Go Kubernetes+Traefik+LetsEncrypt on ARM at Oracle OC](https://marcelo-ochoa.medium.com/ready-set-go-kubernetes-traefik-letsencrypt-on-arm-at-oracle-oci-eb4a672d3a3a)
    
* [Utilizando o Oracle Cloud Infrastructure CLI (OCI-CLI) - Parte 1](https://www.oracle.com/br/technical-resources/articles/cloudcomp/utilizando-oci-cli-p1.html)
    
* [Linode speed test](https://www.linode.com/community/questions/17816/how-do-i-get-faster-speed#answer-68091)
    
* [Amazon EC2 instance network bandwidth](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-network-bandwidth.html)
    
* [Compute Shapes](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm)
    
* [buildx is not a docker command on linux/amd64 ? #132](https://github.com/docker/buildx/issues/132)