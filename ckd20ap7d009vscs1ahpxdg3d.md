# Tenha seu próprio smart mirror

> Ainda lembro de ver os painéis do shopping Market Place quando criança e achar incrivel aquilo

imagem de capa:  ["info panel"](https://www.flickr.com/photos/49502969671@N01/10461040715) by [estorde](https://www.flickr.com/photos/49502969671@N01) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/?ref=ccsearch&atype=rich)

Sabe aqueles painéis de informações como quiosques digitais em empresas, shoppings ou até mesmo em um consultório médico? Já quis ter um dele? Já tem um servidor com [Rancher](https://rancher.com/) rodando? Ótimo, vai ser bem simples.

![19823103471_ab9d664dd1_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1595698900522/e3uJlW0Wf.jpeg)

 ["Baggage Carousel Sign"](https://www.flickr.com/photos/51526368@N03/19823103471) by [Aranami](https://www.flickr.com/photos/51526368@N03) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich)

Uma das vantagem desta abordagem é que você poderá ter vários paineis funcionando de maneira igual precisando configurar apenas em um lugar, o servidor, diferentemente de algumas abordagens nais quais você teria que ir configurando painel por painel.

Outra boa vantagem é a você poderá prolongar a vida da sua [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) uma vez que outras abordagens fazem ela ser o servidor e o painel ao mesmo tempo, fazendo com que a placa esquente muito e caso você não tenha um bom dissipador de calor ela acabará esquentando demais.

## MagicMirror2

Caso não conheça ainda o [MagicMirror2](https://magicmirror.builders/), recomendo entrar no site deles e dar uma olhada por cima no projeto. Alguns dos projetos que julguei interessante estão linkados do apêndice.

O legal do projeto em si é que você também poderá transformar ele em um [Alexa](https://en.wikipedia.org/wiki/Amazon_Alexa) para poder usar como ponto de acesso e modificação deles.

![32885120141_9ce3f8a8ca_o.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1595702830391/YOrbroxg0.jpeg)

 ["Trumpet Playing Robot"](https://www.flickr.com/photos/98887424@N00/32885120141) by [alisonjpope](https://www.flickr.com/photos/98887424@N00) is licensed under  [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=ccsearch&atype=rich) 

## Rancher

1. A configuração no Rancher será bem simples. Basta colocar [bastilimbach/docker-magicmirror](https://hub.docker.com/r/bastilimbach/docker-magicmirror) como imagem necessária e escolher um nome para ela:
![image919.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595693989193/O-ScFpb4u.png)
2. Depois dar um bind da porta `8080` em alguma disponível no seu servidor -- no meu caso foi a `8700`:
![image1058.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595693977450/txpyiDDvM.png)
3. Como env var, configure apenas a timezone com `TZ` -- a lista completa você pode ver [aqui](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones):
![image955.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595693969949/Q4j6mXOgL.png)
4. SHH no seu servidor, crie uma pasta chamada `magic_mirror`, entre nela e digte `pwd`, copie o caminho para utilizar de binding nos volumes -- no meu caso o comando retornou `/home/farm/magic_mirror/`:
![g1100.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595693961009/RV8GKLlnd.png)

## Raspberry Pi Zero W

1. Caso tenha uma Raspberry Pi Zero W ou W+ com o sistema operacional já instalado, pule para o passo 6, do contrário siga as configurações
2. Baixe a versão Lite do [sistema operacional](https://www.raspberrypi.org/downloads/) 
3. Escreva ele em um micro SD -- recomendo o [etcher](https://github.com/balena-io/etcher) para fazer isto porque caso tenha a versão mais recente não precisará fazer o passo 2
4. Abra a pasta `boot` no cartão de memória, crie um arquivo chamado `wpa_supplicant.conf` e cole o seguinte texto fazendo as alterações necessárias:
```
country=BR # seu país aqui
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
	ssid="MyWiFiNetwork" # nome da sua rede de wi-fi
	psk="aVeryStrongPassword" # sua senha do wi-fi
	key_mgmt=WPA-PSK
}
```
5. Também crie um arquivo de texto vazio com o nome `ssh` na mesma pasta
6. Coloque o micro SD na Rasp, a ligue e acesse-a remotamente através de outro computador -- a senha é `raspberry`:
```shell
ssh -l pi ip.da.rasp.aqui
```
7. Depois disso só copiar e colar o seguinte comando -- ele vai executar [este](https://gist.github.com/Fazendaaa/4a5e04ec51451c19c13eec049c3688f0) script:
```shell
curl https://gist.githubusercontent.com/Fazendaaa/4a5e04ec51451c19c13eec049c3688f0/raw/ac44f16513751678a495c69a55791c2fbbc6eb3c/setupRaspClientMM.sh | sh
```
8. Sua Rasp irá desconectar do ssh depois de finalizada, acesse ela de novo e edite o arquivo `chromium_start.sh` e altere a última linha dele -- usei o `nano` só de exemplo:
```shell
nano ~/chromium_start.sh
```
```
#!/bin/sh
unclutter &
xset -dpms # disable DPMS (Energy Star) features.
xset s off # disable screen saver
xset s noblank # don’t blank the video device
matchbox-window-manager &
chromium-browser --check-for-update-interval=31104000 \
	--start-fullscreen --kiosk --incognito \
	--noerrdialogs --disable-translate --no-first-run \
	--fast --fast-start --disable-infobars \
	--disable-features=TranslateUI \
	--disk-cache-dir=/dev/null \ http://ip.do.sevidor.rancher:portaConfiguradaDoMagicMirror
```
10. Conecte o HDMI nela -- a Rasp não irá reconhecer o monitor se ele não tiver conectado nela quando ela inicar --, reinicie ela com o seguinte comando:
```shell
sudo systemctl reboot
```

Tudo deverá estar funcionando normalmente agora.

![image1222.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595700737745/7Gv8EeoGV.png)

## Nova Aba

Uma vez que o servidor está configurado, você pode acessar ele digitando no seu navegador -- meu exemplo:

![g1212.png](https://cdn.hashnode.com/res/hashnode/image/upload/v1595700498797/6g1K77IvN.png)

Uma possibilidade é caso você não tenha um monitor sobrando mas ainda gostaria de deixar como um "descanso de tela" ou como o painel que mostre toda vez que abra uma nova aba, vai conseguir fazer isto.

Outra possibilidade é caso sua empresa configure ou já esteja utilizando o MagicMirror e possua uma Virtual Private Network (VPN), você poderá acessar o MagicMirror da empresa em casa, tendo com facilidade ele no seu navegador ou até mesmo um painel com o endereço apontando pro da VPN -- este último será necessário configurar a VPN na Rasp ou no seu próprio modem.

## Apêndice

- Por favor, mude a senha da sua Rasp para não ficar utilizando a padrão dela, é uma boa prática de segurança
- Adiconar para adicionar novos módulos, veja a [lista](https://github.com/MichMich/MagicMirror/wiki/3rd-Party-Modules) deles
- Para configurar ligar e desligar a tela automaticamente, só seguir os seguintes passos na sua Rasp:
1. Adicione as seguintes ferramentas:
```shell
sudo apt-get -y install python3-pip
sudo pip3 install vcgencmd
```
2. Rode o comando -- ele irá pedir para escolher um editor de texto para fazer a configuração do próximo passo, recomendo o `nano` por ser o mais simples de usar:
```shell
crontab -e
```
3. Copie as próximas linhas e cole elas -- com `Ctrl` + `shift` + `v` --, basicamente você estará pedindo pra Rasp ligar o monitor conectado à ela às 9h e desligar às 17h -- 5h PM:
```shell
0 9 * * * echo 'on 0' | vcgencmd display_power 1
0 17 * * * echo 'standby 0' | vcgencmd display_power 0
```
- Projetos recomendados:
  - [DIY Smart Mirror (that doesn't steam up!)](https://youtu.be/puFSdfIRNIw)
  - [ALEXA Smart Mirror (New Build)](https://youtu.be/aa3VVZA0e5Y)
  - [Smart Mirror Touchscreen (with Face ID) using Raspberry Pi 4 | Full Tutorial](https://youtu.be/RWjvJq4Zabk)
  - [DIY Smart Mirror - Complete Guide (2020)](https://youtu.be/rR3btsxWM5Q)

## Referências

- [Configurando Rancher em um ARM](https://fazenda.hashnode.dev/configurando-rancher-em-um-arm-ckbvnad7u0076c7s1dljnfwnf)
- [MagicMirror on Raspberry Pi Zero W and Rancher -- 2020 install](https://gist.github.com/Fazendaaa/8d92ecbc42ed2119edda40dcd03df6e5)