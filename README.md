# Container Docker

- Durante a execução dos comandos a seguir, é necessário já termos o docker instalado na máquina. Para verificar se temos o Docker instalado podemos usar o seguinte comando.

```sh
    docker --version
```

> Assim, se já instalado, verificamos a versão do Docker na máquina.

1 - Verificado que a máquina possui o Docker instalado, iremos criar uma imagem para a criação do container. Iremos utillizar o arquivo Dockerfile (disponibilizado no repositório) para estarmos criando um container que no exemplo irá disponibilizar um servidor web, o nginx.

2 - Iremos agora buildar essa nossa imagem, para isso, dentro da pasta em que contém o arquivo Dockerfile iremos inserir o seguinte comando

```sh
    docker build -t teste .
```
> O -t serve para "taguiar" nossa imagem, no caso dar um nome (tag) para nossa imagem. O ponto no final é para representar o repositorio atual em que estamos, onde contém o Dockerfile.

- Após isso, ele irá realizar o download dos serviços configurados dentro da imagem.

3 - Para verificar após a conclução da instalação, usamos o comando:

```sh
  docker images
```
> Após esse comando, iremos verificar nosso nova imagem "teste".

4 - Agora com nossa imagem criada, iremos criar nosso container utilizando essa imagem. Para tanto iremos utilizar o seguinte comando:

```sh
  docker run -ti teste
```
> Após isso, cairemos dentro da nossa imagem, concluindo nossa criação do container.


## Estados de um container

- Antes de aprofundar nos diferentes tipos de estados de um container, vamos primeiro ver como encontrar o estado de qualquer container no Docker. Por padrão, o comando docker ps exibe o estado
atual de todos os containers :

```sh
  docker ps
```
> Na saída exibe todos os containers presentes na máquina com seus STATUS (quinta coluna) e vários outros detallhes 

### Created

- O docker atribui esse estado “created” aos containers que nunca foram iniciados desde que foram criados. Portanto, nenhuma CPU ou memória é usada pelos containers nesse estado:

```sh
  docker create -- name mycontainer httpd
```

```sh
docker inspect -f ’ {{. State . Status }} ’ mycontainer
```

> Neste exemplo foi craido um container usando a imagem oficial do Docker de [httpd](https://hub.docker.com/_/httpd). Como
usamos o comando docker create para iniciar o container, o status após o comando é mostrado como created.

### Running:

```sh
  docker create -- name mycontainer httpd
  docker inspect -f ’ {{. State . Status }} ’ mycontainer
```

```sh
  docker start mycontainer
```
```sh
  docker inspect -f ’ {{. State . Status }} ’ mycontainer
```
> No exemplo acima, utilizamos o mesmo exemplo apresentado no estado de created. Porém,
em seguida iniciamos o mycontainer utilizando o comando docker start, passando a ter o
estado de running.

### Restarting:

- Simplificando, esse estado denota que o container está em processo de reinicialização. O
Docker oferece suporte a quatro tipos de políticas de reinicialização: ( no, on-failure, always,
except-stopped ). A política de reinicialização decide o comportamento do container quando
ele sai.

```sh
  docker run - itd -- restart = always -- name mycontainer centos :7 sleep 5
```
> O comando acima executará o mycontainer e executará o comando sleep 5 e sairá. Porém,
como utilizamos a política de reinicialização para esse container, ele reiniciará automatica-
mente o contêiner após sua saída. Após 5 segundos, o estado do container será restarting.

### Exited:

- Esse estado é alcançado quando o processo dentro do container termina. Nesse estado,
nenhuma CPU e memória são consumidas pelo contêiner
O container pode ter vários motivos para terminar:
– O processo dentro do container foi concluído e, portanto, saiu;
– O processo dentro do container encontrou uma execução durante a execução;
– Um container é pausado intencionalmente usando o comando:

```sh
  docker stop
```
- No exemplo a seguir, iniciaremos um contêiner centos, mycontainer, e passamos o comando sleep 10. Isso
sairá do contêiner após 10 segundos de suspensão. Podemos verificar o mesmo executando o
seguinte comando após 10 segundos.

```sh
  docker inspect -f ’ {{. State . Status }} ’ mycontain
```
> A saída será: exited 


