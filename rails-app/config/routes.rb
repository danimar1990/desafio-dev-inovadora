Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'breeds', to: 'breeds#index'
      get 'save', to: 'breeds#get_api_data'
      resources :breeds
    end
  end
end