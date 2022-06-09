class Api::V1::BreedsController < ApplicationController

	require 'rest-client'

	before_action :authorize
	
	def index
		url = 'https://api.thecatapi.com/v1/breeds'
		response = RestClient.get(url)
		render json: response
	end

	def create
		response = RestClient.get 'https://api.thecatapi.com/v1/breeds'
		json = JSON.parse response
		json['data'].map do |b|
			Breed.create!(:name => b['name'])
		end

	end

end