# Configurando Rancher em um ARM

# Introdução

Graças ao canal do YouTube do  [Techno Tim](https://www.youtube.com/channel/UCOk-gHyjcWZNj3Br4oxwh0A) eu fui exposto ao  [Rancher](https://rancher.com/), o que pra mim foi sensacional. Vindo de um background de uma pessoa que gosta de  [Docker](https://www.docker.com/) mas com **ZERO** conhecimento de  [Kubernetes](https://kubernetes.io/) -- além do fato de saber que ele existe e é um orquestrador de containers --, descobrir uma solução que reduz a complexidade de usar Kubernetes e ao mesmo tempo ser um norte para aprender ele, Rancher apareceu em um bom momento.

Dado esta prévia, eu queria colocar as minhas mãos em mexer no sistema mas rodar ele na minha  [Nanopi M4](https://www.friendlyarm.com/index.php?route=product/product&product_id=234)  -- que é, ao meu ver, a placa com o melhor custo/benefício nas ofertas que usam um chip ARM --; todavia a documentação do processo não foi fácil de se achar, procurei seguir  [este](https://youtu.be/oILc0ywDVTk) tutorial para configuração dele em um x86; problemas surgiram, os erros não eram claros e eu estava tendo o meu primeiro contato com a plataforma. Após algumas horas de caminhos frustrados, uma solução foi encontrada e os passos foram rascunhados  [neste Gist](https://gist.github.com/Fazendaaa/d41718af657718e10914fe83a1121773).

# Passo A Passo

1. Baixe [Armbian](https://www.armbian.com/nanopi-m4/) -- usei o Bionic server
2. Use um ISO burner para gravar o sistema em um SD Card -- usei o  [balenaEtcher](https://www.balena.io/etcher/)
3. SSH  -- a senha é `1234` -- na sua Nanopi com:
```shell
ssh -l root ip.da.sua.placa
```
4. Crie um usuário e logue de novo desta vez nele e com a sua senha que criou no passo anterior
5. Verifique e instale os updates:
```shell
sudo apt-get update
sudo apt-get upgrade -y
```
6. Instale o Docker:
```shell
curl https://get.docker.com | sh
```
7. Siga os passos de adicionar o seu usário para rodar o Docker em modo de superuser sem precisar invocá-lo
8. Inicialize o Rancher:
```shell
docker run -d --restart=unless-stopped \
    --publish 80:80 \
    --publish 443:443 \
    --volume /opt/rancher:/var/lib/rancher \
    --volume /lib64:/lib64 \
    --volume /etc/cni/:/etc/cni/ \
    rancher/rancher:v2.4.5-rc7
```
9. Abra o seu navegador e digite o ip da sua Nanopi e siga os passos de configurações do Rancher
10. [Passo Extra] Sempre se lembre de quando for subir um serviço, de utilizar o `Network Provider` como `Flannel`:
![84968426-d75a2100-b0ec-11ea-9bdc-2285ee2fa74b.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1593141307218/0SGXDMFMw.png)

## Possíveis Correções Para Alguns Erros

Caso tenha problemas durante ou depois da configuração, você pode seguir estes seguintes passos:

- Reiniciar sua placa
- `sudo rm -r /etc/kubernetes`
- `sudo rm -r /var/lib/rancher`

# A Fazer

- Escrever outro post de como configurar uma  [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) com um client [MagicMirror](https://magicmirror.builders/) rodando nela e o server no Rancher configurado neste tutorial
- Testar em uma  [Raspberry PI 4](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/) e ver se o processo se mantem similar
- Testar em uma [Tinker Board](https://www.asus.com/br/Single-Board-Computer/Tinker-Board/)
- Buildar  [Jenkigs](https://www.jenkins.io/) e/ou  [Chef](https://www.chef.io/) para ARM e ver de rodar eles com o Rancher

## Apêndice

Recomendo configurar agora os seguintes serviços uma vez que já está com o Rancher rodando:

1.  [Heimdall](https://youtu.be/PA01Z6-z8Qs)
2.  [Pi-Hole](https://youtu.be/NRe2-vye3ik) -- particularmente não sei se funciona bem neste cenário, como utilizo pfBlocker não vi a necessidade de configurar, mas caso não tenha nenhum dos dois, este seria um começo

# Referências

-   ["It beggars description."](https://www.flickr.com/photos/58753832@N05/49317984156) by  [CarlH_](https://www.flickr.com/photos/58753832@N05) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/)
-  [Rancher 2 on Raspberry Pi 4 with RancherOS ARM64 fails to run #21534](https://github.com/rancher/rancher/issues/21534#issuecomment-643865494)
-  [Running on ARM64 (Experimental)](https://rancher.com/docs/rancher/v2.x/en/installation/options/arm64-platform/)
-  [rancher/flannel-cni](https://github.com/rancher/flannel-cni)
-  [Configuring flannel for container networking](https://coreos.com/flannel/docs/latest/flannel-config.html)
