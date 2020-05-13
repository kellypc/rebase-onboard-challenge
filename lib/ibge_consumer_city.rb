class IBGEConsumerCity
  attr_accessor :cities_list

  def initialize
    response = HTTParty.get("https://servicodados.ibge.gov.br/api/v1/localidades/municipios/")
    @cities_list = response.parsed_response
  end

  def list_cities
    cities_list
  end

  def list_names_by_city(name, city)
    city_details = cities_list.select {|x| x["nome"] == city}.first
    return if city_details.nil?
    response = HTTParty.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{name}?localidade=#{city_details['id']}")
    response.parsed_response
  end

  def list_names_by_gender(name, city, gender)
    city_details = cities_list.select {|x| x["nome"] == city}.first
    response = HTTParty.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{name}?localidade=#{city_details['id']}&sexo=#{gender}")
    response.parsed_response
  end
end
