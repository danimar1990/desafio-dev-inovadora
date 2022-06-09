class Api::V1::BreedsController < ApplicationController

	require 'rest-client'

	#before_action :authorize
	
  def index
    @breeds = Breed.all
  end

	def create
		response = RestClient.get 'https://api.thecatapi.com/v1/breeds'
		json = JSON.parse response
		json.map do |b|
			Breed.create!(
        :weight => b['weight'],
        :shortname => b['id'],
        :name => b['name'],
        :cfa_url => b['cfa_url'],
        :vetstreet_url => b['vetstreet_url'],
        :vcahospitals_url => b['vcahospitals_url'],
        :temperament => b['temperament'],
        :origin => b['origin'],
        :country_codes => b['country_codes'],
        :country_code => b['country_code'],
        :description => b['description'],
        :life_span => b['life_span'],
        :indoor => b['indoor'],
        :lap => b['lap'],
        :alt_names => b['alt_names'],
        :adaptability => b['adaptability'],
        :affection_level => b['affection_level'],
        :child_friendly => b['child_friendly'],
        :dog_friendly => b['dog_friendly'],
        :energy_level => b['energy_level'],
        :grooming => b['grooming'],
        :health_issues => b['health_issues'],
        :intelligence => b['intelligence'],
        :shedding_level => b['shedding_level'],
        :social_needs => b['social_needs'],
        :stranger_friendly => b['stranger_friendly'],
        :vocalisation => b['vocalisation'],
        :experimental => b['experimental'],
        :hairless => b['hairless'],
        :natural => b['natural'],
        :rare => b['rare'],
        :rex => b['rex'],
        :suppressed_tail => b['suppressed_tail'],
        :short_legs => b['short_legs'],
        :wikipedia_url => b['wikipedia_url'],
        :hypoallergenic => b['hypoallergenic'],
        :reference_image_id => b['reference_image_id'],
        :image => b['image'],
      )
		end

	end

end