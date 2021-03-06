# README

**Configuração do Gemset**

Dentro da pasta do projeto, crie os arquivos `.ruby-version` e `.ruby-gemset` e depois entre novamente na pasta para carregar as novas configurações.
```bash
$ echo "ruby-2.6.3" > .ruby-version && echo "berserkers" > .ruby-gemset
$ cd .
```

**Instalação das dependências**

A ferramenta `bundle` instalará todas as gems que foram definidas no Gemset do projeto.
```bash
$ gem install bundle
$ bundle install
```

**Configuração do banco de dados**

Primeiramente é necessário criar o arquivo de setup de banco: `config/database.yml`.
```bash
$ cp config/database.example.yml config/database.yml
```

Por fim, crie o banco de dados, rode as migrations e popule o mesmo.

```bash
$ rails db:create db:migrate db:seed
```

**Start do servidor**
```bash
$ rails s
```

**URL para acessar**

```bash
$ https://acompanhai.herokuapp.com/

$ https://acompanhai.herokuapp.com/admin

$ localhost:3000/

$ localhost:3000/admin
```

**LICENÇA**

```bash

$ Este projeto utiliza a licença MIT veja em LICENSE.md para mais detalhes
  
``