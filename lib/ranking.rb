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

  def self.name_by_city_options
    ibge_consumer_city = IBGEConsumerCity.new

    puts "\nQual nome voce deseja consultar?"
    name = gets.chomp

    puts "\nInforme o nome da cidade?"
    name_city = gets.chomp

    cities = ibge_consumer_city.list_names_by_city(name, name_city)
    cities.each do |city|
      puts "#{city["id"]} - #{city["nome"]}"
    end

    #Ranking Geral
    table = Terminal::Table.new do |t|
      t.title = "Ranking para o nome #{name} na cidade de #{name_city}"
      t.headings = ['Periodo', 'Frequencia']

      next if cities[0].nil?

      cities[0]["res"].each do |item|
        t.add_row [item["periodo"].delete("["), item["frequencia"]]
        t << :separator
      end
    end
    puts table

    #Ranking por sexo feminino
    # cities = ibge_consumer_city.list_names_by_gender(name, name_city, "F")
    # female = cities.sexo
    # table = Terminal::Table.new do |t|
    #   t.title = "Ranking para o nome #{name} - Mulheres"
    #   t.headings = ['Periodo', 'Frequencia']
    #
    #   next if female[0].nil?
    #
    #   female[0]["res"].each do |item|
    #     t.add_row [item["periodo"].delete("["), item["frequencia"]]
    #     t << :separator
    #   end
    # end
    # puts table

    # #Ranking por sexo feminino
    # table = Terminal::Table.new do |t|
    #   t.title = "Ranking para o nome #{name} - Homens"
    #   t.headings = ['Periodo', 'Frequencia']
    #
    #   next if female[0].nil?
    #
    #   male_names[0]["res"].each do |item|
    #     t.add_row [item["periodo"].delete("["), item["frequencia"]]
    #     t << :separator
    #   end
    # end
    # puts table

  end
end
