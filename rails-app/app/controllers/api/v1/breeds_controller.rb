class Api::V1::BreedsController < ApplicationController
	before_action :authorize
	before_action :set_breed, only: %i[ show update destroy ]

	require 'rest-client'

	def index
		@breeds = Breed.all
		render json: @breeds
	end

	def show
		render json: @breed
	end

	def create
	  @breed = Breed.new(breed_params)
		if @breed.save
			render json: @breed, status: :created, location: @breed
		else
			render json: @breed.errors, status: :unprocessable_entity
		end
	end

	def update
		if @breed.update(breed_params)
			render json: @breed
	  	else
			render json: @breed.errors, status: :unprocessable_entity
	  	end
	end
  
	def destroy
		@breed.destroy
	end

	def destroy_all
		Breed.destroy_all
	end

	def save_api_data
		response = RestClient.get 'https://api.thecatapi.com/v1/breeds?api_key=70a2b553-5861-4edb-ab44-0e3d84cc4465'
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
				:image => b['image']
			)
		end
	end
  
	private
	  
	def set_breed
		@breed = Breed.find(params[:id])
	end
  
	def breed_params
		params.fetch(:breed).permit!
	end

end