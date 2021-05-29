Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # restaurants
  get 'restaurants', to: 'restaurants#index'
  get 'restaurants/:business_id', to: 'restaurants#show'
end
