Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
devise_for :users
  root to: "inventories#show"
  get "foods", to: "foods#index"
  get "recipes", to: "recipes#index"
  get "recipes/:recipe_id", to: "recipes#show"
  get "public_recipes", to: "recipes#public_recipes"
  get "general_shopping_list", to: "shopping_lists#index"
  get "inventories", to: "inventories#index"
  get "inventories/:inventory_id", to: "inventories#show"
  # Defines the root path route ("/")
  # root "articles#index"
  get "/inventories", to: "inventories#index"

end
