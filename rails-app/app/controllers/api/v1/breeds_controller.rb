module Api
  module V1
    class BreedsController < ApplicationController

      require 'json'
      require 'rest-client'
      require 'open-uri'

      before_action :authorized, :set_breed, only: %i[ show update destroy ]

      def index
        #render json: Breed.all
        url = 'https://api.thecatapi.com/v1/breeds'
        response = RestClient.get(url)
        render json: response
      end

      def get_api_data
        url = 'https://api.thecatapi.com/v1/breeds'
        response = RestClient.get(url)
        render json: response
      end

    end
  end
end