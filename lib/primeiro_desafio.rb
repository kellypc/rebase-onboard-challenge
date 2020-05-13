require 'httparty'
require 'byebug'
require 'terminal-table'

require_relative 'ibge_consumer'
require_relative 'ibge_consumer_city'
require_relative 'table_printer'
require_relative 'ranking'

TablePrinter.show_welcome_menu

puts "Qual a opção desejada?"
menu_option = gets.chomp

if menu_option == "1"
  Ranking.name_by_uf_options
elsif menu_option == "2"
  Ranking.name_by_city_options
end
