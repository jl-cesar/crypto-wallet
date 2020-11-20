Rails.application.routes.draw do
  resources :mining_types
  # get 'home/index'
  #get '/', to: 'home#index'

  # DEFINE INDEX INICIAL PARA A ROTA "/"
  root "home#index" 

  resources :coins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
