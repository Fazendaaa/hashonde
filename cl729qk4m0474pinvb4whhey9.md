# LaTex package manager

foto de capa: "[Admisson Book index](https://www.flickr.com/photos/49968232@N00/15891782870)" by [Leo Reynolds](https://www.flickr.com/photos/49968232@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

> *"Any man who has the brains to think and the nerve to act for the benefit of the people of the country is considered a radical by those who are content with stagnation and willing to endure disaster."* -- Mustang, ROY (Fullmetal Alchemist)

# Intro

Se você ja fez pesquisa científica, escreveu um curriculum no [Overleaf](https://www.overleaf.com/) ou precisou fazer uma fórmula matemática em um Markdown, provavelmente utilizou [LaTex](https://www.latex-project.org/) para isto.

Mas caso algum dia esteja sem um "suporte" em si de um Overleaf, [WinEdt](https://www.winedt.com/), [VSCode](https://code.visualstudio.com/) ou outros, pode se tornar complicado compartilhar documentos e/ou mudar de ambiente de desenvolvimento. Isto porque do ponto de vista de ambiente, o LaTex em si sera necessário ser instalado mas além dele os pacotes que foram utilizados; do contrário seria como copiar um código da internet e procurar executar ele sem baixar as dependências e na versão correta delas, simplesmente não irá executar.

Tal cenário por si só não pode tirar o seu sono, ainda quando ferramentas como as apresentadas muitas vezes já fazem a gestão de tudo isto para o usuário final, mas isto vem ao custo de um vendor-locking e, muitas vezes, bloatware desnecessário. Além de dependências não necessárias que são instaladas para cobrir todos casos possíveis de como o usuário irá utilizar elas, as tornando muito mais parecidas com IDEs (Integrated Development Environment) por si só do que editores de texto.

Este problema é exarcebado quando códigos são compartilhados sem ficar claro que o projeto trabalha com LaTex e o desenvolvedor muitas vezes não sabe como utilizar a ferramenta e que muito menos pacotes dela serão necessários. Caso todo o conjunto de seja baixado -- assim como citado pelas IDEs anteriores -- tudo de uma vez na máquina de desenvolvimento, isto pode ocupar atualmente em torno de 6GB só para *"gerar um relatório"*.

Isto tudo por si só não seria um problema, mas caso o projeto tenha um pipe de validação ele pode atrasar consideravelmente o seu processo. Por injetar um gargalo só vendo da perspectiva de tamanho, só que ainda há a etapa de configuração de ambiente, controle de versões e setup das dependências; o que acarretaria a levar mais tempo ainda. Tal overhead catapultaria um processo que levava alguns segundos para ser validado para alguns minutos. Agora multiplique estes minutos pelo número de commits e pushes que precisam ser verificados toda vez que uma alteração é feita, distribuído pelo número de pessoas no projeto e multiplicado pelo número de projetos que usam o LaTex em si; fica claro ver que é um problema de indústria e não mais de um projeto em si.  

Por mais que isto não seja uma situção única e exclusiva do LaTex, outras ferramentas procuram evitar ele com uma solução atrelada chamada: **gerenciador de pacotes**.

![259421447_5b7f3dc286_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660870909876/ISAthoN9H.jpg align="left")

"[Book Spiral - Seattle Central Library](https://www.flickr.com/photos/93452909@N00/259421447)" by [brewbooks](https://www.flickr.com/photos/93452909@N00) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

# LaTex

LaTex em si não é um editor de texto como o Word, se trata de uma expecificação de formato de arquivo de texto, similar a uma linguagem de programação como [Julia](https://julialang.org/), [Java](https://www.java.com/en/), [CPP](https://cplusplus.com/), etc.

Mesmo sendo muito utilizado no mundo de programação em [R](https://www.r-project.org/), ele por si só não se trata de uma linguagem de programação, mas sim uma linguagem de marcação, assim como HTML e Markdown. E assim como elas, diferentemente de um formato como docx do Word, são documentos escritos em texto simples que necessitam ser renderizados para a forma específicada. Separando assim o conteúdo do o como ele é apresentado. Um exemplo disto seria a seguinte fórmula em um documento de texto LaTex:

```latex
\begin{align}
  E_0 &= mc^2 \\
  E &= \frac{mc^2}{\sqrt{1-\frac{v^2}{c^2}}}
\end{align} 
```

Que uma vez renderizado ficaria igual a:

$$
\begin{align}
  E_0 &= mc^2 \\
  E &= \frac{mc^2}{\sqrt{1-\frac{v^2}{c^2}}}
\end{align} 
$$

Fórmulas matemáticas são um dos motivos pelo o qual LaTex é comumemente relacionado ao ambiente acadêmico, só que também há a facilidade de referenciar outras estruturas de representação além delas e referências bibliográficas; além da previamente comentada e da facilidade pra programadores para interagir com ela, facilitando o desenvolvimento da producação de conteúdo científico.

Um detalhe importante é que LaTex beira os 40 anos enquanto ferramentas como Microsoft Office são mais novas. Além disto a Microsoft lançou em 2014 o [Power BI](https://powerbi.microsoft.com/en-us/), que é a ferramenta de automação e análise de dados da suit Microsfot para Business Intelligence. Ou seja, a automação mais antiga que existir em Power BI tem um quinto de vida que o LaTex existe; sendo que era mais fácil por essa coerência e consitência do LaTex apresenta de fazer integração dele com outras ferramentas de programação do que as ferramentas da Microsoft com outras ferramentas de programação uma vez que tais padrões eram famosos por mudar frequentemente e deprecar os antigos a fim de forçar o usuário a atualizar pro mais novo; gerando mais insegurança no ciclo de vida da solução do que estabilidade para um desenvolvimento longínquo. 

Uma das vantagens do LaTex por ter esta abordagem é que um texto comum pode virar um docurmento de um paper científico em pdf com todas as tags configuradas ou um site com links e tudo a partir do mesmo documento; além de que este mesmo documento pode até virar apresentações de do tipo power-point sem mudar nada nele. 

O LaTex se apresenta como um formato universal para produção de conteúdos, deixando a forma como um cidadão de segunda classe; filosofia esta que é invertida em soluções como Word, Power-Point, Google Docs, etc. Fora que por ser um padrão aberto e retro compativel, muitos documentos de mais de três décadas atrás quando o formato foi criado funcionam até hoje com zero manutenção necessária; fazendo com que o único custo que exista em si seja quando ele foi escrito.

Ferramentas que transformam o conteúdo cru do LaTex para algo final de acordo com a visão de quem as escreve são os motores da linguagem, alguns famosos são: [Tex Live](https://www.tug.org/svn/texlive/) e [MikTeX](https://github.com/MiKTeX/miktex). 

![2526215746_d4dd7c1d10_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660871110983/IasKAuzy9.jpg align="left")

"[Royal KMM 'Magic Margin' Typewriter](https://www.flickr.com/photos/35237091544@N01/2526215746)" by [Twylo](https://www.flickr.com/photos/35237091544@N01) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

# Solução

Assim como já comentado, o LaTex no ponto de vista de um desenvolvedor Web seria como um HTML e linguagens como o [Python](https://www.python.org/) atuariam nele como o [JavaScript](https://www.javascript.com/) faz, mudando e atualizando como o conteúdo é apresentado, dando vida ao documento.

Só que assim como um [React](https://reactjs.org/), [Vue](https://vuejs.org/) ou qualquer outro framework, o `package.json` auxiliam eles a listar o que foi utilizado no projeto: o framework em si, os pacotes e as versões de ambos; permitindo que os usuários de [EMACS](https://www.gnu.org/software/emacs/), [VIM](https://www.vim.org/) e VSCode compartilhem o mesmo projeto, editando em ferramentas diferentes. Atualmente um padrão de gerenciador pacotes LaTex não existia até então.

Para preencher tal lacuna, implementar uma solução similar ao [npm](https://www.npmjs.com/) é o esperado, e foi o que foi feito na empresa que trabalho para podermos não nos preocupar com os problemas já pontuados. Isto facilitou principalmente em alguns pontos:

- o controle de mudança nosso;
- desburocratizou a configuração de um ambiente de desenvolvimento para OS a OS;
- abstraiu os projetos da máquina de desenvolvimento;

Mas principalmente evitou muitas horas de retrabalho uma vez que atualizações do sistema poderiam quebrar projetos por não ter essa barreira de isolamento forçando uma manutenção não prevista no projeto; consequentemente encarecendo ele, o atrasando e gerando mais incertezas sobre a compatiblidade do que resultados.

E o diferencial é implementar tudo isso seguindo um padrão de CLI (Command Line Interface) para facilitar a integração sem ser um plugin para um editor de texto ou até mesmo uma função de uma linguagem apenas.

![8596762183_d17e34e301_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660927137928/uGhpc2YHiM.jpg align="left")

"[Soldering Station](https://www.flickr.com/photos/79371310@N02/8596762183)" by [tlwmdbt](https://www.flickr.com/photos/79371310@N02) is licensed under [CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/?ref=openverse).

# Shojo

[Shojo](https://github.com/Fazendaaa/Shojo/) é uma implementação FOSS (Free and Open-Source Software) com algumas melhorias do ferramental no qual ele se inspira.

![demo](https://raw.githubusercontent.com/Fazendaaa/Shojo/master/assets/gif/demo.gif)

A ideia é simples: *para cada projeto que utilize LaTex ter um `shojo.yaml` que liste os pacotes e a versão das ferramentas*.

```yaml
tex:
    version: "3.141592653"
tlmgr:
    version: "61401"
repository:
    url: https://mirror.ctan.org/systems/texlive/tlnet/
packages:
    - name: varwidth
      revision: "24104"
    - name: lastpage
      revision: "60414"
    - name: hyphenat
      revision: "15878"
    - name: tabu
      revision: "61719"
    - name: multirow
      revision: "58396"
    - name: babel-portuges
      revision: "59883"
    - name: wrapfig
      revision: "61719"
    - name: hyphen-portuguese
      revision: "58609"
    - name: fancyhdr
      revision: "57672"

```

**"Só"** isto já facilita a seguir princípio do **FAIR**:


**F** - *Findability* (Encontrabilidade)

**A** - *ACCESSIBILITY* (Acessibilidade)

**I** - *INTEROPERABILITY* (Interoperabilidade)

**R** - *REUSABILITY* (Reusabilidade)


Além de que a vantagem da solução em si é que ela trabalha em uma abordagem parecida de ambientes virtulizados que procuram segmentar os pacotes/ferramentas do sistema da aplicação em desenvolvimento. Ou seja, caso a ferramenta verifique que já há um pacote localmente para outro projeto com o mesmo nome e versão ela irá apenas referenciar ele; reduzindo redundância, tempo de consumo/configuração e dando establidade para o processo como um todo.

Caso queria fazer um teste agora no seu terminal e já tiver o [Docker](https://www.docker.com/) instalado, basta:

```shell
alias shojo='docker run -it --volume ${PWD}:${PWD} --workdir ${PWD} fazenda/shojo-latex'
shojo --help
```

Este é o sistema de demonstração, e ele é mais "pesado" por já incluir todos as dependências de LaTex necessárias, o Shojo por si só tem 2MB. E caso tenha gostado da aplicação, só adicionar esta linha no seu arquivo shell rc ou instalar como pacote do sistema como explicado na documentação do projeto. Caso prefira usar assim mesmo a documentação do comando anterior pode te auxiliar:

```shell
Shojo is made with Go to help you handle all of your LaTex package needs.
Complete documentation is available at https://github.com/Fazendaaa/Shojo

Shojo is also part of the Container tooling For Developers (CFD) initiative:
https://github.com/Fazendaaa/CFD

Usage:
  shojo [command]

Available Commands:
  add         Adds a LaTex package to the current project
  completion  Generate the autocompletion script for the specified shell
  help        Help about any command
  init        Initialize's Shojo package manager
  install     Install all presented LaTex packages in the current project
  repo        Configures the repository from where to fetch packages from
  rm          Removes a LaTex package to the current project
  upgrade     Upgrades all LaTex packages in the current project
  version     Prints Shojo's version

Flags:
  -h, --help   help for shojo

Use "shojo [command] --help" for more information about a command.
```

Com estes comandos você poderá até tocar um projeto atual uma vez que não precisa fazer nada nele em si para se tornar compativel com o Shojo; basta criar o arquivo de configuração e adicionar os pacotes nele. Assim como o `package.json` não se importa para a estrutura de arquivos que você utiliza no projeto, o Shojo também não tem nenhuma restrição de estruturação do conteúdo.

![14636130003_f8fe352b8e_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660915487778/laETplGlD.jpg align="left")

"[Itsukushima Shrine torii gate](https://www.flickr.com/photos/63234672@N04/14636130003)" by [Mustang Joe](https://www.flickr.com/photos/63234672@N04) is marked with [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/?ref=openverse).

## CCP

*Todos os textos até agora publicados aqui foram em R, por que o Shojo foi escrito em Go e não em R como a versão na qual ele se inspira?*

Muito mais por demérito do R do que pelo Go por si só. Muito mais será elaborado sobre Go, Python e outras linguagens, mas neste caso em expecífico o R não é uma ferramenta robusta, lhe falta ser compacto para poder ser facilmente distribuído como uma solução séria de CLI. Além de outros fatores que serão explorados no texto de o porquê de não utilizar R.

As vantagens de se utilizar Go são também claras:

- consegue gerar arquivos binários;
- suporta multiarquitetura;
- multi os: suporta uma build ser gerada para outras plataformas a partir de uma terceira;
- *"batteries included"*;
- bastante performática;
- bem documentada;
- várias ferramentas de análise de código;
- etc;

Fora que para este projeto em si, outras ferramentas incríveis foram utilizadas: 

- [cobra](https://github.com/spf13/cobra)
- [viper](https://github.com/spf13/viper)
- [Samael](https://github.com/fazendaaa/samael)
- [badger](https://github.com/dgraph-io/badger)

Cobra é um dos melhores frameworks de se fazer CLI independentemente da linguagem, e é utilizada também pelo [hugo](https://gohugo.io/). No caso do Shojo, a estrutura utilizada foi mais simples, com um `main.go` na raiz do projeto para registrar a função de entrada:

```go
package main

import (
	"github.com/Fazendaaa/Shojo/cmd"
)

func main() {
	cmd.Execute()
}
```

E ele é um projeto que se mantém em uma estrutura de separação de responsabilidades, sendo elas segmentadas em pastas:

- `cmd`: arquivos que tratam a entrada e saída do CLI;
- `controllers`: arquivos que elaboram a lógica das tarefas;
- `pkg:` arquivos que executam a lógica da tarefa;

Um exemplo de um `cmd`, seria o da tarefa de adicionar um pacote ao projeto, o `add.go`:

```go
package cmd

import (
	"fmt"

	controllers "github.com/Fazendaaa/Shojo/controllers"
	"github.com/spf13/cobra"
)

var addCmd = &cobra.Command{
	Use:   "add [package(s) to add]",
	Short: "Adds a LaTex package to the current project",
	Long:  ``,
	Args:  validateProjectPath,
	Run: func(cmd *cobra.Command, params []string) {
		spinner, fail := createSpinner(" adding package", "")

		if nil != fail {
			fmt.Println()
			fmt.Println(fail)

			return
		}

		resultChannel, fail := controllers.AddPackages(params, projectPath)

		if nil != fail {
			fmt.Println()
			fmt.Println(fail)

			return
		}

		fail = consumeChannel(params, "installing", spinner, resultChannel)

		if nil != fail {
			fmt.Println()
			fmt.Println(fail)

			killSpinner(spinner, false)

			return
		}

		killSpinner(spinner, true)
	},
}

func init() {
	addCmd.Flags().StringVarP(&projectPath, "project path", "p", "", "optional shojo.yaml path to add package to")
	rootCmd.AddCommand(addCmd)
}
```

Com duas funções já se consegue registrar um método, dando flexbilidade de poder descrever ele nos diversos níveis de informação e, uma vantagem do Cobra, é permitir que depois sejam gerados scripts de autocomplete para a shell que o usuário estiver utilizando; aumentando mais ainda a experiência dele.

E isolando a responsabilidade de CLI para esta pasta CMD facilita com que outras pessoas que queiram adicionar ou remover melhorias somente a CLI já tenham o código isolado ali; ou até mesmo amanhã ou depois apareça outra ferramenta melhor que o cobra para tal, facilitará sua subistituição.

Além de tudo isso, como a responsabilidade fica isolada, reconhecimento de padrões reptidos no código ficam fáceis de serem dectados e aprimorados, evitando a redundância e removendo possíveis pontos de falha -- além de custo de manutenção.

Tal estrutura facilita o desenvolvimento de CLIs em Go e aprimora o desenvolvimento de um pacote Go em si; isto porque permite com que o projeto seja consumido e derivado em outras aplicações. CLIs feitas de outras maneiras podem acabar limitando a aplicabilidade do projeto como um todo. Por isto este padrão foi criado neste projeto para poder auxiliar o desenvolvimento uma vez que nada parecido na comunidade existe.

Introduzindo assim o padrão CCP (CMD Controllers Pkg) que muito foi baseado no [MVC (Model View Controller)](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) de web.

![41584528552_cf4ad8817b_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660871892220/QBXi41Wj1.jpg align="left")

"[Paper plane](https://www.flickr.com/photos/66125057@N05/41584528552)" by [engine9.ru](https://www.flickr.com/photos/66125057@N05) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

## Banco de dados serverless

Uma das ferramentas utilizadas digna de ser elaborada um pouco mais é o [badger](https://github.com/dgraph-io/badger), por se tratar de um tipo de banco de dados que muitos desenvolvedores não são expostos: serverless.

Caso conheça soluções como o [MongoDB](https://www.mongodb.com/) ou [Redis](https://redis.io/), pode pensar no Badger de maneira similar a eles por ser orientado a chave-valor, só que eles precisam de uma aplicação externa à sua para funcionar.

O Badger funciona da seguinte maneira: toda vez que a sua aplicação precisar fazer um CRUD (Create Read Update Delete) no banco de dados ela irá instanciar um processo dentro do Badger para tratar isso, e ele só irá viver enquanto a operação estiver sendo realizada.

Há vantagens para se utilizar bancos de dados assim:

- aplicações com um cliente ajudam uma vez que os processos são travados e executados em ordem no mesmo host, evitando uma pletora de problemas para garantir o ACID (Atomicity, Consistency, Isolation, Durability);
- otimizado para SSDs -- considerando que é uma aplicação que rodará em máquinas de desenvolvedores, pode se traçar uma correlação com eles utilizarem SSDs por questão de tempo/retorno;
- dados leves, o que permitem otimizações que bancos de dados de multi-propósito não conseguem entregar;
- sem overhead de instalar nada a mais e executar, se trata de uma biblioteca da própria linguagem;
- fácil de se distribuir uma vez que reside dentro da aplicação e não externo a ela;
- simples pro desenvolvedor uma vez que se trata de uma interface de key-value;
- debug e testes mais robustos;
- etc;

![4011904299_abe6d73305_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660872047866/N7EzMEHek.jpg align="left")

"[Kitchen](https://www.flickr.com/photos/43548259@N03/4011904299)" by [designbuildinhabit](https://www.flickr.com/photos/43548259@N03) is licensed under [CC BY-ND 2.0](https://creativecommons.org/licenses/by-nd/2.0/?ref=openverse).

# Container For Developers (CFD)

Como já mencionado, Shojo é derivado de uma das ferramentas que nasceram de necessidades internas da empresa que trabalho, só que ainda existem muitas outras que já foram feitas esperando para serem distribuídas como padrões FOSS. Para isto o grupo [Container For Developers (CFD)](https://github.com/Fazendaaa/CFD) foi criado, nele todos este processo será listado e distribuído para que, desta maneira, outros possam se beneficiar delas.

O CFD nasceu para:

- ser um espaço onde soluções reais para problemas do dia a dia possam ser descritas e implementadas de maneria simples para que mesmo um iniciante em programação possa contribuir;
- distribuir os encontrados de maneira aberta, a fim de seguir o princípio do FAIR;
- padrozinar mais interfaces e processos do que implementações em si;
- distribuir as implementações realizadas como pacotes para o [Alpine](https://www.alpinelinux.org/) também, a fim de facilitar a vida de quem desenvolve em ambiente containerizado;

O porquê de se utilizar o Go para implementar esses padrões além dos motivos já citados:

- vontade de aprender;
- bom ferramental para testes;
- linguagem com regras que ajudam a remover o sotaque em uma codebase, permitindo uma homogenidade de implementação;
- como as ferramentas tiveram um só autor em sua forma original e na sua reimplementação, sendo que as originais algumas foram feitas em R e outras em Python, foi mapeado que Go atenderia melhor do que as outras duas;

Como todos os projetos serão similiares ao Shojo e a sua estruturação de projeto, seguindo o CCP; bindings poderão ser facilmente feitos para outras linguagens e interfaces de entradas e saídas de dados além da CLI, isto porque as funções expostas dentro da pasta `controllers` serão expostas como API do sistema, facilitando o syscall e que sejam consumidas das mais diferentes maneiras. E isto permitirá que em um futuro novas camadas de I/O (Input/Output) sejam adicionadas no mesmo repositório adicionando pastas na raíz do projeto como:

- `front`: caso a aplicação tenha como ser bootada através de uma página web;
- `gui`: caso a aplicação tenha um client nativo para ser utilizado com interface gráfica gerida pelo sistema;
- `api`: caso a aplicação exponha endpoints futuramente para serem consumidos através de requisições [REST](https://www.redhat.com/en/topics/api/what-is-a-rest-api) ou até mesmo [GraphQL](https://graphql.org/)

Derivando assim outros dois padrões da mesma familia do CCP:

- **FCP**: Front Controller Pkg
- **GCP**: GUI (Graphical User Interface) Controller Pkg
- **ACP**: API (Application Programmable Interface) Controller Pkg

Isto tudo facilita por apresentar um projeto só de diversas maneiras em um só repostiório de código, facilitando:

- manutenção;
- distribuição;
- builds;
- evitar redundâncias;
- reduzir barreiras de entradas para novos desenvolvedores;
- etc;

O YAML foi o formato utilizado para os arquivos de configurações das ferramentas pela "facilidade" dele atribuída à ele: fácil processamento, leitura clara, escopos bem definidos, etc. Todavia [há](https://noyaml.com/) problemas em se utilizar ele em alguns cenários, a ideia é suportar outros formatos como TOML e JSON futuramente pra ficar a cargo do usuário decidir que formato irá usar.

![10866858246_28c2130c6f_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660871255109/ltWqeKC2k.jpg align="left")

"[Team work](https://www.flickr.com/photos/61089525@N04/10866858246)" by [Sriram Jagannathan](https://www.flickr.com/photos/61089525@N04) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/?ref=openverse).

# Em Suma

LaTex é uma ótima ferramenta de para criação de texto. Mas ao misturar ela com ambiente de código, onde o cenário de atualizações, distribuições, ambientes diferentes, etc, é muito maior do que o de edição de texto, faz com que uma necessidade para a linguagem surgisse que através de um gerenciador de pacotes.

E seguindo a abordagem de testes apresentada no último texto: [Testes vs Sondagem](https://fazenda.hashnode.dev/testes-vs-sondagem), o que foi apresentado aqui em testes isola a camada de CMD de ser testada residindo os testes apenas nas camadas de controllers e pkg; por mais que a ferramenta em si seja uma CLI, como toda a camada do CMD em si, se torna pouco crítica para a aplicação se testar ela uma vez que o código não implementa uma lógica por si só nesta camada e só injeta valores fixos em chamadas do framework utilizado.

*"Desenvolvedor ajuda desenvolvedor"*, esta frase é a ideia por trás do texto de hoje e é tão boa que poderia ter uma camiseta escrita assim. Por mais que os desenvolvedores que passem por perrengues parecidos ao citado aqui o intuito é que eles não passem mais. Tanto que há varias maneiras de ler sobre soluções que outros desenvolvedores encontraram em lugares como:

- [Hacker News feed no Telegram](https://t.me/hacker_news_feed)
- [Computerphile no YouTube](https://www.youtube.com/channel/UC9-y-6csu5WGm29I7JiwpnA)
- [Fabio Akita](https://www.youtube.com/c/FabioAkita1990)

A pluraridade de experiências faz com que o conhecimento de ferramentas e processos possam ser transladados para outras áreas que não os tenham. Chegar em um cenário onde *"não tem, não dá pra fazer"* é diferente de chegar e falar: *não tem, dá pra fazer*.

![433734311_7d42e4b9ba_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660915916346/vJdNS8L4L.jpg align="left")

"[Internet Explorer Error Message tagged](https://www.flickr.com/photos/36761653@N00/433734311)" by [Andreas Solberg](https://www.flickr.com/photos/36761653@N00) is licensed under [CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/?ref=openverse).

# Apêndice

- Ainda será escrito mais sobre documentar um projeto no Github, mas caso tiver interesse em entender mais sobre o processo, se familiarizar com o [Pandoc](https://pandoc.org/) poderá ajudar nisto;
- Altamente recomendado ler sobre a origem do Badger: [Introducing Badger: A fast key-value store written purely in Go](https://blog.dgraph.io/post/badger/);
- Um vídeo recente sobre Go que possa interessar os que ainda não conhecem a linguagem: [
Learn The Basics of Google's Go Lang in About 15 Minutes (using a Raspberry Pi)](https://youtu.be/GKbw__qM1Jw);
- Para coisas mais simples feitas em LaTex muitas vezes a compatiblidade pode ser feita pelo [MathJax](https://www.mathjax.org/), que é uma biblioteca JavaScript feita para renderizar LaTex;
- Um pacote de automatizar publicar em repos diferentes será escrito explicando como colocar o processo de subir um pacote no AUR e Alpine;
- Além que será escrito sobre a parte de Github Actions com um post para o [RSMD](https://github.com/Fazendaaa/RSMD);
- Ainda sobre Hugo e LaTex, um texto será escrito de como trabalhar com um pipe de automação de publicação de sites feito em Hugo mas sem a necessidade de usar ferramentas de programação, mas sim uma opção self-hosted similar ao Overleaf.

![49195743666_633e7fb54f_k.jpg](https://cdn.hashnode.com/res/hashnode/image/upload/v1660917051507/-dRFHcsPD.jpg align="left")

"[Wideband Radio Cal Tech Telescope](https://www.flickr.com/photos/99241048@N04/49195743666)" by [RS2Photography](https://www.flickr.com/photos/99241048@N04) is licensed under [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nd-nc/2.0/jp/?ref=openverse).

# Referências

- [Fullmetal Alchemist: 10 Awesome Roy Mustang Quotes](https://www.cbr.com/fullmetal-alchemist-10-awesome-roy-mustang-quotes/)
- [Introducing Badger: A fast key-value store written purely in Go](https://blog.dgraph.io/post/badger/)

