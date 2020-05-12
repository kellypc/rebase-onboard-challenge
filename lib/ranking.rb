class Ranking
  def self.name_by_uf_options
    ibge_consumer = IBGEConsumer.new

    puts "\nQual nome voce deseja consultar?"
    name = gets.chomp

    ufs = ibge_consumer.list_ufs
    ufs.each do |uf|
      puts "#{uf["id"]} - #{uf["sigla"]} - #{uf["nome"]}"
    end

    puts "Em qual UF (informe a sigla)?"
    uf_code = gets.chomp

    names_by_uf = ibge_consumer.list_names_by_uf(name, uf_code)
    TablePrinter.general_ranking(name, names_by_uf)

    female_names = ibge_consumer.list_names_by_gender(name, uf_code, "F")
    TablePrinter.females_ranking(name, female_names)

    male_names = ibge_consumer.list_names_by_gender(name, uf_code, "M")
    TablePrinter.males_ranking(name, male_names)
  end
end
