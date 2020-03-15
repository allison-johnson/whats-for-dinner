Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get '/recipes', to: 'recipes#index'
  get 'recipes/new', to: 'recipes#new'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  post '/recipes', to: 'recipes#create'

end 
