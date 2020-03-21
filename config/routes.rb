Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}
  # omniauth_callbacks: 'users/omniauth_callbacks'
  # 'users/auth/google_oauth2/callback'

  resources :users do
    resources :recipes, only: [:new, :index]
    #=> /users/:user_id/recipes -- user_recipes_path
    #=> /users/:user_id/recipes/new -- new_user_recipe_path
  end

  resources :categories do
    resources :recipes, only: [:new, :index]
    #=> /categories/category_id/recipes
    #=> /categories/category_name/recipes/new 
  end

  post '/categories/:category_id/recipes/new', to: 'recipes#new'

  # /categories/chicken/recipes -> loads chicken recipes
  # /recipes -> loads all recipes

  # /categories/chicken/recipes/new -> creates new chicken recipe

  root to: 'home#index'
  
  get '/recipes', to: 'recipes#index'
  get 'recipes/new', to: 'recipes#new'
  get '/search', to: 'recipes#search', as: 'search_recipes'
  get 'recipes/:id/edit', to: 'recipes#edit', as: 'recipe_edit'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/user_recipes', to: 'user_recipes#index', as: 'saved_recipes'
  #get '/user_recipes/:id', to: 'user_recipes#show', as: 'user_recipe'
  post '/recipes', to: 'recipes#create'
  post '/recipes/new', to: 'recipes#new'
  post 'user_recipes', to: 'user_recipes#create'
  
  patch '/recipes/:id', to: 'recipes#update'

  #Check this, then add "remove from recipe box" button to show page
  delete '/user_recipes', to: 'user_recipes#destroy', as: 'user_recipes_destroy'
  delete '/recipes/:id', to: 'recipes#destroy', as: 'recipes_destroy'

end 
