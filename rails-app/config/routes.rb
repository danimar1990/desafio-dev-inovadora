Rails.application.routes.draw do
  
  resource :users, only: [:create]
  post "/login", to: "users#login"

  namespace :api do
    namespace :v1 do
      get 'breeds', to: 'breeds#index'
      get 'save', to: 'breeds#get_api_data'
      resources :breeds
    end
  end

end