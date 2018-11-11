Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :ingredients
  get 'cupboard/index'
  devise_for :users
  resources :recipes
  root 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/recipes' => 'static_pages#recipes'
  get '/ingredients' => 'static_pages#ingredients'
  
  get '/admin', to: 'user#admin_login' 
  get '/logout', to: 'user#logout'

  get '/cupboard/clear', to: 'cupboard#clearCupboard'
  get '/cupboard', to: 'cupboard#index'
  get '/cupboard/:id', to: 'cupboard#add'
  get '/cupboard/remove/:id', to: 'cupboard#remove'
  
  post '/cupboard/setQuantity/:id', to: 'cupboard#setQuantity'
  
  post '/search' => 'recipes#search'
 
  resources :ingredients, :collection => { :edit_multiple => :post, :update_multiple => :put }
end
