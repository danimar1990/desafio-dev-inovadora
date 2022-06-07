Rails.application.routes.draw do
  get 'breeds', to: 'breeds#show_json_breed'
  resources :breeds
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end