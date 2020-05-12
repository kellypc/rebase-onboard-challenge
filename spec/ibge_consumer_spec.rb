require 'httparty'
require 'byebug'

require_relative '../lib/ibge_consumer'

RSpec.describe 'IBGEConsumer' do
  it 'returns the list with all ufs' do
    response = IBGEConsumer.new.list_ufs

    expect(response.count).to eq 27
    expect(response.first["sigla"]).to eq "RO"
    expect(response.first["nome"]).to eq "Rondônia"
  end
end
