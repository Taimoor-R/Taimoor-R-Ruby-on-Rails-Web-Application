Rails.application.routes.draw do
  resources :orders
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  resources :line_items
  resources :carts
  resources :orders
  root 'homepage#index', as: 'homepage_index'
  get 'collectables/index'
  get 'music/index'
  get 'movies/index'
  get 'carts/show'
  get 'movies' , to:  'movies#index'
  get 'collectables' , to:  'collectables#index'
  get 'music' , to:  'music#index'
  resources :catagories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
