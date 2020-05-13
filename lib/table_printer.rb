class TablePrinter
  def self.show_welcome_menu
    table = Terminal::Table.new do |t|
      t.title = "Bem-vindo ao Sistema de Consulta de Nomes"
      t.add_row ['Escolha uma opção abaixo:']
      t.add_separator
      t.add_row ['1 - Nomes mais comuns por estado']
      t.add_row ['2 - Nomes mais comuns por cidade']
      t.add_row ['3 - Uso de um nome ao longo dos anos']
      t.add_row ['4 - Sair']
    end
    puts table
  end

  def self.general_ranking(name, names_by_uf)
    table = Terminal::Table.new do |t|
      t.title = "Ranking para o nome #{name}"
      t.headings = ['Periodo', 'Frequencia']

      next if names_by_uf[0].nil?

      names_by_uf[0]["res"].each do |item|
        t.add_row [item["periodo"].delete("["), item["frequencia"]]
        t << :separator
      end
    end
    puts table
  end

  def self.females_ranking(name, female_names)
    table = Terminal::Table.new do |t|
      t.title = "Ranking para o nome #{name} - Mulheres"
      t.headings = ['Periodo', 'Frequencia']

      next if female_names[0].nil?

      female_names[0]["res"].each do |item|
        t.add_row [item["periodo"].delete("["), item["frequencia"]]
        t << :separator
      end
    end
    puts table
  end

  def self.males_ranking(name, male_names)
    table = Terminal::Table.new do |t|
      t.title = "Ranking para o nome #{name} - Homens"
      t.headings = ['Periodo', 'Frequencia']

      next if male_names[0].nil?

      male_names[0]["res"].each do |item|
        t.add_row [item["periodo"].delete("["), item["frequencia"]]
        t << :separator
      end
    end
    puts table
  end


end
