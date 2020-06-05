# rebase-onboard-challenge
Este é um desafio proposto pela Campus Code em parceria com a Rebase. Nesse projeto iremos consumir a API do IBGE.

# Rebase Onboard

O Rebase Onboard é um projeto desenvolvido em ruby puro com o auxílio de algumas gems.

O sistema oferece consultas à API do IBGE e oferece resultados das buscas no terminal e organizados por tabelas.

## Tabela de Conteúdo

* [Instalação](#instalacao)
* [Desafios Propostos](#Desafios)
* [Testes com RSpec](#testes-com-rspec)
* [Lista de gems utilizadas](#lista_de_gems_utilizadas)


## Instalação
Obs: Para esse projeto utilizei o sistema operacional MACOS Catalina
Usei ora o editor de texto Atom junto com o Iterm  e ora com o VS Code.

1. Clone o projeto.

	~~~ sh
	$ git@github.com:kellypc/rebase-onboard-challenge.git
	~~~

2. Installe as Gems.

	~~~ sh
	$ bundle install
	~~~
  
## Desafios

Esse projeto não conta com interface do usuário, sendo assim, realizaremos a consulta pelo terminal:
~~~ sh
$ ruby lib/primeiro_desafio.rb
~~~

Abra o arquivo no terminal 
1. Consumir a API do IBGE Nomes e Listar os nomes das Ufs.
2. Listar os nomes da cidade escolhida 
3. Mostrar o percentual que os resultados representam

O projeto foi construído com TDD (Test Driven Development).
Para instalar o rspec consulte a documentação deles: https://github.com/rspec/rspec
1. Execute todos os  testes

	~~~ sh
	$ bundle exec rspec
	~~~
	
## Lista de gems utilizadas
 gem 'rspec', 
 gem 'rake', 
 gem 'httparty', 
 gem 'byebug'
 gem 'capybara', 
 gem 'terminal-table'

> Status do Projeto: Em desenvolvimento :warning: