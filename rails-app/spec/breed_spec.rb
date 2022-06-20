require 'rails_helper' 

describe 'BreedsController', type: :request do
	context 'index' do
	  it 'deve retornar status 200' do
		get api_v1_breeds_path
  
		expect(response).to have_http_status(200)
	  end
  
	  it 'deve retornar todas as raças' do
		breed = Breed.create(shortname: 'DHV',
						name: 'Danimar')
		other_breed = Breed.create(shortname: 'DHV-2',
			name: 'Danimar')
		get '/api/v1/breeds'
  
		expect(response).to have_http_status(200)
		expect(response.body).to include breed.shortname
		expect(response.body).to include breed.name
		expect(response.body).to include other_breed.shortname
		expect(response.body).to include other_breed.name
	  end
	end

	context 'show' do
		it 'deve retornar uma raça' do
		  breed = Breed.create(shortname: 'DHV',
							 name: 'Danimar')
	
		  get api_v1_breed_path(breed)
	
		  expect(response).to have_http_status(200)
		  expect(response.body).to include breed.shortname
		  expect(response.body).to include breed.name
		end
	
		it 'deve retornar not found se raça indisponível' do
		  get api_v1_breed_path(id:999)
	
		  expect(response).to have_http_status(:not_found)
		end
	end
  end