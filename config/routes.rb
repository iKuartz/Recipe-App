Rails.application.routes.draw do
  get 'recipe_foods/new'
  resources :foods
  resources :shopping_list, only: [:show]
  post '/shopping_list/:recipe_id', to: 'shopping_list#show', as: 'shopping_show'
  devise_for :users

  resources :recipes, only: [:index, :show, :new, :create, :destroy, :put ] do
    resources :recipe_foods, path: 'food', only: [:destroy, :new, :create]
  end

  resources :inventories, except: :update do
    resources :inventory_foods, except: :update
  end

  match 'recipes/:recipe_id' => 'recipes#toogle_public', as: :toogle_public, via: :patch
  match 'public_recipes' => 'recipes#public_recipes', as: :public_recipes, via: :get

  root 'recipes#public_recipes'
end
