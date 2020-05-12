require 'httparty'
require 'byebug'

require_relative '../lib/ibge_consumer'

RSpec.describe 'IBGEConsumer' do
  describe "#list_ufs" do
    it 'returns the list with all ufs' do
      response = IBGEConsumer.new.list_ufs

      expect(response.count).to eq 27
      expect(response.first["sigla"]).to eq "RO"
      expect(response.first["nome"]).to eq "Rondônia"
    end
  end

  describe "#list_names_by_uf" do
    it 'returns the list of names by uf' do
      response = IBGEConsumer.new.list_names_by_uf("Kelly", "SP")
      expect(response).to_not be_nil
      expect(response[0]["nome"]).to eq "KELLY"
    end

    it 'returns nil when the uf doesnt exist' do
      response = IBGEConsumer.new.list_names_by_uf("Kelly", "ZZ")
      expect(response).to be_nil
    end
  end
end
