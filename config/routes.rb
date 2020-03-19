Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get '/recipes', to: 'recipes#index'
  get 'recipes/new', to: 'recipes#new'
  get 'recipes/:id/edit', to: 'recipes#edit'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/user_recipes', to: 'user_recipes#index'
  #get '/user_recipes/:id', to: 'user_recipes#show', as: 'user_recipe'
  post '/recipes', to: 'recipes#create'
  post '/recipes/new', to: 'recipes#new'
  post 'user_recipes', to: 'user_recipes#create'
  
  patch '/recipes/:id', to: 'recipes#update'

  #Check this, then add "remove from recipe box" button to show page
  delete '/user_recipes', to: 'user_recipes#destroy', as: 'user_recipes_destroy'

end 
