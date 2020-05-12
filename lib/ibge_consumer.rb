class IBGEConsumer
  attr_accessor :ufs_list

  def initialize
    response = HTTParty.get("https://servicodados.ibge.gov.br/api/v1/localidades/estados/")
    @ufs_list = response.parsed_response
  end

  def list_ufs
    ufs_list
  end

  def list_names_by_uf(name, uf)
    uf_details = ufs_list.select {|x| x["sigla"] == uf}.first
    response = HTTParty.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{name}?localidade=#{uf_details['id']}")
    response.parsed_response
  end

  def list_names_by_gender(name, uf, gender)
    uf_details = ufs_list.select {|x| x["sigla"] == uf}.first
    response = HTTParty.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{name}?localidade=#{uf_details['id']}&sexo=#{gender}")
    response.parsed_response
  end
end
