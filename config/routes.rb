Rails.application.routes.draw do
  resources :carts
  get 'collectables/index'
  get 'music/index'
  get 'movies/index'
  root 'homepage#index', as: 'homepage_index'
  get 'movies' , to:  'movies#index'
  get 'collectables' , to:  'collectables#index'
  get 'music' , to:  'music#index'
  resources :catagories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
