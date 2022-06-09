Rails.application.routes.draw do

	resource :users, only: [:create]
	post '/login', to: 'users#login'
	delete '/logout/:id' => 'users#logout'

	namespace :api do
		namespace :v1 do
			resources :breeds
			post '/breeds/save_api_data', to: 'breeds#save_api_data'
			post '/breeds/destroy_all', to: 'breeds#destroy_all'
		end
	end

end