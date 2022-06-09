Rails.application.routes.draw do
  
	resource :users, only: [:create]
	post "/login", to: "users#login"
	delete '/logout/:id' => 'users#logout'

	namespace :api do
		namespace :v1 do
			# resources :breeds
			get "/breeds", to: "breeds#index"
			post "/breeds/save", to: "breeds#create"
		end
	end

end