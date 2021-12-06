Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  resources :line_items, :except=>[:destroy,:new,:show,:edit,:index] # removes unwanted routes by negating route access
  resources :carts
  resources :orders, :except=>[:show,:edit] # removes unwanted routes by negating route access
  root 'homepage#index', as: 'homepage_index'
  get 'contact', to: 'homepage#contact'
  get 'admin', to: 'homepage#admin'
  get 'collectables/index'
  get 'music/index'
  get 'movies/index'
  get 'carts/show'
  get 'movies' , to:  'movies#index'
  get 'collectables' , to:  'collectables#index'
  #get 'orders' , to:  'orders#index'
  get 'music' , to:  'music#index'
  post 'request_contact', to: 'homepage#request_contact'
  #resources :catagories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
